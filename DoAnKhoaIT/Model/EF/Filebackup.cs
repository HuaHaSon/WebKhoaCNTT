namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Filebackup")]
    public partial class Filebackup
    {
        public int ID { get; set; }

        [StringLength(100)]
        public string tenfile { get; set; }

        [StringLength(500)]
        public string filepath { get; set; }
    }
}
