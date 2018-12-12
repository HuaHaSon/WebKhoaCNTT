namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("NoidungGT")]
    public partial class NoidungGT
    {
        [Key]
        [StringLength(50)]
        public string MaNDGT { get; set; }

        [StringLength(50)]
        public string MaGT { get; set; }

        [StringLength(50)]
        public string Tieude { get; set; }

        public string Noidung { get; set; }

        public DateTime? Ngaydang { get; set; }

        [StringLength(100)]
        public string Tentaikhoan { get; set; }

        public bool? Flag { get; set; }

        public virtual LoaiGT LoaiGT { get; set; }

        public virtual Taikhoan Taikhoan { get; set; }
    }
}
