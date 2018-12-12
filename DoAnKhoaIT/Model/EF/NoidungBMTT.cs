namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("NoidungBMTT")]
    public partial class NoidungBMTT
    {
        [Key]
        [StringLength(50)]
        public string MaNDBMTT { get; set; }

        [StringLength(50)]
        public string MaBMTT { get; set; }

        [StringLength(100)]
        public string Tieude { get; set; }

        [Column("NoidungBMTT")]
        public string NoidungBMTT1 { get; set; }

        [StringLength(100)]
        public string Tentaikhoan { get; set; }

        public DateTime? Ngaydang { get; set; }

        public bool? flag { get; set; }

        public virtual Bieumauthutuc Bieumauthutuc { get; set; }
    }
}
