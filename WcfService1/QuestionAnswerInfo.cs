using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WcfService1
{
    public class QuestionAnswerInfo
    {
        public QuestionInfo QuestionInfo { get; set; }
        public List<AnswerInfo> AnswerInfoList { get; set; }
    }
    public class AnswerInfo
    {
        public string NameSurname { get; set; }
        public string Description { get; set; }
        public int SortNumber { get; set; }
        public DateTime CreationDate { get; set; }
    }
}