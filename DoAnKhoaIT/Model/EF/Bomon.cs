namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Bomon")]
    public partial class Bomon
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Bomon()
        {
            Monhocs = new HashSet<Monhoc>();
            ThongtinGVs = new HashSet<ThongtinGV>();
        }

        [Key]
        [StringLength(50)]
        public string MaBM { get; set; }

        [StringLength(100)]
        public string TenBM { get; set; }

        [StringLength(2000)]
        public string Noidung { get; set; }

        public bool? Flag { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Monhoc> Monhocs { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ThongtinGV> ThongtinGVs { get; set; }
    }
}
