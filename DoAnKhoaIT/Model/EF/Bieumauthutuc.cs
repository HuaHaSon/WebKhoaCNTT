namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Bieumauthutuc")]
    public partial class Bieumauthutuc
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Bieumauthutuc()
        {
            NoidungBMTTs = new HashSet<NoidungBMTT>();
        }

        [Key]
        [StringLength(50)]
        public string MaBMTT { get; set; }

        [StringLength(100)]
        public string TenBMTT { get; set; }

        public bool? Flag { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<NoidungBMTT> NoidungBMTTs { get; set; }
    }
}
