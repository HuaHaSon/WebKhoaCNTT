namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("NoidungBMTT")]
    public partial class NoidungBMTT
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public NoidungBMTT()
        {
            Files = new HashSet<File>();
        }

        [Key]
        [StringLength(50)]
        public string MaNDBMTT { get; set; }

        [StringLength(50)]
        public string MaBMTT { get; set; }

        [StringLength(100)]
        public string Tieude { get; set; }

        [Column("NoidungBMTT")]
        public string NoidungBMTT1 { get; set; }

        [StringLength(100)]
        public string Tentaikhoan { get; set; }

        public DateTime? Ngaydang { get; set; }

        public bool? flag { get; set; }

        public virtual Bieumauthutuc Bieumauthutuc { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<File> Files { get; set; }

        public virtual Taikhoan Taikhoan { get; set; }
    }
}
