namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class File
    {
        [Key]
        public int IDfile { get; set; }

        [StringLength(50)]
        public string Mabaidang { get; set; }

        [StringLength(50)]
        public string MaNDBMTT { get; set; }

        [StringLength(50)]
        public string MaNDDT { get; set; }

        [StringLength(50)]
        public string MaCTNCKH { get; set; }

        [StringLength(50)]
        public string MaCTCTGV { get; set; }

        [StringLength(50)]
        public string MaNDGT { get; set; }

        [StringLength(50)]
        public string Machuyentiep { get; set; }

        [StringLength(10)]
        public string TenFile { get; set; }

        [StringLength(100)]
        public string FilePath { get; set; }

        public bool? Flag { get; set; }

        public virtual Baidang Baidang { get; set; }

        public virtual ChitietCTGV ChitietCTGV { get; set; }

        public virtual ChitietNCKH ChitietNCKH { get; set; }

        public virtual Thongbaochuyentiep Thongbaochuyentiep { get; set; }

        public virtual NoidungBMTT NoidungBMTT { get; set; }

        public virtual NoidungDT NoidungDT { get; set; }

        public virtual NoidungGT NoidungGT { get; set; }
    }
}
