namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Saoluu")]
    public partial class Saoluu
    {
        [Key]
        [StringLength(10)]
        public string Thoigian { get; set; }
    }
}
