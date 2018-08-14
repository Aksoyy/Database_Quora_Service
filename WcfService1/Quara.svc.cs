using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;

namespace WcfService1
{
    // NOT: "Service1" sınıf adını kodda, svc'de ve yapılandırma dosyasında birlikte değiştirmek için "Yeniden Düzenle" menüsündeki "Yeniden Adlandır" komutunu kullanabilirsiniz.
    // NOT: Bu hizmeti test etmek üzere WCF Test İstemcisi'ni başlatmak için lütfen Çözüm Gezgini'nde Service1.svc'yi veya Service1.svc.cs'yi seçin ve hata ayıklamaya başlayın.
    public class Quara : IQuara
    {
        static SqlConnection connection = new SqlConnection("Data Source=localhost; Initial Catalog=quara; Integrated Security=true");  // Bir kere açıldıktan sonra sonraki açılmalarda tekrar tekrar açılmaması için kullanılmaktadır.

        public string Login(string userName, string password)
        {
            string sessionKey = String.Empty;
            connection.Open();
            SqlCommand cmd = new SqlCommand(String.Format("select ul.user_login_id from dbo.User_Login ul, dbo.User_credential uc, dbo.User_Password up where uc.User_login_id = ul.User_login_id and ul.User_login_id = up.User_Login_Id and uc.User_credential_value = '{0}' and up.password = '{1}'", userName, password), connection);
            object value = cmd.ExecuteScalar();
            connection.Close();
            if (Convert.ToInt32(value) > 0) // İnt çevirme işlemidir.
            {
                LoginAllDelete(Convert.ToInt32(value)); // Üyeye ait sessionları silme işlemidir.
                connection.Open();
                sessionKey = Guid.NewGuid().ToString("N").ToUpper(); // Rastgele session üretme işlemidir. C'deki random gibidir.

                SqlCommand userSessionCmd = new SqlCommand("INSERT INTO dbo.User_Session (User_Session_id,User_login_id,Session_Key,Creation_Date,Update_Date) VALUES (@UserSessionId,@UserLoginId,@SessionKey,@CreationDate,@UpdateDate)", connection);
                SqlCommand userSessionMaxCmd = new SqlCommand("SELECT ISNULL(MAX(us.User_session_id),0) from dbo.User_Session us", connection); // Eğer boş ise 0 değeri atanmaktadır.
                object maxUserSessionId = userSessionMaxCmd.ExecuteScalar();
                userSessionCmd.Parameters.AddWithValue("@UserSessionId", Convert.ToInt32(maxUserSessionId) + 1);
                userSessionCmd.Parameters.AddWithValue("@UserLoginId", Convert.ToInt32(value));
                userSessionCmd.Parameters.AddWithValue("@SessionKey", sessionKey.ToString());
                userSessionCmd.Parameters.AddWithValue("@CreationDate", DateTime.Now);
                userSessionCmd.Parameters.AddWithValue("@UpdateDate", DateTime.Now);

                userSessionCmd.ExecuteNonQuery();
                connection.Close();
            }
            return sessionKey;
        }

        public void Logout(string sessionKey)
        {
            connection.Open();

            SqlCommand userSessionAllUpdate = new SqlCommand(String.Format("UPDATE dbo.user_session SET logical_delete_key = user_session_id where session_Key = '{0}' ", sessionKey), connection);
            userSessionAllUpdate.ExecuteNonQuery(); //Çıkış işleminde aynı değerli sessionkey'in satırı bulunmaya çalışıp, atama işlemi yapılabilmektedir.

            connection.Close();
        }

