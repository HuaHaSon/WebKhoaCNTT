namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("CheckBaidang")]
    public partial class CheckBaidang
    {
        [Key]
        [StringLength(50)]
        public string Mabaidang { get; set; }

        public bool? Flag { get; set; }

        public virtual Baidang Baidang { get; set; }
    }
}
