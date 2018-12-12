namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Taikhoan")]
    public partial class Taikhoan
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Taikhoan()
        {
            Chitietchuyentieps = new HashSet<Chitietchuyentiep>();
            ChitietCTGVs = new HashSet<ChitietCTGV>();
            ChitietNCKHs = new HashSet<ChitietNCKH>();
            NoidungDTs = new HashSet<NoidungDT>();
            NoidungGTs = new HashSet<NoidungGT>();
            Thongbaochuyentieps = new HashSet<Thongbaochuyentiep>();
            Thongtinnguoidungs = new HashSet<Thongtinnguoidung>();
        }

        [Key]
        [StringLength(100)]
        public string Tentaikhoan { get; set; }

        [StringLength(1000)]
        public string Matkhau { get; set; }

        public DateTime? TGdangki { get; set; }

        [StringLength(10)]
        public string Trangthaihd { get; set; }

        public bool? Flag { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Chitietchuyentiep> Chitietchuyentieps { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ChitietCTGV> ChitietCTGVs { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ChitietNCKH> ChitietNCKHs { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<NoidungDT> NoidungDTs { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<NoidungGT> NoidungGTs { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Thongbaochuyentiep> Thongbaochuyentieps { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Thongtinnguoidung> Thongtinnguoidungs { get; set; }
    }
}
