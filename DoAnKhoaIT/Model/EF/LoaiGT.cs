namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("LoaiGT")]
    public partial class LoaiGT
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public LoaiGT()
        {
            NoidungGTs = new HashSet<NoidungGT>();
        }

        [Key]
        [StringLength(50)]
        public string MaGT { get; set; }

        [StringLength(100)]
        public string TenGT { get; set; }

        public bool? Flag { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<NoidungGT> NoidungGTs { get; set; }
    }
}