        public bool RegisterUser(string name, string lastName, string surname, string nationalityTypeCd, string username, string password)
        {
            bool result = false;

            if (!ValidateLogin(username)) // Veri tabanındaki aynı kullanıcı adının kontrolü yapılmaktadır.
            {
                connection.Open(); //SqlCommand, T-Sql sorguları ile veritabanı üzerinde sorgulama, ekleme, güncelleme, silme işlemlerini yapmak için kullanılmaktadır. 
                SqlCommand sequenceCmd = new SqlCommand("SELECT ISNULL(MAX(i.individual_id),0) from dbo.individual i", connection);
                long individualId = Convert.ToInt32(sequenceCmd.ExecuteScalar()) + 1; // Tek alanlık bir değeri geri döndürmek için kullanılmaktadır. Object tipinde veri döndürmektedir. 

                SqlCommand individualCmd = new SqlCommand("INSERT INTO dbo.individual (individual_id,name,last_name,surname,Nationality_type_cd,Creation_Date,update_date)" +
                                                                                " VALUES (@IndividualId,@Name,@LastName,@Surname,@NationalityTypeCd,@CreationDate,@UpdateDate)", connection);

                individualCmd.Parameters.AddWithValue("@IndividualId", individualId);
                individualCmd.Parameters.AddWithValue("@Name", name);
                individualCmd.Parameters.AddWithValue("@LastName", lastName);
                individualCmd.Parameters.AddWithValue("@SurName", surname);
                individualCmd.Parameters.AddWithValue("@NationalityTypeCd", nationalityTypeCd);
                individualCmd.Parameters.AddWithValue("@CreationDate", DateTime.Now);
                individualCmd.Parameters.AddWithValue("@UpdateDate", DateTime.Now);
                individualCmd.ExecuteNonQuery();

                SqlCommand sequenceLoginCmd = new SqlCommand("SELECT ISNULL(MAX(ul.user_login_id),0) from dbo.user_login ul", connection);
                long userLoginId = Convert.ToInt32(sequenceLoginCmd.ExecuteScalar()) + 1;

                SqlCommand loginCmd = new SqlCommand("INSERT INTO dbo.user_login (User_login_id,Login_state_type_cd,Creation_Date,update_date)" +
                                                                                " VALUES (@UserLoginId,@LoginStateTypeCd,@CreationDate,@UpdateDate)", connection);

                loginCmd.Parameters.AddWithValue("@UserLoginId", userLoginId);
                loginCmd.Parameters.AddWithValue("@LoginStateTypeCd", "AKTIF");
                loginCmd.Parameters.AddWithValue("@CreationDate", DateTime.Now);
                loginCmd.Parameters.AddWithValue("@UpdateDate", DateTime.Now);
                loginCmd.ExecuteNonQuery();

                SqlCommand sequencePasswordCmd = new SqlCommand("SELECT ISNULL(MAX(up.User_Password_Id),0) from dbo.user_password up", connection);
                long userPasswordId = Convert.ToInt32(sequencePasswordCmd.ExecuteScalar()) + 1;

                SqlCommand passwordCmd = new SqlCommand("INSERT INTO dbo.user_password (User_Password_Id,User_Login_Id,Password,Creation_Date,update_date)" +
                                                                                " VALUES (@UserPasswordId,@UserLoginId,@Password,@CreationDate,@UpdateDate)", connection);

                passwordCmd.Parameters.AddWithValue("@UserPasswordId", userPasswordId);
                passwordCmd.Parameters.AddWithValue("@UserLoginId", userLoginId);
                passwordCmd.Parameters.AddWithValue("@Password", password);
                passwordCmd.Parameters.AddWithValue("@CreationDate", DateTime.Now);
                passwordCmd.Parameters.AddWithValue("@UpdateDate", DateTime.Now);
                passwordCmd.ExecuteNonQuery();


                SqlCommand sequenceCredentialCmd = new SqlCommand("SELECT ISNULL(MAX(uc.user_credential_id),0) from dbo.user_credential uc", connection);
                long credentialId = Convert.ToInt32(sequenceCredentialCmd.ExecuteScalar()) + 1;
                SqlCommand credentialCmd = new SqlCommand("INSERT INTO dbo.user_credential (User_credential_id,User_credential_type_cd,User_credential_value,User_login_id,İndividual_id,Creation_Date,update_date)" +
                                                                               " VALUES (@UserCredentialId,@UserCredentialTypeCd,@UserCredentialValue,@UserLoginId,@IndividualId,@CreationDate,@UpdateDate)", connection);

                credentialCmd.Parameters.AddWithValue("@UserCredentialId", credentialId);
                credentialCmd.Parameters.AddWithValue("@UserCredentialTypeCd", "MAIL");
                credentialCmd.Parameters.AddWithValue("@UserCredentialValue", username);
                credentialCmd.Parameters.AddWithValue("@UserLoginId", userLoginId);
                credentialCmd.Parameters.AddWithValue("@IndividualId", individualId);
                credentialCmd.Parameters.AddWithValue("@CreationDate", DateTime.Now);
                credentialCmd.Parameters.AddWithValue("@UpdateDate", DateTime.Now);

                credentialCmd.ExecuteNonQuery();
                result = true;
                connection.Close();
            }
            return result;
        }

        public bool UpdateUser(string name, string lastName, string surname, string nationalityTypeCd, string sessionKey)
        {
            bool result = false;
            long userLoginId = ValidateSessionKey(sessionKey);
            if (userLoginId > 0)
            {
                connection.Open();
                SqlCommand credentialCmd = new SqlCommand(String.Format("SELECT uc.individual_id from dbo.user_credential as uc where uc.user_login_id = {0}", userLoginId), connection);
                long individualId = Convert.ToInt32(credentialCmd.ExecuteScalar());
                SqlCommand individualCmd = new SqlCommand(String.Format("UPDATE dbo.individual SET name=@Name,last_name=@LastName,surname=@Surname,Nationality_type_cd=@NationalityTypeCd,update_date=@UpdateDate where individual_id ={0}", individualId), connection);

                individualCmd.Parameters.AddWithValue("@Name", name);
                individualCmd.Parameters.AddWithValue("@LastName", lastName);
                individualCmd.Parameters.AddWithValue("@SurName", surname);
                individualCmd.Parameters.AddWithValue("@NationalityTypeCd", nationalityTypeCd);
                individualCmd.Parameters.AddWithValue("@UpdateDate", DateTime.Now);
                individualCmd.ExecuteNonQuery(); // int veri tipini geri döndürebilmektedir.
                result = true;
                connection.Close();
            }
            return result;
        }

