namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Loaibaidang")]
    public partial class Loaibaidang
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Loaibaidang()
        {
            Baidangs = new HashSet<Baidang>();
        }

        [Key]
        [StringLength(50)]
        public string Maloai { get; set; }

        [StringLength(100)]
        public string Tenloai { get; set; }

        public bool? Flag { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Baidang> Baidangs { get; set; }
    }
}
