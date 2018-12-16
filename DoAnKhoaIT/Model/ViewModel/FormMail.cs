using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using Model.EF;

namespace Model.ViewModel
{
    public class FormMail
    {
        public PagedList.IPagedList<ModelMail> v1 { get; set; }
        public PagedList.IPagedList<ModelMail> v2 { get; set; }
        public PagedList.IPagedList<ModelMail> v3 { get; set; }
        public PagedList.IPagedList<ModelMail> v4 { get; set; }
        public PagedList.IPagedList<ModelMail> v5 { get; set; }

       
        public int mact { get; set; }
        public string hoten { get; set; }
        [Required(ErrorMessage = "Bạn chưa nhập mật khẩu mail!!")]
        public string password { get; set; }
        public string email { get; set; }
        public string taikhoangui { get; set; }
        [Required(ErrorMessage = "Bạn chưa nhập gmail nhận!!")]
        public string taikhoannhan { get; set; }
        [Required(ErrorMessage = "Bạn chưa nhập nội dụng!")]
        public string noidung { get; set; }
        [Required(ErrorMessage = "Bạn chưa nhập tiêu đề!!")]
        public string tieude { get; set; }
        [Required(ErrorMessage = "Bạn chưa chọn mức độ!!")]
        public string flag { get; set; }
        public DateTime? ngaynhan { get; set; }
        public DateTime? ngaygui { get; set; }
        public string trangthaixem { get; set; }
        public string trangthaichuyen { get; set; }
        

    }
}
