using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;

namespace WcfService1
{
    // NOT: "IService1" arabirim adını kodda ve yapılandırma dosyasında birlikte değiştirmek için "Yeniden Düzenle" menüsündeki "Yeniden Adlandır" komutunu kullanabilirsiniz.
    [ServiceContract]
    public interface IQuara
    {
        [OperationContract]
        string Login(string userName, string password);
        [OperationContract]
        void Logout(string sessionKey);
        [OperationContract]
        bool ChangePassword(string oldPassword, string newPassword, string sessionKey);
        [OperationContract]
        bool RegisterUser(string name, string lastName, string surname, string nationalityTypeCd, string username, string password);
        [OperationContract]
        bool UpdateUser(string name, string lastName, string surname, string nationalityTypeCd, string sessionKey);
        [OperationContract]
        UserInfo GetUserInfo(string sessionKey);
        [OperationContract]
        List<UserInfo> GetUserInfoAll();
        [OperationContract]
        List<LanguageInfo> GetLanguageList();
        [OperationContract]
        List<CategoryInfo> GetCategoryList();
        [OperationContract]
        void NewQuestion(string title, string description, int? languageId, int? bookmarkId, string sessionKey);
        [OperationContract]
        List<QuestionInfo> GetTheNewests(string sessionKey);
        [OperationContract]
        List<QuestionInfo> GetMostAnswered(string sessionKey);
        [OperationContract]
        List<QuestionInfo> GetMyQuestions(string sessionKey);
        [OperationContract]
        QuestionAnswerInfo GetAnswerListByQuestionId(long questionId, string sessionKey);
        [OperationContract]
        void AnswerByQuestionId(int questionId, string description, string sessionKey);
        [OperationContract]
        List<QuestionInfo> GetQuestionListByCategoryId(long categoryId, string sessionKey);
        [OperationContract]
        List<QuestionInfo> GetQuestionListByLanguageId(long languageId, string sessionKey);
        [OperationContract]
        List<QuestionInfo> Search(long? categoryId, long? languageId, string searchWord, string sessionKey);
        [OperationContract]
        List<QuestionInfo> GetAllQuestion();

    }


    // Hizmet işlemlerine bileşik türler eklemek için, aşağıdaki örnekte gösterildiği şekilde bir veri sözleşmesi kullanın.
}
