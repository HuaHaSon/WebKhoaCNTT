namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Thongbaochuyentiep")]
    public partial class Thongbaochuyentiep
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Thongbaochuyentiep()
        {
            Chitietchuyentieps = new HashSet<Chitietchuyentiep>();
        }

        [Key]
        public int Machuyentiep { get; set; }

        [StringLength(100)]
        public string Taikhoangui { get; set; }

        [StringLength(100)]
        public string Tieude { get; set; }

        public string Noidung { get; set; }

        public DateTime? Ngaychuyen { get; set; }

        public int? Flag { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Chitietchuyentiep> Chitietchuyentieps { get; set; }

        public virtual Taikhoan Taikhoan { get; set; }
    }
}
