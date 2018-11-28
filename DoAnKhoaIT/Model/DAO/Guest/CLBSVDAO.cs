﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model.EF;
using PagedList;
namespace Model.DAO.Guest
{
    public class CLBSVDAO
    {
        SGU db = new SGU();
        public IEnumerable<Baidang> ListCLBSV(int page, int pagesize)
        {
            return db.Baidangs.Where(e => db.Chitietbaidangs.Where(s => s.Mabaidang == e.Mabaidang && s.TagID == "9" && e.Flag == true && (e.ĐoituongHT == "SV" || e.ĐoituongHT == "ALL")).Any()).OrderByDescending(s => s.Ngaydang).ToPagedList(page, pagesize);
        }
        public Baidang CTBD(string mabaidang)
        {
            return db.Baidangs.Where(s => s.Mabaidang == mabaidang).SingleOrDefault();
        }
    }
}