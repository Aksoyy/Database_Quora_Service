using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WcfService1
{
    public class QuestionInfo
    {

        public long QuestionId {get;set;} 
        public long CategoryId { get; set; }
        public long LanguageId { get; set; }
        public long UserLoginId { get; set; }
        public string Description { get; set; }
        public string Title { get; set; }
        public string NameSurname { get; set; }
        public DateTime CreationDate { get; set; }
    }
}