namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("NghiencuuKH")]
    public partial class NghiencuuKH
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public NghiencuuKH()
        {
            ChitietNCKHs = new HashSet<ChitietNCKH>();
        }

        [Key]
        [StringLength(50)]
        public string MaNCKH { get; set; }

        [StringLength(50)]
        public string TenNCKH { get; set; }

        public bool? Flag { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ChitietNCKH> ChitietNCKHs { get; set; }
    }
}