        public bool ChangePassword(string oldPassword, string newPassword, string sessionKey)
        {
            long userLoginId = ValidateSessionKey(sessionKey);
            if (userLoginId > 0) // Üye kaydolup giriş yapmadıysa işlemi girmemektedir.
            {
                if (ValidatePassword(userLoginId, oldPassword))
                {
                    connection.Open();
                    SqlCommand individualCmd = new SqlCommand(String.Format("UPDATE dbo.user_password SET Password=@Password,update_date=@UpdateDate where User_Login_Id = {0}", userLoginId), connection);

                    individualCmd.Parameters.AddWithValue("@Password", newPassword);
                    individualCmd.Parameters.AddWithValue("@UpdateDate", DateTime.Now);
                    individualCmd.ExecuteNonQuery(); //Insert, update, delete işlemlerinde kullanılmaktadır. İşlem sonucuna göre geriye int tipinde değer döndürmektedir. 
                    connection.Close();
                    return true;
                }
            }
            return false;
        }

        private void LoginAllDelete(long userLoginId)
        {
            if (connection.State != ConnectionState.Open)
                connection.Open();
            SqlCommand userSessionAll = new SqlCommand(String.Format("SELECT user_session_id from dbo.User_Session us where us.logical_delete_key is null and us.user_login_id = {0}", userLoginId), connection);
            DataTable sessions = new DataTable();
            using (SqlDataAdapter db = new SqlDataAdapter(userSessionAll))
            {
                db.Fill(sessions);
            }
            List<long> userSessionIdList = new List<long>();
            foreach (DataRow item in sessions.Rows)
            {
                userSessionIdList.Add(Convert.ToInt32(item["user_session_id"])); //32 bitlik veriye dönüştürülmektedir.
            }
            if (userSessionIdList.Count > 0) // Üyenin daha önce girme durumunun kontrolüdür.
            {
                SqlCommand userSessionAllUpdate = new SqlCommand(String.Format("UPDATE dbo.user_session Set logical_delete_key = user_session_id where user_session_id in ({0})", String.Join(",", userSessionIdList)), connection);
                userSessionAllUpdate.ExecuteNonQuery(); //Insert, update, delete işlemlerinde kullanılmaktadır. İşlem sonucuna göre geriye int tipinde değer döndürmektedir. 
            }
            connection.Close();
        }

        private bool ValidateLogin(string username)
        {
            connection.Open();
            SqlCommand cmd = new SqlCommand(String.Format("select uc.user_login_id from dbo.User_credential uc where uc.User_credential_value = '{0}'", username), connection); // username'i value atama yapılabilmektedir.
            object value = cmd.ExecuteScalar(); //Tek alanlık değer döndürebilmektedir.
            connection.Close();
            return Convert.ToInt32(value) > 0;
        }

        private long ValidateSessionKey(string sessionKey)
        {
            connection.Open();
            SqlCommand cmd = new SqlCommand(String.Format("select us.user_login_id from dbo.user_session us where us.session_key = '{0}'", sessionKey), connection);
            object value = cmd.ExecuteScalar();
            connection.Close();
            return Convert.ToInt32(value); // En son girişteki session key döndürülebilmektedir.
        }

        private bool ValidatePassword(long userLoginId, string oldPassword)
        {
            connection.Open();
            SqlCommand individualCmd = new SqlCommand(String.Format("SELECT count(1) as count from dbo.User_Password p where p.User_Login_Id={0} and p.Password='{1}'", userLoginId, oldPassword), connection);
            object value = individualCmd.ExecuteScalar(); //Tek alanlık değer döndürebilmektedir.
            connection.Close();

            return (value != null) ? Convert.ToInt32(value) > 0 : false;
        }

        public UserInfo GetUserInfo(string sessionKey)
        {
            long userLoginId = ValidateSessionKey(sessionKey);
            if (userLoginId > 0)
            {
                connection.Open();
                SqlCommand individualCmd = new SqlCommand(String.Format("SELECT i.* from dbo.İndividual i, dbo.User_credential uc where uc.İndividual_id = i.İndividual_id  and uc.user_login_id = {0}", userLoginId), connection);
                DataTable individual = new DataTable();
                using (SqlDataAdapter db = new SqlDataAdapter(individualCmd)) // SqlDataAdapter:Select sorgusu ile verileri DataSet ya da DataTable' a doldurmaktır. 
                {
                    db.Fill(individual); //Bu çekilen verileri Fill komutu ile oluşturulan DataTable'a aktarılır.
                }
                if (individual.Rows.Count > 0)
                {
                    connection.Close();
                    return new UserInfo()
                    {
                        LastName = individual.Rows[0]["Last_Name"]?.ToString(),
                        Name = individual.Rows[0]["Name"]?.ToString(),
                        Surname = individual.Rows[0]["Surname"]?.ToString(),
                        NationalityTypeCd = individual.Rows[0]["Nationality_type_cd"]?.ToString()
                    };
                }
            }
            return null;
        }

