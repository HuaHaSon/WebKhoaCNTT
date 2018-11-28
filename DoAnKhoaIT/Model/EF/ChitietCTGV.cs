namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ChitietCTGV")]
    public partial class ChitietCTGV
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public ChitietCTGV()
        {
            Files = new HashSet<File>();
        }

        [Key]
        [StringLength(50)]
        public string MaCTCTGV { get; set; }

        [StringLength(50)]
        public string MaCT { get; set; }

        public DateTime? NgayCT { get; set; }

        public string Noidung { get; set; }

        public string Thanhphan { get; set; }

        [StringLength(50)]
        public string Diadiem { get; set; }

        [StringLength(50)]
        public string Chutri { get; set; }

        public string Bosung { get; set; }

        [StringLength(100)]
        public string Tentaikhoan { get; set; }

        public bool? Flag { get; set; }

        public virtual Taikhoan Taikhoan { get; set; }

        public virtual CongtacGV CongtacGV { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<File> Files { get; set; }
    }
}
