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
            
            if (tungay != null || denngay != null || tieude != null || noidung != null || loaibd != null)
            {
                var query= db.Baidangs.Where(s => s.Flag == true).OrderByDescending(a => a.Ngaydang).ToPagedList(page, pagesize);
                if (tungay != null && denngay != null)
                    query = query.Where(s => s.Ngaydang >= tungay && s.Ngaydang <= denngay).ToPagedList(page, pagesize);
                if (tieude != null)
                    query = query.Where(s => s.Tieude.Contains(tieude)).ToPagedList(page, pagesize);
                if(noidung!=null)
                    query = query.Where(s => s.Noidung.Contains(noidung)).ToPagedList(page, pagesize);
                if (loaibd != null && loaibd != "Tất cả")
                    query = query.Where(e => db.Loaibaidangs.Where(s => s.Maloai == e.Maloai && s.Tenloai == loaibd).Any()).ToPagedList(page, pagesize);

                return query;

            }
            return db.Baidangs.Where(s=>s.Flag==true && (s.Tieude.Contains(txtsearch)||s.Noidung.Contains(txtsearch))).OrderByDescending(a => a.Ngaydang).ToPagedList(page, pagesize); 
            
        }


    }
}