        public List<UserInfo> GetUserInfoAll()
        {
            if (connection.State != ConnectionState.Open)
                connection.Open();
            SqlCommand individualCmd = new SqlCommand(String.Format("SELECT i.* from dbo.İndividual i;"), connection); // Quora veri tabanı ile çalışması için connection yapısı kullanılmaktadır.
            DataTable individual = new DataTable();
            using (SqlDataAdapter db = new SqlDataAdapter(individualCmd))
            {
                db.Fill(individual);  // Tabloyu doldurma işlemidir.
            }
            if (individual.Rows.Count > 0)
            {
                List<UserInfo> userInfoList = new List<UserInfo>();
                for (int i = 0; i < individual.Rows.Count; i++)
                {
                    userInfoList.Add(new UserInfo()
                    {
                        LastName = individual.Rows[i]["Last_Name"]?.ToString(),
                        Name = individual.Rows[i]["Name"]?.ToString(),
                        Surname = individual.Rows[i]["Surname"]?.ToString(),
                        NationalityTypeCd = individual.Rows[i]["Nationality_type_cd"]?.ToString()
                    });
                }
                connection.Close();
                return userInfoList;

            }
            return null;
        }

        public void NewQuestion(string title, string description, int? languageId, int? categoryId, string sessionKey)
        {
            long userLoginId = ValidateSessionKey(sessionKey);
            if (userLoginId > 0)
            {
                connection.Open(); //SqlCommand, T-Sql sorguları ile veritabanı üzerinde sorgulama, ekleme, güncelleme, silme işlemlerini yapmak için kullanılmaktadır. 
                SqlCommand sequenceCmd = new SqlCommand("SELECT ISNULL(MAX(q.Question_Id),0) from dbo.question q", connection);
                long questionId = Convert.ToInt32(sequenceCmd.ExecuteScalar()) + 1; // Tek alanlık bir değeri geri döndürmek için kullanılmaktadır. Object tipinde veri döndürmektedir. 

                SqlCommand individualCmd = new SqlCommand("INSERT INTO dbo.question (Question_Id,Title,Description,Language_Id,User_login_Id,Category_Id,Creation_Date,Update_date)" +
                                                                                " VALUES (@QuestionId,@Title,@Description,@Language_Id,@User_login_Id,@Category_Id,@Creation_Date,@Update_date)", connection);

                individualCmd.Parameters.AddWithValue("@QuestionId", questionId);
                individualCmd.Parameters.AddWithValue("@Title", title);
                individualCmd.Parameters.AddWithValue("@Description", description);
                individualCmd.Parameters.AddWithValue("@User_login_Id", userLoginId);
                individualCmd.Parameters.AddWithValue("@Language_Id", languageId);
                individualCmd.Parameters.AddWithValue("@Category_Id", categoryId);
                individualCmd.Parameters.AddWithValue("@Creation_Date", DateTime.Now);
                individualCmd.Parameters.AddWithValue("@Update_Date", DateTime.Now);
                individualCmd.ExecuteNonQuery();
                connection.Close();
            }
        }
        public void AnswerByQuestionId(int questionId, string description, string sessionKey)
        {
            long userLoginId = ValidateSessionKey(sessionKey);
            if (userLoginId > 0)
            {
                connection.Open(); //SqlCommand, T-Sql sorguları ile veritabanı üzerinde sorgulama, ekleme, güncelleme, silme işlemlerini yapmak için kullanılmaktadır. 
                SqlCommand sequenceCmd = new SqlCommand("SELECT ISNULL(MAX(a.Answer_Id),0) from dbo.Answer a", connection);
                long answerId = Convert.ToInt32(sequenceCmd.ExecuteScalar()) + 1; // Tek alanlık bir değeri geri döndürmek için kullanılmaktadır. Object tipinde veri döndürmektedir. 

                SqlCommand individualCmd = new SqlCommand("INSERT INTO dbo.answer (Answer_Id,Question_Id,User_login_Id,Description,Creation_Date,Update_date)" +
                                                                                " VALUES (@Answer_Id,@Question_Id,@User_login_Id,@Description,@Creation_Date,@Update_date)", connection);

                individualCmd.Parameters.AddWithValue("@Answer_Id", answerId);
                individualCmd.Parameters.AddWithValue("@Question_Id", questionId);
                individualCmd.Parameters.AddWithValue("@User_login_Id", userLoginId);
                individualCmd.Parameters.AddWithValue("@Description", description);
                individualCmd.Parameters.AddWithValue("@Creation_Date", DateTime.Now);
                individualCmd.Parameters.AddWithValue("@Update_Date", DateTime.Now);
                individualCmd.ExecuteNonQuery();
                connection.Close();
            }
        }

