namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Detail")]
    public partial class Detail
    {
        [Key]
        [StringLength(100)]
        public string Tenserver { get; set; }

        [Required]
        [StringLength(10)]
        public string tentk { get; set; }

        [Required]
        [StringLength(10)]
        public string matkhau { get; set; }

        [Required]
        [StringLength(50)]
        public string data { get; set; }
    }
}
