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
    
    public partial class Objects
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Objects()
        {
            this.Orders = new HashSet<Orders>();
        }
    
        public int IdObject { get; set; }
        public string ObjectName { get; set; }
        public string ObjectDescription { get; set; }
        public int ObjectPrice { get; set; }
        public int ObjectTypeId { get; set; }
        public int ObjectRoomCount { get; set; }
        public int ObjectSquare { get; set; }
        public string ObjectAddress { get; set; }
        public string ObjectPhotoPath { get; set; }
        public int ObjectBuilderId { get; set; }
        public Nullable<int> ObjectStatusId { get; set; }
    
        public virtual ObjectStatuses ObjectStatuses { get; set; }
        public virtual ObjectTypes ObjectTypes { get; set; }
        public virtual Users Users { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Orders> Orders { get; set; }
    }
}