        public List<CategoryInfo> GetCategoryList()
        {

            connection.Open();
            SqlCommand categoryCmd = new SqlCommand(String.Format("SELECT c.* from dbo.category c;"), connection); // Quora veri tabanı ile çalışması için connection yapısı kullanılmaktadır.
            DataTable categoryDt = new DataTable();
            using (SqlDataAdapter db = new SqlDataAdapter(categoryCmd))
            {
                db.Fill(categoryDt);  // Tabloyu doldurma işlemidir.
            }
            if (categoryDt.Rows.Count > 0)
            {
                List<CategoryInfo> categoryList = new List<CategoryInfo>();
                for (int i = 0; i < categoryDt.Rows.Count; i++)
                {
                    categoryList.Add(new CategoryInfo()
                    {
                        CategoryId = Convert.ToInt32(categoryDt.Rows[i]["Category_Id"]?.ToString()),
                        Name = categoryDt.Rows[i]["Name"]?.ToString(),
                        Description = categoryDt.Rows[i]["Description"]?.ToString()
                    });
                }
                connection.Close();
                return categoryList;
            }
            return null;
        }

        public List<LanguageInfo> GetLanguageList()
        {

            connection.Open();
            SqlCommand languageCmd = new SqlCommand(String.Format("SELECT l.* from dbo.language l;"), connection); // Quora veri tabanı ile çalışması için connection yapısı kullanılmaktadır.
            DataTable languageDt = new DataTable();
            using (SqlDataAdapter db = new SqlDataAdapter(languageCmd))
            {
                db.Fill(languageDt);  // Tabloyu doldurma işlemidir.
            }
            if (languageDt.Rows.Count > 0)
            {
                List<LanguageInfo> LanguageList = new List<LanguageInfo>();
                for (int i = 0; i < languageDt.Rows.Count; i++)
                {
                    LanguageList.Add(new LanguageInfo()
                    {
                        LanguageId = Convert.ToInt32(languageDt.Rows[i]["Language_Id"]?.ToString()),
                        Name = languageDt.Rows[i]["Name"]?.ToString(),
                        Description = languageDt.Rows[i]["Description"]?.ToString()
                    });
                }
                connection.Close();
                return LanguageList;
            }
            return null;
        }

        public List<QuestionInfo> GetTheNewests(string sessionKey) // En Yeni Sorular
        {
            long userLoginId = ValidateSessionKey(sessionKey);
            if (userLoginId > 0)
            {
                connection.Open();
                SqlCommand questionCmd = new SqlCommand(String.Format("SELECT TOP 10 q.* from dbo.question q order by creation_date desc"), connection); // Quora veri tabanı ile çalışması için connection yapısı kullanılmaktadır.
                DataTable questionDt = new DataTable();
                using (SqlDataAdapter db = new SqlDataAdapter(questionCmd))
                {
                    db.Fill(questionDt);  // Tabloyu doldurma işlemidir.
                }
                if (questionDt.Rows.Count > 0)
                {
                    List<QuestionInfo> questionInfoList = new List<QuestionInfo>();
                    for (int i = 0; i < questionDt.Rows.Count; i++)
                    {
                        questionInfoList.Add(new QuestionInfo()
                        {
                            QuestionId = Convert.ToUInt32(questionDt.Rows[i]["Question_Id"].ToString()),
                            CategoryId = Convert.ToUInt32(questionDt.Rows[i]["Category_Id"].ToString()),
                            LanguageId = Convert.ToUInt32(questionDt.Rows[i]["Language_Id"].ToString()),
                            UserLoginId = Convert.ToUInt32(questionDt.Rows[i]["User_Login_Id"].ToString()),
                            Description = questionDt.Rows[i]["Description"]?.ToString(),
                            Title = questionDt.Rows[i]["Title"]?.ToString()
                        });
                    }
                    connection.Close();
                    return questionInfoList;
                }
                connection.Close();
            }
            return null;
        }

