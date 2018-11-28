namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Baidang")]
    public partial class Baidang
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Baidang()
        {
            Chitietbaidangs = new HashSet<Chitietbaidang>();
            Files = new HashSet<File>();
            Hinhanhs = new HashSet<Hinhanh>();
        }

        [Key]
        [StringLength(50)]
        public string Mabaidang { get; set; }

        [StringLength(50)]
        public string Maloai { get; set; }

        [StringLength(100)]
        public string Tieude { get; set; }

        public string Noidung { get; set; }

        public DateTime? Ngaydang { get; set; }

        [StringLength(50)]
        public string Tennguoidang { get; set; }

        public DateTime? Thoigianhieuluc { get; set; }

        [StringLength(50)]
        public string ĐoituongHT { get; set; }

        public bool? Flag { get; set; }

        public virtual Loaibaidang Loaibaidang { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Chitietbaidang> Chitietbaidangs { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<File> Files { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Hinhanh> Hinhanhs { get; set; }
    }
}
