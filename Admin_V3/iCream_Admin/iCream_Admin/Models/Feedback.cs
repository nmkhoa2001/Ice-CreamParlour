//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace iCream_Admin.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Feedback
    {
        public int feedback_id { get; set; }
        public string feedback_name { get; set; }
        public string feedback_email { get; set; }
        public string feedback_phone { get; set; }
        public Nullable<int> feedback_type { get; set; }
        public string feedback_text { get; set; }
    }
}