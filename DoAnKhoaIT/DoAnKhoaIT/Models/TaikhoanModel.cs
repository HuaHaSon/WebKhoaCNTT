using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace DoAnKhoaIT.Models
{
    public class TaikhoanModel
    {
        [Required(ErrorMessage = "Bạn chưa nhập tên tài khoản")]
        public string UserName { get; set; }
        [Required(ErrorMessage = "Bạn chưa nhập mật khẩu")]
        public string Password { get; set; }

        public bool RememberMe { get; set; }
    }
}