namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("NoidungGT")]
    public partial class NoidungGT
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public NoidungGT()
        {
            Files = new HashSet<File>();
            Hinhanhs = new HashSet<Hinhanh>();
        }

        [Key]
        [StringLength(50)]
        public string MaNDGT { get; set; }

        [StringLength(50)]
        public string MaGT { get; set; }

        [StringLength(50)]
        public string Tieude { get; set; }

        public string Noidung { get; set; }

        public DateTime? Ngaydang { get; set; }

        [StringLength(100)]
        public string Tentaikhoan { get; set; }

        public bool? Flag { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<File> Files { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Hinhanh> Hinhanhs { get; set; }

        public virtual LoaiGT LoaiGT { get; set; }

        public virtual Taikhoan Taikhoan { get; set; }
    }
}
