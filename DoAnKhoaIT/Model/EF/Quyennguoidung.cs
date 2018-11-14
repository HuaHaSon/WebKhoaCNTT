namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Quyennguoidung")]
    public partial class Quyennguoidung
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Quyennguoidung()
        {
            Chitietquyens = new HashSet<Chitietquyen>();
        }

        [Key]
        [StringLength(50)]
        public string Maquyen { get; set; }

        [StringLength(100)]
        public string Tenquyen { get; set; }

        public bool? Flag { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Chitietquyen> Chitietquyens { get; set; }
    }
}
