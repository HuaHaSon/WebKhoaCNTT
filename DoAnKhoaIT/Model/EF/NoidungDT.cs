namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("NoidungDT")]
    public partial class NoidungDT
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public NoidungDT()
        {
            Files = new HashSet<File>();
            Hinhanhs = new HashSet<Hinhanh>();
        }

        [Key]
        [StringLength(50)]
        public string MaNDDT { get; set; }

        [StringLength(50)]
        public string MaloaiDT { get; set; }

        [StringLength(100)]
        public string Tieude { get; set; }

        [Column("NoidungDT")]
        public string NoidungDT1 { get; set; }

        public DateTime? Ngaydang { get; set; }

        [StringLength(100)]
        public string Tentaikhoan { get; set; }

        public bool? Flag { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<File> Files { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Hinhanh> Hinhanhs { get; set; }

        public virtual Loaidaotao Loaidaotao { get; set; }

        public virtual Taikhoan Taikhoan { get; set; }
    }
}
