namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("NoidungDT")]
    public partial class NoidungDT
    {
        [Key]
        [StringLength(50)]
        public string MaNDDT { get; set; }

        [StringLength(50)]
        public string MaloaiDT { get; set; }

        [StringLength(100)]
        public string Tieude { get; set; }

        [Column("NoidungDT")]
        public string NoidungDT1 { get; set; }

        public DateTime? Ngaydang { get; set; }

        [StringLength(100)]
        public string Tentaikhoan { get; set; }

        public bool? Flag { get; set; }

        public virtual Loaidaotao Loaidaotao { get; set; }

        public virtual Taikhoan Taikhoan { get; set; }
    }
}
