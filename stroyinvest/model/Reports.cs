//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace stroyinvest.Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class Reports
    {
        public int IdReport { get; set; }
        public int ReportTypeId { get; set; }
        public System.DateTime ReportDate { get; set; }
        public string ReportDescription { get; set; }
        public int ReportOrderId { get; set; }
    
        public virtual Orders Orders { get; set; }
        public virtual ReportTypes ReportTypes { get; set; }
    }
}