        public List<QuestionInfo> GetMostAnswered(string sessionKey) // En Çok Cevaplananlar
        {
            long userLoginId = ValidateSessionKey(sessionKey);
            if (userLoginId > 0)
            {
                connection.Open();
                SqlCommand questionCmd = new SqlCommand(String.Format(@"SELECT 
                                                                                * 
                                                                        from dbo.Question qq 
                                                                        where 
                                                                            qq.Question_Id in (
                                                                                                SELECT 
                                                                                                        TOP 10 PERCENT q.Question_Id 
                                                                                                from dbo.Question q, dbo.Answer a 
                                                                                                where q.Question_Id = a.Question_Id
                                                                                                group by q.Question_Id
                                                                                                order by count(Answer_Id) desc
                                                                                               )"), connection); // Quora veri tabanı ile çalışması için connection yapısı kullanılmaktadır.
                DataTable questionDt = new DataTable();
                using (SqlDataAdapter db = new SqlDataAdapter(questionCmd))
                {
                    db.Fill(questionDt);  // Tabloyu doldurma işlemidir.
                }
                if (questionDt.Rows.Count > 0)
                {
                    List<QuestionInfo> questionInfoList = new List<QuestionInfo>();
                    for (int i = 0; i < questionDt.Rows.Count; i++)
                    {
                        questionInfoList.Add(new QuestionInfo()
                        {
                            QuestionId = Convert.ToUInt32(questionDt.Rows[i]["Question_Id"].ToString()),
                            CategoryId = Convert.ToUInt32(questionDt.Rows[i]["Category_Id"].ToString()),
                            LanguageId = Convert.ToUInt32(questionDt.Rows[i]["Language_Id"].ToString()),
                            UserLoginId = Convert.ToUInt32(questionDt.Rows[i]["User_Login_Id"].ToString()),
                            Description = questionDt.Rows[i]["Description"]?.ToString(),
                            Title = questionDt.Rows[i]["Title"]?.ToString()
                        });
                    }
                    connection.Close();
                    return questionInfoList;
                }
                connection.Close();
            }
            return null;
        }

        public List<QuestionInfo> GetMyQuestions(string sessionKey) // Benim Sorularım
        {
            long userLoginId = ValidateSessionKey(sessionKey);
            if (userLoginId > 0)
            {
                connection.Open();
                SqlCommand questionCmd = new SqlCommand(String.Format(@"SELECT TOP 10 q.* from dbo.question q where q.User_login_Id = {0} order by q.Creation_date desc", userLoginId), connection); // Quora veri tabanı ile çalışması için connection yapısı kullanılmaktadır.
                DataTable questionDt = new DataTable();
                using (SqlDataAdapter db = new SqlDataAdapter(questionCmd))
                {
                    db.Fill(questionDt);  // Tabloyu doldurma işlemidir.
                }
                if (questionDt.Rows.Count > 0)
                {
                    List<QuestionInfo> questionInfoList = new List<QuestionInfo>();
                    for (int i = 0; i < questionDt.Rows.Count; i++)
                    {
                        questionInfoList.Add(new QuestionInfo()
                        {
                            QuestionId = Convert.ToUInt32(questionDt.Rows[i]["Question_Id"].ToString()),
                            CategoryId = Convert.ToUInt32(questionDt.Rows[i]["Category_Id"].ToString()),
                            LanguageId = Convert.ToUInt32(questionDt.Rows[i]["Language_Id"].ToString()),
                            UserLoginId = Convert.ToUInt32(questionDt.Rows[i]["User_Login_Id"].ToString()),
                            Description = questionDt.Rows[i]["Description"]?.ToString(),
                            Title = questionDt.Rows[i]["Title"]?.ToString()
                        });
                    }
                    connection.Close();
                    return questionInfoList;
                }
                connection.Close();
            }
            return null;
        }

        public QuestionAnswerInfo GetAnswerListByQuestionId(long questionId, string sessionKey)
        {
            long userLoginId = ValidateSessionKey(sessionKey);
            if (userLoginId > 0)
            {
                connection.Open();
                SqlCommand cmd = new SqlCommand(String.Format(@"SELECT 
			i.Name + ' ' + i.Surname AS Question_Name_Surname,
			i2.Name + ' ' + i2.Surname as Answer_Name_surname,
			q.Question_Id as qid ,
			q.Category_Id,
			q.User_login_Id as quser,
			q.Language_Id,
			q.Title,
			q.Creation_Date as qcd,
			q.Description as qd,
			q.Update_Date as qud,
			a.Creation_Date as acd,
			a.Description as ad,
			a.Sort_Number,
			a.Update_Date as aud,
			a.Answer_Id,
			a.Question_Id as aid,
			a.User_login_Id as auser
FROM                User_credential AS c INNER JOIN
                         İndividual AS i ON c.İndividual_id = i.İndividual_id INNER JOIN
                         Question AS q LEFT OUTER JOIN
                         Answer AS a ON q.Question_Id = a.Question_Id ON c.User_login_id = q.User_login_Id
						 LEFT OUTER JOIN User_credential as c2 on c2.User_login_id=a.User_login_Id
						 LEFT OUTER JOIN İndividual as i2 on i2.İndividual_id=c2.İndividual_id
WHERE        (q.Question_Id = {0})", questionId), connection); // Quora veri tabanı ile çalışması için connection yapısı kullanılmaktadır.
                DataTable dt = new DataTable();

                using (SqlDataAdapter db = new SqlDataAdapter(cmd))
                {
                    db.Fill(dt);  // Tabloyu doldurma işlemidir.
                }
                if (dt.Rows.Count > 0)
                {
                    QuestionAnswerInfo info = new QuestionAnswerInfo();
                    QuestionInfo questionInfo = new QuestionInfo();
                    questionInfo.QuestionId = Convert.ToInt32(dt.Rows[0]["qid"]?.ToString());
                    questionInfo.Title = dt.Rows[0]["Title"]?.ToString();
                    questionInfo.Description = dt.Rows[0]["qd"]?.ToString();
                    questionInfo.NameSurname = dt.Rows[0]["Question_Name_Surname"]?.ToString();
                    questionInfo.CreationDate = !ReferenceEquals(dt.Rows[0]["qcd"], DBNull.Value) ? Convert.ToDateTime(dt.Rows[0]["qcd"].ToString()) : DateTime.Now;
                    info.QuestionInfo = questionInfo;
                    List<AnswerInfo> answerInfoList = new List<AnswerInfo>();
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        if (!ReferenceEquals(dt.Rows[i]["Answer_Id"], DBNull.Value))
                        {
                            answerInfoList.Add(new AnswerInfo()
                            {
                                Description = !ReferenceEquals(dt.Rows[i]["ad"], DBNull.Value) ? dt.Rows[i]["ad"].ToString() : null, //ReferenceEquals yapılmalıdır.
                                SortNumber = !ReferenceEquals(dt.Rows[i]["Sort_Number"], DBNull.Value) ? Convert.ToInt32(dt.Rows[i]["Sort_Number"].ToString()) : -1,
                                CreationDate = !ReferenceEquals(dt.Rows[i]["acd"], DBNull.Value) ? Convert.ToDateTime(dt.Rows[i]["acd"].ToString()) : DateTime.Now,
                                NameSurname = !ReferenceEquals(dt.Rows[i]["Answer_Name_surname"], DBNull.Value) ? dt.Rows[i]["Answer_Name_surname"].ToString() : null
                            });
                        }
                    }
                    info.AnswerInfoList = answerInfoList;
                    connection.Close();
                    return info;
                }
                connection.Close();
            }
            return null;
        }

        public List<QuestionInfo> GetQuestionListByCategoryId(long categoryId, string sessionKey)
        {
            long userLoginId = ValidateSessionKey(sessionKey);
            if (userLoginId > 0 & categoryId > 0)
            {
                connection.Open();
                SqlCommand questionCmd = new SqlCommand(String.Format(@"SELECT q.* from dbo.question q where q.Category_Id = {0} order by q.Creation_date desc", categoryId), connection); // Quora veri tabanı ile çalışması için connection yapısı kullanılmaktadır.
                DataTable questionDt = new DataTable();
                using (SqlDataAdapter db = new SqlDataAdapter(questionCmd))
                {
                    db.Fill(questionDt);  // Tabloyu doldurma işlemidir.
                }
                if (questionDt.Rows.Count > 0)
                {
                    List<QuestionInfo> questionInfoList = new List<QuestionInfo>();
                    for (int i = 0; i < questionDt.Rows.Count; i++)
                    {
                        questionInfoList.Add(new QuestionInfo()
                        {
                            QuestionId = Convert.ToUInt32(questionDt.Rows[i]["Question_Id"].ToString()),
                            CategoryId = Convert.ToUInt32(questionDt.Rows[i]["Category_Id"].ToString()),
                            LanguageId = Convert.ToUInt32(questionDt.Rows[i]["Language_Id"].ToString()),
                            UserLoginId = Convert.ToUInt32(questionDt.Rows[i]["User_Login_Id"].ToString()),
                            Description = questionDt.Rows[i]["Description"]?.ToString(),
                            Title = questionDt.Rows[i]["Title"]?.ToString()
                        });
                    }
                    connection.Close();
                    return questionInfoList;
                }
                connection.Close();
            }
            return null;
        }

        public List<QuestionInfo> GetQuestionListByLanguageId(long languageId, string sessionKey)
        {
            long userLoginId = ValidateSessionKey(sessionKey);
            if (userLoginId > 0 & languageId > 0)
            {
                connection.Open();
                SqlCommand questionCmd = new SqlCommand(String.Format(@"SELECT q.* from dbo.question q where q.Language_Id = {0} order by q.Creation_date desc", languageId), connection); // Quora veri tabanı ile çalışması için connection yapısı kullanılmaktadır.
                DataTable questionDt = new DataTable();
                using (SqlDataAdapter db = new SqlDataAdapter(questionCmd))
                {
                    db.Fill(questionDt);  // Tabloyu doldurma işlemidir.
                }
                if (questionDt.Rows.Count > 0)
                {
                    List<QuestionInfo> questionInfoList = new List<QuestionInfo>();
                    for (int i = 0; i < questionDt.Rows.Count; i++)
                    {
                        questionInfoList.Add(new QuestionInfo()
                        {
                            QuestionId = Convert.ToUInt32(questionDt.Rows[i]["Question_Id"].ToString()),
                            CategoryId = Convert.ToUInt32(questionDt.Rows[i]["Category_Id"].ToString()),
                            LanguageId = Convert.ToUInt32(questionDt.Rows[i]["Language_Id"].ToString()),
                            UserLoginId = Convert.ToUInt32(questionDt.Rows[i]["User_Login_Id"].ToString()),
                            Description = questionDt.Rows[i]["Description"]?.ToString(),
                            Title = questionDt.Rows[i]["Title"]?.ToString()
                        });
                    }
                    connection.Close();
                    return questionInfoList;
                }
                connection.Close();
            }
            return null;
        }

        public List<QuestionInfo> Search(long? categoryId, long? languageId, string searchWord, string sessionKey)
        {
            long userLoginId = ValidateSessionKey(sessionKey);
            if (userLoginId > 0)
            {
                connection.Open();
                string cmdString = @"SELECT q.* 
                                                                        from dbo.question q where 
                                                                         1=1
                                                                        #CATEGORY_ID_FILTER# 
                                                                        #LANGUAGE_ID_FILTER#
                                                                        #SEARCH_WORD_FILTER#
                                                                order by q.Creation_date desc";

                cmdString = cmdString.Replace("#CATEGORY_ID_FILTER#", categoryId.HasValue ? String.Format(" AND q.Category_Id = {0} ", categoryId.Value) : " ");
                cmdString = cmdString.Replace("#LANGUAGE_ID_FILTER#", languageId.HasValue ? String.Format(" AND q.Language_Id = {0} ", languageId.Value) : " ");
                cmdString = cmdString.Replace("#SEARCH_WORD_FILTER#", !String.IsNullOrEmpty(searchWord) ? String.Format(" AND (lower(q.Title) like lower('%{0}%') or lower(q.Description) like lower('%{0}%')) ", searchWord) : " ");

                SqlCommand questionCmd = new SqlCommand(cmdString, connection); // Quora veri tabanı ile çalışması için connection yapısı kullanılmaktadır.
                DataTable questionDt = new DataTable();
                using (SqlDataAdapter db = new SqlDataAdapter(questionCmd))
                {
                    db.Fill(questionDt);  // Tabloyu doldurma işlemidir.
                }
                if (questionDt.Rows.Count > 0)
                {
                    List<QuestionInfo> questionInfoList = new List<QuestionInfo>();
                    for (int i = 0; i < questionDt.Rows.Count; i++)
                    {
                        questionInfoList.Add(new QuestionInfo()
                        {
                            QuestionId = Convert.ToUInt32(questionDt.Rows[i]["Question_Id"].ToString()),
                            CategoryId = Convert.ToUInt32(questionDt.Rows[i]["Category_Id"].ToString()),
                            LanguageId = Convert.ToUInt32(questionDt.Rows[i]["Language_Id"].ToString()),
                            UserLoginId = Convert.ToUInt32(questionDt.Rows[i]["User_Login_Id"].ToString()),
                            Description = questionDt.Rows[i]["Description"]?.ToString(),
                            Title = questionDt.Rows[i]["Title"]?.ToString()
                        });
                    }
                    connection.Close();
                    return questionInfoList;
                }
                connection.Close();
            }
            return null;
        }

        public List<QuestionInfo> GetAllQuestion() // Bütün soruların görüntülenmesidir.
        {
            //long userLoginId = ValidateSessionKey(sessionKey);
            //if (userLoginId > 0)
            // {
            connection.Open();
            SqlCommand questionCmd = new SqlCommand(String.Format("SELECT q.* from dbo.question q order by creation_date desc"), connection); // Quora veri tabanı ile çalışması için connection yapısı kullanılmaktadır.
            DataTable questionDt = new DataTable();
            using (SqlDataAdapter db = new SqlDataAdapter(questionCmd))
            {
                db.Fill(questionDt);  // Tabloyu doldurma işlemidir.
            }
            if (questionDt.Rows.Count > 0)
            {
                List<QuestionInfo> questionInfoList = new List<QuestionInfo>();
                for (int i = 0; i < questionDt.Rows.Count; i++)
                {
                    questionInfoList.Add(new QuestionInfo()
                    {
                        QuestionId = Convert.ToUInt32(questionDt.Rows[i]["Question_Id"].ToString()),
                        CategoryId = Convert.ToUInt32(questionDt.Rows[i]["Category_Id"].ToString()),
                        LanguageId = Convert.ToUInt32(questionDt.Rows[i]["Language_Id"].ToString()),
                        UserLoginId = Convert.ToUInt32(questionDt.Rows[i]["User_Login_Id"].ToString()),
                        Description = questionDt.Rows[i]["Description"]?.ToString(),
                        Title = questionDt.Rows[i]["Title"]?.ToString()
                    });
                }
                connection.Close();
                return questionInfoList;
            }
            connection.Close();
            // }
            return null;
        }
    }
}
