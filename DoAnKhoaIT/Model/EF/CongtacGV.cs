namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("CongtacGV")]
    public partial class CongtacGV
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public CongtacGV()
        {
            ChitietCTGVs = new HashSet<ChitietCTGV>();
        }

        [Key]
        [StringLength(50)]
        public string MaCT { get; set; }

        [StringLength(50)]
        public string TenCT { get; set; }

        public bool? Flag { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ChitietCTGV> ChitietCTGVs { get; set; }
    }
}
