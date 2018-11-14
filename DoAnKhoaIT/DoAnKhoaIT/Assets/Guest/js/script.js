// JavaScript Document
function PlayVideo(value)
{
	$.ajax({
          type: "POST",
          url: "modules/mod_youtube/ajax.php",
          data: "link="+value,
          success: function(data_success) {
              if(data_success) {
                  document.getElementById("Player").innerHTML=data_success;
				  $("#"+CurrentPlaying).removeClass('activePlaying');
				  $("#"+value).addClass('activePlaying');
				  CurrentPlaying=value;

              } else {
                  document.getElementById("Player").innerHTML="Lỗi hệ thống, vui lòng tải lại";
              }
          }
      });
	
}
function ConfirmRegister()
{
	return confirm("Bạn có chắc muốn đăng ký hoạt động này??");
}
function submitLang(pressbutton)
{
	document.langForm.lang.value=pressbutton;
	document.langForm.submit();
}
function check_lienhe()
{
	if(document.frmlienhe.name.value=="")
	{
		document.frmlienhe.name.style.backgroundColor="#ffffcc";
		document.frmlienhe.name.focus();
		return false;
	}
	else
	{
		document.frmlienhe.name.style.backgroundColor="#fff";
	}
	if(document.frmlienhe.email.value=="")
	{
		document.frmlienhe.email.style.backgroundColor="#ffffcc";
		document.frmlienhe.email.focus();
		return false;
	}
	else
	{
		document.frmlienhe.email.style.backgroundColor="#fff";
	}
	if(document.frmlienhe.email.value.indexOf('@')==-1 || document.frmlienhe.email.value.indexOf('.')==-1 || document.frmlienhe.email.value.indexOf('')==1)
	{
		document.frmlienhe.email.style.backgroundColor="#ffffcc";
		document.frmlienhe.email.focus();
		return false;
	
	}
	else
	{
		document.frmlienhe.email.style.backgroundColor="#fff";
	}
	if(document.frmlienhe.title.value=="")
	{
		document.frmlienhe.title.style.backgroundColor="#ffffcc";
		document.frmlienhe.title.focus();
		return false;
	}
	else
	{
		document.frmlienhe.title.style.backgroundColor="#fff";
	}
	if(document.frmlienhe.content.value=="")
	{
		document.frmlienhe.content.style.backgroundColor="#ffffcc";
		document.frmlienhe.content.focus();
		return false;
	}
	else
	{
		document.frmlienhe.content.style.backgroundColor="#fff";
	}
	if(document.frmlienhe.security_code.value=="")
	{
		document.frmlienhe.security_code.style.backgroundColor="#ffffcc";
		document.frmlienhe.security_code.focus();
		return false;
	}
	else
	{
		document.frmlienhe.security_code.style.backgroundColor="#fff";
	}
}

function submitbutton(pressbutton,value)
{
	if(pressbutton=='delete')
	{
		a=confirm("Bạn có chắc muốn xóa tin này");
		if(a)
		{
			document.UserForm.t.value=pressbutton;
			document.UserForm.val.value=value;
			document.UserForm.submit();
		}
		else
		{
			return false;
		}
	}
	else
	{
		document.UserForm.t.value=pressbutton;
			document.UserForm.val.value=value;
			document.UserForm.submit();
	}
}

function check_newsteacher(flag)
{
	if(document.UserForm.title.value=="")
	{
		document.UserForm.title.style.backgroundColor="#ffffcc";
		document.UserForm.title.focus();
		return false;
	}
	else
	{
		document.UserForm.title.style.backgroundColor="#fff";
	}
	var oEditor = CKEDITOR.instances.intro;
        if (oEditor.getData() == '') {
            alert('Bạn chưa nhập nội dung MÔ TẢ. (Gợi ý: nếu nội dung ngắn có thể cho nội dung MÔ TẢ và CHI TIẾT giống nhau)');
            return false;
        }
	var oEditor = CKEDITOR.instances.detail;
        if (oEditor.getData() == '') {
            alert('Bạn chưa nhập nội dung CHI TIẾT. (Gợi ý: nếu nội dung ngắn có thể cho nội dung MÔ TẢ và CHI TIẾT giống nhau)');
            return false;
        }
	if(flag>1)
	{
		if(document.UserForm.id_menu.value=="")
		{
			document.UserForm.id_menu.style.backgroundColor="#ffffcc";
			return false;
		}
		else
		{
			document.UserForm.id_menu.style.backgroundColor="#fff";
		}
	}
}
	
function inputNumber(e)
{
	// cho phep nhap so, nut backspace, delete vau dau .
	var keynum;
	if(window.event) // IE
	{
	  keynum = e.keyCode;
	}
	else if(e.which) // Netscape/Firefox/Opera
	{
	  keynum = e.which;
	}
	if ( ((keynum > 45) && (keynum <58)) || (keynum == 8) || (keynum == 190) || (keynum == 9) )
		return true;
	else return false;
}
function showMota(value)
{
    $.ajax({
        type:'POST',
        url:'components/com_course/ajaxShowMota.php',
        data:"id="+value,
        success:function(data)
        {
            $("#showMota").html(data);
        }
    });
    return false;
}

function showLCT() {
    //$(".addLCT").siblings().toggle();
    if ($(".addLCT").is(":hidden")) {
        $(".addLCT").show();
        localStorage.setItem('display','s');
    } else {
        localStorage.setItem('display','h');
        $(".addLCT").hide();
    }
}

