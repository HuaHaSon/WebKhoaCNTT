namespace Model.EF
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class SGU : DbContext
    {
        public SGU()
            : base("name=SGU")
        {
        }

        public virtual DbSet<Baidang> Baidangs { get; set; }
        public virtual DbSet<Bieumauthutuc> Bieumauthutucs { get; set; }
        public virtual DbSet<Bomon> Bomons { get; set; }
        public virtual DbSet<Chitietbaidang> Chitietbaidangs { get; set; }
        public virtual DbSet<Chitietchuyentiep> Chitietchuyentieps { get; set; }
        public virtual DbSet<ChitietCTGV> ChitietCTGVs { get; set; }
        public virtual DbSet<ChitietNCKH> ChitietNCKHs { get; set; }
        public virtual DbSet<Chitietquyen> Chitietquyens { get; set; }
        public virtual DbSet<Chucvu> Chucvus { get; set; }
        public virtual DbSet<CongtacGV> CongtacGVs { get; set; }
        public virtual DbSet<Loaibaidang> Loaibaidangs { get; set; }
        public virtual DbSet<Loaidaotao> Loaidaotaos { get; set; }
        public virtual DbSet<LoaiGT> LoaiGTs { get; set; }
        public virtual DbSet<Monhoc> Monhocs { get; set; }
        public virtual DbSet<NghiencuuKH> NghiencuuKHs { get; set; }
        public virtual DbSet<NoidungBMTT> NoidungBMTTs { get; set; }
        public virtual DbSet<NoidungDT> NoidungDTs { get; set; }
        public virtual DbSet<NoidungGT> NoidungGTs { get; set; }
        public virtual DbSet<Quyennguoidung> Quyennguoidungs { get; set; }
        public virtual DbSet<Tag> Tags { get; set; }
        public virtual DbSet<Taikhoan> Taikhoans { get; set; }
        public virtual DbSet<Thongbaochuyentiep> Thongbaochuyentieps { get; set; }
        public virtual DbSet<ThongtinGV> ThongtinGVs { get; set; }
        public virtual DbSet<Thongtinnguoidung> Thongtinnguoidungs { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Baidang>()
                .Property(e => e.Mabaidang)
                .IsUnicode(false);

            modelBuilder.Entity<Baidang>()
                .Property(e => e.Maloai)
                .IsUnicode(false);

            modelBuilder.Entity<Baidang>()
                .Property(e => e.ĐoituongHT)
                .IsUnicode(false);

            modelBuilder.Entity<Baidang>()
                .HasMany(e => e.Chitietbaidangs)
                .WithRequired(e => e.Baidang)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Bieumauthutuc>()
                .Property(e => e.MaBMTT)
                .IsUnicode(false);

            modelBuilder.Entity<Bomon>()
                .Property(e => e.MaBM)
                .IsUnicode(false);

            modelBuilder.Entity<Chitietbaidang>()
                .Property(e => e.Mabaidang)
                .IsUnicode(false);

            modelBuilder.Entity<Chitietbaidang>()
                .Property(e => e.TagID)
                .IsUnicode(false);

            modelBuilder.Entity<Chitietchuyentiep>()
                .Property(e => e.Taikhoannhan)
                .IsUnicode(false);

            modelBuilder.Entity<ChitietCTGV>()
                .Property(e => e.MaCTCTGV)
                .IsUnicode(false);

            modelBuilder.Entity<ChitietCTGV>()
                .Property(e => e.MaCT)
                .IsUnicode(false);

            modelBuilder.Entity<ChitietCTGV>()
                .Property(e => e.Tentaikhoan)
                .IsUnicode(false);

            modelBuilder.Entity<ChitietNCKH>()
                .Property(e => e.MaCTNCKH)
                .IsUnicode(false);

            modelBuilder.Entity<ChitietNCKH>()
                .Property(e => e.MaNCKH)
                .IsUnicode(false);

            modelBuilder.Entity<ChitietNCKH>()
                .Property(e => e.Tentaikhoan)
                .IsUnicode(false);

            modelBuilder.Entity<Chitietquyen>()
                .Property(e => e.Machucvu)
                .IsUnicode(false);

            modelBuilder.Entity<Chitietquyen>()
                .Property(e => e.Maquyen)
                .IsUnicode(false);

            modelBuilder.Entity<Chucvu>()
                .Property(e => e.Machucvu)
                .IsUnicode(false);

            modelBuilder.Entity<Chucvu>()
                .HasMany(e => e.Chitietquyens)
                .WithRequired(e => e.Chucvu)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<CongtacGV>()
                .Property(e => e.MaCT)
                .IsUnicode(false);

            modelBuilder.Entity<Loaibaidang>()
                .Property(e => e.Maloai)
                .IsUnicode(false);

            modelBuilder.Entity<Loaidaotao>()
                .Property(e => e.MaloaiDT)
                .IsUnicode(false);

            modelBuilder.Entity<LoaiGT>()
                .Property(e => e.MaGT)
                .IsUnicode(false);

            modelBuilder.Entity<Monhoc>()
                .Property(e => e.MaMH)
                .IsUnicode(false);

            modelBuilder.Entity<Monhoc>()
                .Property(e => e.MaBM)
                .IsUnicode(false);

            modelBuilder.Entity<NghiencuuKH>()
                .Property(e => e.MaNCKH)
                .IsUnicode(false);

            modelBuilder.Entity<NoidungBMTT>()
                .Property(e => e.MaNDBMTT)
                .IsUnicode(false);

            modelBuilder.Entity<NoidungBMTT>()
                .Property(e => e.MaBMTT)
                .IsUnicode(false);

            modelBuilder.Entity<NoidungDT>()
                .Property(e => e.MaNDDT)
                .IsUnicode(false);

            modelBuilder.Entity<NoidungDT>()
                .Property(e => e.MaloaiDT)
                .IsUnicode(false);

            modelBuilder.Entity<NoidungDT>()
                .Property(e => e.Tentaikhoan)
                .IsUnicode(false);

            modelBuilder.Entity<NoidungGT>()
                .Property(e => e.MaNDGT)
                .IsUnicode(false);

            modelBuilder.Entity<NoidungGT>()
                .Property(e => e.MaGT)
                .IsUnicode(false);

            modelBuilder.Entity<NoidungGT>()
                .Property(e => e.Tentaikhoan)
                .IsUnicode(false);

            modelBuilder.Entity<Quyennguoidung>()
                .Property(e => e.Maquyen)
                .IsUnicode(false);

            modelBuilder.Entity<Quyennguoidung>()
                .HasMany(e => e.Chitietquyens)
                .WithRequired(e => e.Quyennguoidung)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Tag>()
                .Property(e => e.TagID)
                .IsUnicode(false);

            modelBuilder.Entity<Tag>()
                .Property(e => e.Machucvu)
                .IsUnicode(false);

            modelBuilder.Entity<Tag>()
                .HasMany(e => e.Chitietbaidangs)
                .WithRequired(e => e.Tag)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Taikhoan>()
                .Property(e => e.Tentaikhoan)
                .IsUnicode(false);

            modelBuilder.Entity<Taikhoan>()
                .Property(e => e.Matkhau)
                .IsUnicode(false);

            modelBuilder.Entity<Taikhoan>()
                .Property(e => e.Trangthaihd)
                .IsUnicode(false);

            modelBuilder.Entity<Taikhoan>()
                .HasMany(e => e.Chitietchuyentieps)
                .WithRequired(e => e.Taikhoan)
                .HasForeignKey(e => e.Taikhoannhan)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Taikhoan>()
                .HasMany(e => e.Thongbaochuyentieps)
                .WithOptional(e => e.Taikhoan)
                .HasForeignKey(e => e.Taikhoangui);

            modelBuilder.Entity<Thongbaochuyentiep>()
                .Property(e => e.Taikhoangui)
                .IsUnicode(false);

            modelBuilder.Entity<Thongbaochuyentiep>()
                .HasMany(e => e.Chitietchuyentieps)
                .WithRequired(e => e.Thongbaochuyentiep)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<ThongtinGV>()
                .Property(e => e.MaGV)
                .IsUnicode(false);

            modelBuilder.Entity<ThongtinGV>()
                .Property(e => e.MaBM)
                .IsUnicode(false);

            modelBuilder.Entity<ThongtinGV>()
                .Property(e => e.Diachimail)
                .IsUnicode(false);

            modelBuilder.Entity<Thongtinnguoidung>()
                .Property(e => e.Sodienthoai)
                .IsUnicode(false);

            modelBuilder.Entity<Thongtinnguoidung>()
                .Property(e => e.Gmail)
                .IsUnicode(false);

            modelBuilder.Entity<Thongtinnguoidung>()
                .Property(e => e.Tentaikhoan)
                .IsUnicode(false);

            modelBuilder.Entity<Thongtinnguoidung>()
                .Property(e => e.Machucvu)
                .IsUnicode(false);
        }
    }
}
