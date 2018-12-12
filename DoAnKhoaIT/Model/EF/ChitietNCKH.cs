namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ChitietNCKH")]
    public partial class ChitietNCKH
    {
        [Key]
        [StringLength(50)]
        public string MaCTNCKH { get; set; }

        [StringLength(50)]
        public string MaNCKH { get; set; }

        public string Tieude { get; set; }

        public string Noidung { get; set; }

        public DateTime? Ngaydang { get; set; }

        public DateTime? NgaySK { get; set; }

        [StringLength(100)]
        public string Tentaikhoan { get; set; }

        public bool? Flag { get; set; }

        public virtual NghiencuuKH NghiencuuKH { get; set; }

        public virtual Taikhoan Taikhoan { get; set; }
    }
}
