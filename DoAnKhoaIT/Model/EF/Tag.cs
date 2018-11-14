namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Tag")]
    public partial class Tag
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Tag()
        {
            Chitietbaidangs = new HashSet<Chitietbaidang>();
        }

        [StringLength(50)]
        public string TagID { get; set; }

        [StringLength(100)]
        public string TenTag { get; set; }

        [StringLength(50)]
        public string Machucvu { get; set; }

        public bool? Flag { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Chitietbaidang> Chitietbaidangs { get; set; }

        public virtual Chucvu Chucvu { get; set; }
    }
}
