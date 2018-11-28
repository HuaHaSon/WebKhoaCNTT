using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model.EF;
using PagedList;
namespace Model.DAO.Guest
{
    public class ThongBaoDAO
    {
        SGU db = new SGU();
        public IEnumerable<Baidang> ListALL(int page, int pagesize, string txtsearch, DateTime? tungay, DateTime? denngay, string tieude, string noidung, string loaibd)
        {
            
            if (tungay == null && denngay == null && tieude == null && noidung == null && loaibd == null)
            {
                if(txtsearch==null)
                {
                    return db.Baidangs.Where(s => s.Flag == true && (s.ĐoituongHT=="SV" ||s.ĐoituongHT=="ALL") &&s.Maloai=="TB").OrderByDescending(a => a.Ngaydang).ToPagedList(page, pagesize);
                }
                else
                {
                    return db.Baidangs.Where(s => s.Flag == true && s.Maloai=="TB" && (s.Tieude.Contains(txtsearch) || s.Noidung.Contains(txtsearch)) && (s.ĐoituongHT == "SV" || s.ĐoituongHT == "ALL")).OrderByDescending(a => a.Ngaydang).ToPagedList(page, pagesize);
                }
                

            }
            else
            {
                var query = db.Baidangs.Where(s => s.Flag == true && (s.ĐoituongHT == "SV" || s.ĐoituongHT == "ALL"));
                if (tungay != null && denngay != null)
                    query = query.Where(s => s.Ngaydang >= tungay && s.Ngaydang <= denngay);
                if (tieude != null)
                    query = query.Where(s => s.Tieude.Contains(tieude));
                if (noidung != null)
                    query = query.Where(s => s.Noidung.Contains(noidung));
                if (loaibd != null && loaibd != "Tất cả")
                    query = query.Where(e => db.Loaibaidangs.Where(s => s.Maloai == e.Maloai && s.Tenloai == loaibd).Any());

                return query.OrderByDescending(a => a.Ngaydang).ToPagedList(page, pagesize); ;
            }
            
        }
        public Baidang CTBD(string mabaidang)
        {
            return db.Baidangs.Where(s => s.Flag == true && s.Mabaidang == mabaidang).SingleOrDefault();
        }


    }
}
