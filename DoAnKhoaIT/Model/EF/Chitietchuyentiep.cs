namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Chitietchuyentiep")]
    public partial class Chitietchuyentiep
    {
        [Key]
        [Column(Order = 0)]
        [StringLength(50)]
        public string Machuyentiep { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(100)]
        public string Taikhoannhan { get; set; }

        public DateTime? Ngaynhan { get; set; }

        [StringLength(20)]
        public string Trangthaixem { get; set; }

        [StringLength(20)]
        public string Trangthaichuyen { get; set; }

        public bool? Flag { get; set; }

        public virtual Thongbaochuyentiep Thongbaochuyentiep { get; set; }

        public virtual Taikhoan Taikhoan { get; set; }
    }
}
