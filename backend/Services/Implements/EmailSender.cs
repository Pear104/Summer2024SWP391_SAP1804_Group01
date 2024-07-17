using System.Net;
using System.Net.Mail;
using BusinessObjects.Models;
using Microsoft.Extensions.Configuration;
using Services.Interfaces;

namespace Services.Implements
{
    public class EmailSender : IEmailSender
    {
        private readonly IConfiguration _config;

        public EmailSender(IConfiguration config)
        {
            _config = config;
        }

        public static string GetVerifyContent(string name, string link)
        {
            string htmlString =
                @"<!DOCTYPE html PUBLIC ""-//W3C//DTD XHTML 1.0 Transitional//EN"" ""http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd""><html dir=""ltr"" xmlns=""http://www.w3.org/1999/xhtml"" xmlns:o=""urn:schemas-microsoft-com:office:office"" lang=""en"" style=""font-family:arial,'helvetica neue',helvetica,sans-serif""><head><meta charset=""UTF-8""><meta content=""width=device-width,initial-scale=1"" name=""viewport""><meta name=""x-apple-disable-message-reformatting""><meta http-equiv=""X-UA-Compatible"" content=""IE=edge""><meta content=""telephone=no"" name=""format-detection""><title>New email template 2024-05-28</title><!--[if (mso 16)]><style type=""text/css"">a{text-decoration:none}</style><![endif]--><!--[if gte mso 9]><style>sup{font-size:100%!important}</style><![endif]--><!--[if gte mso 9]><xml><o:officedocumentsettings><o:allowpng></o:allowpng><o:pixelsperinch>96</o:pixelsperinch></o:officedocumentsettings></xml><![endif]--><!--[if !mso]><!-- --><link href=""https://fonts.googleapis.com/css2?family=Imprima&display=swap"" rel=""stylesheet""><!--<![endif]--><style type=""text/css"">#outlook a{padding:0}.es-button{mso-style-priority:100!important;text-decoration:none!important}a[x-apple-data-detectors]{color:inherit!important;text-decoration:none!important;font-size:inherit!important;font-family:inherit!important;font-weight:inherit!important;line-height:inherit!important}.es-desk-hidden{display:none;float:left;overflow:hidden;width:0;max-height:0;line-height:0;mso-hide:all}@media only screen and (max-width:600px){a,ol li,p,ul li{line-height:150%!important}h1,h1 a,h2,h2 a,h3,h3 a{line-height:120%}h1{font-size:30px!important;text-align:left}h2{font-size:24px!important;text-align:left}h3{font-size:20px!important;text-align:left}.es-content-body h1 a,.es-footer-body h1 a,.es-header-body h1 a{font-size:30px!important;text-align:left}.es-content-body h2 a,.es-footer-body h2 a,.es-header-body h2 a{font-size:24px!important;text-align:left}.es-content-body h3 a,.es-footer-body h3 a,.es-header-body h3 a{font-size:20px!important;text-align:left}.es-menu td a{font-size:14px!important}.es-header-body a,.es-header-body ol li,.es-header-body p,.es-header-body ul li{font-size:14px!important}.es-content-body a,.es-content-body ol li,.es-content-body p,.es-content-body ul li{font-size:14px!important}.es-footer-body a,.es-footer-body ol li,.es-footer-body p,.es-footer-body ul li{font-size:14px!important}.es-infoblock a,.es-infoblock ol li,.es-infoblock p,.es-infoblock ul li{font-size:12px!important}[class=gmail-fix]{display:none!important}.es-m-txt-c,.es-m-txt-c h1,.es-m-txt-c h2,.es-m-txt-c h3{text-align:center!important}.es-m-txt-r,.es-m-txt-r h1,.es-m-txt-r h2,.es-m-txt-r h3{text-align:right!important}.es-m-txt-l,.es-m-txt-l h1,.es-m-txt-l h2,.es-m-txt-l h3{text-align:left!important}.es-m-txt-c img,.es-m-txt-l img,.es-m-txt-r img{display:inline!important}.es-button-border{display:block!important}a.es-button,button.es-button{font-size:18px!important;display:block!important;border-right-width:0!important;border-left-width:0!important;border-top-width:15px!important;border-bottom-width:15px!important}.es-adaptive table,.es-left,.es-right{width:100%!important}.es-content,.es-content table,.es-footer,.es-footer table,.es-header,.es-header table{width:100%!important;max-width:600px!important}.es-adapt-td{display:block!important;width:100%!important}.adapt-img{width:100%!important;height:auto!important}.es-m-p0{padding:0!important}.es-m-p0r{padding-right:0!important}.es-m-p0l{padding-left:0!important}.es-m-p0t{padding-top:0!important}.es-m-p0b{padding-bottom:0!important}.es-m-p20b{padding-bottom:20px!important}.es-hidden,.es-mobile-hidden{display:none!important}table.es-desk-hidden,td.es-desk-hidden,tr.es-desk-hidden{width:auto!important;overflow:visible!important;float:none!important;max-height:inherit!important;line-height:inherit!important}tr.es-desk-hidden{display:table-row!important}table.es-desk-hidden{display:table!important}td.es-desk-menu-hidden{display:table-cell!important}.es-menu td{width:1%!important}.esd-block-html table,table.es-table-not-adapt{width:auto!important}table.es-social{display:inline-block!important}table.es-social td{display:inline-block!important}.es-desk-hidden{display:table-row!important;width:auto!important;overflow:visible!important;max-height:inherit!important}}@media screen and (max-width:384px){.mail-message-content{width:414px!important}}</style></head><body style=""width:100%;font-family:arial,'helvetica neue',helvetica,sans-serif;-webkit-text-size-adjust:100%;-ms-text-size-adjust:100%;padding:0;Margin:0""><div dir=""ltr"" class=""es-wrapper-color"" lang=""en"" style=""background-color:#fff""><!--[if gte mso 9]><v:background xmlns:v=""urn:schemas-microsoft-com:vml"" fill=""t""><v:fill type=""tile"" color=""#ffffff""></v:fill></v:background><![endif]--><table class=""es-wrapper"" width=""100%"" cellspacing=""0"" cellpadding=""0"" role=""none"" style=""mso-table-lspace:0;mso-table-rspace:0;border-collapse:collapse;border-spacing:0;padding:0;Margin:0;width:100%;height:100%;background-repeat:repeat;background-position:center top;background-color:#fff""><tr><td valign=""top"" style=""padding:0;Margin:0""><table cellpadding=""0"" cellspacing=""0"" class=""es-content"" align=""center"" role=""none"" style=""mso-table-lspace:0;mso-table-rspace:0;border-collapse:collapse;border-spacing:0;table-layout:fixed!important;width:100%""><tr><td align=""center"" style=""padding:0;Margin:0""><table bgcolor=""#efefef"" class=""es-content-body"" align=""center"" cellpadding=""0"" cellspacing=""0"" style=""mso-table-lspace:0;mso-table-rspace:0;border-collapse:collapse;border-spacing:0;background-color:#efefef;border-radius:20px 20px 0 0;width:600px"" role=""none""><tr><td align=""left"" style=""padding:0;Margin:0;padding-top:40px;padding-left:40px;padding-right:40px""><table cellpadding=""0"" cellspacing=""0"" width=""100%"" role=""none"" style=""mso-table-lspace:0;mso-table-rspace:0;border-collapse:collapse;border-spacing:0""><tr><td align=""center"" valign=""top"" style=""padding:0;Margin:0;width:520px""><table cellpadding=""0"" cellspacing=""0"" width=""100%"" role=""presentation"" style=""mso-table-lspace:0;mso-table-rspace:0;border-collapse:collapse;border-spacing:0""><tr><td align=""left"" class=""es-m-txt-c"" style=""padding:0;Margin:0;font-size:0""><a target=""_blank"" href="""" style=""-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;text-decoration:underline;color:#2d3142;font-size:18px""><img src='https://eikqahl.stripocdn.email/content/guids/CABINET_ee77850a5a9f3068d9355050e69c76d26d58c3ea2927fa145f0d7a894e624758/images/group_4076323.png' alt=""Confirm email"" style=""display:block;border:0;outline:0;text-decoration:none;-ms-interpolation-mode:bicubic;border-radius:100px"" width=""100"" title=""Confirm email""></a></td></tr></table></td></tr></table></td></tr><tr><td align=""left"" style=""padding:0;Margin:0;padding-top:20px;padding-left:40px;padding-right:40px""><table cellpadding=""0"" cellspacing=""0"" width=""100%"" role=""none"" style=""mso-table-lspace:0;mso-table-rspace:0;border-collapse:collapse;border-spacing:0""><tr><td align=""center"" valign=""top"" style=""padding:0;Margin:0;width:520px""><table cellpadding=""0"" cellspacing=""0"" width=""100%"" bgcolor=""#fafafa"" style=""mso-table-lspace:0;mso-table-rspace:0;border-collapse:separate;border-spacing:0;background-color:#fafafa;border-radius:10px"" role=""presentation""><tr><td align=""left"" style=""padding:20px;Margin:0""><h3 style=""Margin:0;line-height:34px;mso-line-height-rule:exactly;font-family:Imprima,Arial,sans-serif;font-size:28px;font-style:normal;font-weight:700;color:#2d3142"">Welcome,&nbsp;"
                + name
                + @"</h3><p style=""Margin:0;-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-family:Imprima,Arial,sans-serif;line-height:27px;color:#2d3142;font-size:18px""><br></p><p style=""Margin:0;-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-family:Imprima,Arial,sans-serif;line-height:27px;color:#2d3142;font-size:18px"">You're receiving this message because you recently signed up for a account.<br><br>Confirm your email address by clicking the button below. This step adds extra security to your business by verifying you own this email.</p></td></tr></table></td></tr></table></td></tr></table></td></tr></table><table cellpadding=""0"" cellspacing=""0"" class=""es-content"" align=""center"" role=""none"" style=""mso-table-lspace:0;mso-table-rspace:0;border-collapse:collapse;border-spacing:0;table-layout:fixed!important;width:100%""><tr><td align=""center"" style=""padding:0;Margin:0""><table bgcolor=""#efefef"" class=""es-content-body"" align=""center"" cellpadding=""0"" cellspacing=""0"" role=""none"" style=""mso-table-lspace:0;mso-table-rspace:0;border-collapse:collapse;border-spacing:0;background-color:#efefef;width:600px""><tr><td align=""left"" style=""Margin:0;padding-top:30px;padding-bottom:40px;padding-left:40px;padding-right:40px""><table cellpadding=""0"" cellspacing=""0"" width=""100%"" role=""none"" style=""mso-table-lspace:0;mso-table-rspace:0;border-collapse:collapse;border-spacing:0""><tr><td align=""center"" valign=""top"" style=""padding:0;Margin:0;width:520px""><table cellpadding=""0"" cellspacing=""0"" width=""100%"" role=""presentation"" style=""mso-table-lspace:0;mso-table-rspace:0;border-collapse:collapse;border-spacing:0""><tr><td align=""center"" style=""padding:0;Margin:0""><!--[if mso]><a href="""" target=""_blank"" hidden><v:roundrect xmlns:v=""urn:schemas-microsoft-com:vml"" xmlns:w=""urn:schemas-microsoft-com:office:word"" esdevvmlbutton href="""" style=""height:56px;v-text-anchor:middle;width:520px"" arcsize=""50%"" stroke=""f"" fillcolor=""#7630f3""><w:anchorlock></w:anchorlock><center style=""color:#fff;font-family:Imprima,Arial,sans-serif;font-size:22px;font-weight:700;line-height:22px;mso-text-raise:1px"">Confirm email</center></v:roundrect></a><![endif]--><!--[if !mso]><!-- --><span class=""msohide es-button-border"" style=""border-style:solid;border-color:#2cb543;background:#7630f3;border-width:0;display:block;border-radius:30px;width:auto;mso-hide:all""><a href="""
                + link
                + @""" class=""es-button msohide"" target=""_blank"" style=""mso-style-priority:100!important;text-decoration:none;-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;color:#fff;font-size:22px;padding:15px 20px 15px 20px;display:block;background:#7630f3;border-radius:30px;font-family:Imprima,Arial,sans-serif;font-weight:700;font-style:normal;line-height:26px;width:auto;text-align:center;mso-padding-alt:0;mso-border-alt:10px solid #7630f3;mso-hide:all;padding-left:5px;padding-right:5px"">Confirm email</a></span><!--<![endif]--></td></tr></table></td></tr></table></td></tr><tr><td align=""left"" style=""padding:0;Margin:0;padding-left:40px;padding-right:40px""><table cellpadding=""0"" cellspacing=""0"" width=""100%"" role=""none"" style=""mso-table-lspace:0;mso-table-rspace:0;border-collapse:collapse;border-spacing:0""><tr><td align=""center"" valign=""top"" style=""padding:0;Margin:0;width:520px""><table cellpadding=""0"" cellspacing=""0"" width=""100%"" role=""presentation"" style=""mso-table-lspace:0;mso-table-rspace:0;border-collapse:collapse;border-spacing:0""><tr><td align=""left"" style=""padding:0;Margin:0""><p style=""Margin:0;-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-family:Imprima,Arial,sans-serif;line-height:27px;color:#2d3142;font-size:18px"">Thanks,<br><br>DATJ DIAMOND</p></td></tr><tr><td align=""center"" style=""padding:0;Margin:0;padding-bottom:20px;padding-top:40px;font-size:0""><table border=""0"" width=""100%"" height=""100%"" cellpadding=""0"" cellspacing=""0"" role=""presentation"" style=""mso-table-lspace:0;mso-table-rspace:0;border-collapse:collapse;border-spacing:0""><tr><td style=""padding:0;Margin:0;border-bottom:1px solid #666;background:unset;height:1px;width:100%;margin:0""></td></tr></table></td></tr></table></td></tr></table></td></tr></table></td></tr></table><table cellpadding=""0"" cellspacing=""0"" class=""es-content"" align=""center"" role=""none"" style=""mso-table-lspace:0;mso-table-rspace:0;border-collapse:collapse;border-spacing:0;table-layout:fixed!important;width:100%""><tr><td align=""center"" style=""padding:0;Margin:0""><table bgcolor=""#efefef"" class=""es-content-body"" align=""center"" cellpadding=""0"" cellspacing=""0"" style=""mso-table-lspace:0;mso-table-rspace:0;border-collapse:collapse;border-spacing:0;background-color:#efefef;border-radius:0 0 20px 20px;width:600px"" role=""none""><tr><td class=""esdev-adapt-off"" align=""left"" style=""Margin:0;padding-top:20px;padding-bottom:20px;padding-left:40px;padding-right:40px""><table cellpadding=""0"" cellspacing=""0"" class=""esdev-mso-table"" role=""none"" style=""mso-table-lspace:0;mso-table-rspace:0;border-collapse:collapse;border-spacing:0;width:520px""><tr><td class=""esdev-mso-td"" valign=""top"" style=""padding:0;Margin:0""><table cellpadding=""0"" cellspacing=""0"" align=""left"" class=""es-left"" role=""none"" style=""mso-table-lspace:0;mso-table-rspace:0;border-collapse:collapse;border-spacing:0;float:left""><tr><td align=""center"" valign=""top"" style=""padding:0;Margin:0;width:47px""><table cellpadding=""0"" cellspacing=""0"" width=""100%"" role=""presentation"" style=""mso-table-lspace:0;mso-table-rspace:0;border-collapse:collapse;border-spacing:0""><tr><td align=""center"" class=""es-m-txt-l"" style=""padding:0;Margin:0;font-size:0""><a target=""_blank"" href=""https://viewstripo.email"" style=""-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;text-decoration:underline;color:#2d3142;font-size:18px""><img src=""https://eikqahl.stripocdn.email/content/guids/CABINET_ee77850a5a9f3068d9355050e69c76d26d58c3ea2927fa145f0d7a894e624758/images/group_4076325.png"" alt=""Demo"" style=""display:block;border:0;outline:0;text-decoration:none;-ms-interpolation-mode:bicubic"" width=""47"" height=""47"" title=""Demo""></a></td></tr></table></td></tr></table></td><td style=""padding:0;Margin:0;width:20px""></td><td class=""esdev-mso-td"" valign=""top"" style=""padding:0;Margin:0""><table cellpadding=""0"" cellspacing=""0"" class=""es-right"" align=""right"" role=""none"" style=""mso-table-lspace:0;mso-table-rspace:0;border-collapse:collapse;border-spacing:0;float:right""><tr><td align=""center"" valign=""top"" style=""padding:0;Margin:0;width:453px""><table cellpadding=""0"" cellspacing=""0"" width=""100%"" role=""presentation"" style=""mso-table-lspace:0;mso-table-rspace:0;border-collapse:collapse;border-spacing:0""><tr><td align=""left"" style=""padding:0;Margin:0""><p style=""Margin:0;-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-family:Imprima,Arial,sans-serif;line-height:24px;color:#2d3142;font-size:16px"">This link expire in 1 hours. If you have questions,<a target=""_blank"" style=""-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;text-decoration:underline;color:#2d3142;font-size:16px"" href=""https://viewstripo.email"">we're here to help</a></p></td></tr></table></td></tr></table></td></tr></table></td></tr></table></td></tr></table><table cellpadding=""0"" cellspacing=""0"" class=""es-footer"" align=""center"" role=""none"" style=""mso-table-lspace:0;mso-table-rspace:0;border-collapse:collapse;border-spacing:0;table-layout:fixed!important;width:100%;background-color:transparent;background-repeat:repeat;background-position:center top""><tr><td align=""center"" style=""padding:0;Margin:0""><table bgcolor=""#bcb8b1"" class=""es-footer-body"" align=""center"" cellpadding=""0"" cellspacing=""0"" role=""none"" style=""mso-table-lspace:0;mso-table-rspace:0;border-collapse:collapse;border-spacing:0;background-color:#fff;width:600px""><tr><td align=""left"" style=""Margin:0;padding-left:20px;padding-right:20px;padding-bottom:30px;padding-top:40px""><table cellpadding=""0"" cellspacing=""0"" width=""100%"" role=""none"" style=""mso-table-lspace:0;mso-table-rspace:0;border-collapse:collapse;border-spacing:0""><tr><td align=""left"" style=""padding:0;Margin:0;width:560px""><table cellpadding=""0"" cellspacing=""0"" width=""100%"" role=""presentation"" style=""mso-table-lspace:0;mso-table-rspace:0;border-collapse:collapse;border-spacing:0""><tr><td align=""center"" class=""es-m-txt-c"" style=""padding:0;Margin:0;padding-bottom:20px;font-size:0""><img src=""https://eikqahl.stripocdn.email/content/guids/44039dbf-1d18-45bc-bc7e-a579e359ff77/images/download.png"" alt=""Logo"" style=""display:block;border:0;outline:0;text-decoration:none;-ms-interpolation-mode:bicubic;font-size:12px"" title=""Logo"" height=""60""></td></tr><tr><td align=""center"" class=""es-m-txt-c"" style=""padding:0;Margin:0;padding-top:10px;padding-bottom:20px;font-size:0""><table cellpadding=""0"" cellspacing=""0"" class=""es-table-not-adapt es-social"" role=""presentation"" style=""mso-table-lspace:0;mso-table-rspace:0;border-collapse:collapse;border-spacing:0""><tr><td align=""center"" valign=""top"" style=""padding:0;Margin:0;padding-right:5px""><img src=""https://eikqahl.stripocdn.email/content/assets/img/social-icons/logo-black/twitter-logo-black.png"" alt=""Tw"" title=""Twitter"" height=""24"" style=""display:block;border:0;outline:0;text-decoration:none;-ms-interpolation-mode:bicubic""></td><td align=""center"" valign=""top"" style=""padding:0;Margin:0;padding-right:5px""><img src=""https://eikqahl.stripocdn.email/content/assets/img/social-icons/logo-black/facebook-logo-black.png"" alt=""Fb"" title=""Facebook"" height=""24"" style=""display:block;border:0;outline:0;text-decoration:none;-ms-interpolation-mode:bicubic""></td><td align=""center"" valign=""top"" style=""padding:0;Margin:0""><img src=""https://eikqahl.stripocdn.email/content/assets/img/social-icons/logo-black/linkedin-logo-black.png"" alt=""In"" title=""Linkedin"" height=""24"" style=""display:block;border:0;outline:0;text-decoration:none;-ms-interpolation-mode:bicubic""></td></tr></table></td></tr><tr><td align=""center"" style=""padding:0;Margin:0""><p style=""Margin:0;-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-family:Imprima,Arial,sans-serif;line-height:21px;color:#2d3142;font-size:13px""><a target=""_blank"" style=""-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;text-decoration:none;color:#2d3142;font-size:14px"" href=""""></a><a target=""_blank"" style=""-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;text-decoration:none;color:#2d3142;font-size:14px"" href="""">Privacy Policy</a><a target=""_blank"" style=""-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;text-decoration:none;color:#2d3142;font-size:13px"" href=""""></a>•<a target=""_blank"" style=""-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;text-decoration:none;color:#2d3142;font-size:14px"" href="""">Unsubscribe</a></p></td></tr><tr><td align=""center"" style=""padding:0;Margin:0;padding-top:20px""><p style=""Margin:0;-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-family:Imprima,Arial,sans-serif;line-height:21px;color:#2d3142;font-size:14px""><a target=""_blank"" href="""" style=""-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;text-decoration:underline;color:#2d3142;font-size:14px""></a>Copyright © 2024 DATJ Diamond .Inc</p></td></tr></table></td></tr></table></td></tr></table></td></tr></table></td></tr></table></div></body></html>";
            return htmlString;
        }

        public static string GetResetContent(string name, string link)
        {
            string htmlString =
                @"<!DOCTYPE html PUBLIC ""-//W3C//DTD XHTML 1.0 Transitional//EN"" ""http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd""><html dir=""ltr"" xmlns=""http://www.w3.org/1999/xhtml"" xmlns:o=""urn:schemas-microsoft-com:office:office"" lang=""en"" style=""font-family:arial,'helvetica neue',helvetica,sans-serif""><head><meta charset=""UTF-8""><meta content=""width=device-width,initial-scale=1"" name=""viewport""><meta name=""x-apple-disable-message-reformatting""><meta http-equiv=""X-UA-Compatible"" content=""IE=edge""><meta content=""telephone=no"" name=""format-detection""><title>New email template 2024-05-28</title><!--[if (mso 16)]><style type=""text/css"">a{text-decoration:none}</style><![endif]--><!--[if gte mso 9]><style>sup{font-size:100%!important}</style><![endif]--><!--[if gte mso 9]><xml><o:officedocumentsettings><o:allowpng></o:allowpng><o:pixelsperinch>96</o:pixelsperinch></o:officedocumentsettings></xml><![endif]--><!--[if !mso]><!-- --><link href=""https://fonts.googleapis.com/css2?family=Imprima&display=swap"" rel=""stylesheet""><!--<![endif]--><style type=""text/css"">#outlook a{padding:0}.es-button{mso-style-priority:100!important;text-decoration:none!important}a[x-apple-data-detectors]{color:inherit!important;text-decoration:none!important;font-size:inherit!important;font-family:inherit!important;font-weight:inherit!important;line-height:inherit!important}.es-desk-hidden{display:none;float:left;overflow:hidden;width:0;max-height:0;line-height:0;mso-hide:all}@media only screen and (max-width:600px){a,ol li,p,ul li{line-height:150%!important}h1,h1 a,h2,h2 a,h3,h3 a{line-height:120%}h1{font-size:30px!important;text-align:left}h2{font-size:24px!important;text-align:left}h3{font-size:20px!important;text-align:left}.es-content-body h1 a,.es-footer-body h1 a,.es-header-body h1 a{font-size:30px!important;text-align:left}.es-content-body h2 a,.es-footer-body h2 a,.es-header-body h2 a{font-size:24px!important;text-align:left}.es-content-body h3 a,.es-footer-body h3 a,.es-header-body h3 a{font-size:20px!important;text-align:left}.es-menu td a{font-size:14px!important}.es-header-body a,.es-header-body ol li,.es-header-body p,.es-header-body ul li{font-size:14px!important}.es-content-body a,.es-content-body ol li,.es-content-body p,.es-content-body ul li{font-size:14px!important}.es-footer-body a,.es-footer-body ol li,.es-footer-body p,.es-footer-body ul li{font-size:14px!important}.es-infoblock a,.es-infoblock ol li,.es-infoblock p,.es-infoblock ul li{font-size:12px!important}[class=gmail-fix]{display:none!important}.es-m-txt-c,.es-m-txt-c h1,.es-m-txt-c h2,.es-m-txt-c h3{text-align:center!important}.es-m-txt-r,.es-m-txt-r h1,.es-m-txt-r h2,.es-m-txt-r h3{text-align:right!important}.es-m-txt-l,.es-m-txt-l h1,.es-m-txt-l h2,.es-m-txt-l h3{text-align:left!important}.es-m-txt-c img,.es-m-txt-l img,.es-m-txt-r img{display:inline!important}.es-button-border{display:block!important}a.es-button,button.es-button{font-size:18px!important;display:block!important;border-right-width:0!important;border-left-width:0!important;border-top-width:15px!important;border-bottom-width:15px!important}.es-adaptive table,.es-left,.es-right{width:100%!important}.es-content,.es-content table,.es-footer,.es-footer table,.es-header,.es-header table{width:100%!important;max-width:600px!important}.es-adapt-td{display:block!important;width:100%!important}.adapt-img{width:100%!important;height:auto!important}.es-m-p0{padding:0!important}.es-m-p0r{padding-right:0!important}.es-m-p0l{padding-left:0!important}.es-m-p0t{padding-top:0!important}.es-m-p0b{padding-bottom:0!important}.es-m-p20b{padding-bottom:20px!important}.es-hidden,.es-mobile-hidden{display:none!important}table.es-desk-hidden,td.es-desk-hidden,tr.es-desk-hidden{width:auto!important;overflow:visible!important;float:none!important;max-height:inherit!important;line-height:inherit!important}tr.es-desk-hidden{display:table-row!important}table.es-desk-hidden{display:table!important}td.es-desk-menu-hidden{display:table-cell!important}.es-menu td{width:1%!important}.esd-block-html table,table.es-table-not-adapt{width:auto!important}table.es-social{display:inline-block!important}table.es-social td{display:inline-block!important}.es-desk-hidden{display:table-row!important;width:auto!important;overflow:visible!important;max-height:inherit!important}}@media screen and (max-width:384px){.mail-message-content{width:414px!important}}</style></head><body style=""width:100%;font-family:arial,'helvetica neue',helvetica,sans-serif;-webkit-text-size-adjust:100%;-ms-text-size-adjust:100%;padding:0;Margin:0""><div dir=""ltr"" class=""es-wrapper-color"" lang=""en"" style=""background-color:#fff""><!--[if gte mso 9]><v:background xmlns:v=""urn:schemas-microsoft-com:vml"" fill=""t""><v:fill type=""tile"" color=""#ffffff""></v:fill></v:background><![endif]--><table class=""es-wrapper"" width=""100%"" cellspacing=""0"" cellpadding=""0"" role=""none"" style=""mso-table-lspace:0;mso-table-rspace:0;border-collapse:collapse;border-spacing:0;padding:0;Margin:0;width:100%;height:100%;background-repeat:repeat;background-position:center top;background-color:#fff""><tr><td valign=""top"" style=""padding:0;Margin:0""><table cellpadding=""0"" cellspacing=""0"" class=""es-content"" align=""center"" role=""none"" style=""mso-table-lspace:0;mso-table-rspace:0;border-collapse:collapse;border-spacing:0;table-layout:fixed!important;width:100%""><tr><td align=""center"" style=""padding:0;Margin:0""><table bgcolor=""#efefef"" class=""es-content-body"" align=""center"" cellpadding=""0"" cellspacing=""0"" style=""mso-table-lspace:0;mso-table-rspace:0;border-collapse:collapse;border-spacing:0;background-color:#efefef;border-radius:20px 20px 0 0;width:600px"" role=""none""><tr><td align=""left"" style=""padding:0;Margin:0;padding-top:40px;padding-left:40px;padding-right:40px""><table cellpadding=""0"" cellspacing=""0"" width=""100%"" role=""none"" style=""mso-table-lspace:0;mso-table-rspace:0;border-collapse:collapse;border-spacing:0""><tr><td align=""center"" valign=""top"" style=""padding:0;Margin:0;width:520px""><table cellpadding=""0"" cellspacing=""0"" width=""100%"" role=""presentation"" style=""mso-table-lspace:0;mso-table-rspace:0;border-collapse:collapse;border-spacing:0""><tr><td align=""left"" class=""es-m-txt-c"" style=""padding:0;Margin:0;font-size:0""><a target=""_blank"" href="""" style=""-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;text-decoration:underline;color:#2d3142;font-size:18px""><img src='https://eikqahl.stripocdn.email/content/guids/CABINET_ee77850a5a9f3068d9355050e69c76d26d58c3ea2927fa145f0d7a894e624758/images/group_4076323.png' alt=""Confirm email"" style=""display:block;border:0;outline:0;text-decoration:none;-ms-interpolation-mode:bicubic;border-radius:100px"" width=""100"" title=""Confirm email""></a></td></tr></table></td></tr></table></td></tr><tr><td align=""left"" style=""padding:0;Margin:0;padding-top:20px;padding-left:40px;padding-right:40px""><table cellpadding=""0"" cellspacing=""0"" width=""100%"" role=""none"" style=""mso-table-lspace:0;mso-table-rspace:0;border-collapse:collapse;border-spacing:0""><tr><td align=""center"" valign=""top"" style=""padding:0;Margin:0;width:520px""><table cellpadding=""0"" cellspacing=""0"" width=""100%"" bgcolor=""#fafafa"" style=""mso-table-lspace:0;mso-table-rspace:0;border-collapse:separate;border-spacing:0;background-color:#fafafa;border-radius:10px"" role=""presentation""><tr><td align=""left"" style=""padding:20px;Margin:0""><h3 style=""Margin:0;line-height:34px;mso-line-height-rule:exactly;font-family:Imprima,Arial,sans-serif;font-size:28px;font-style:normal;font-weight:700;color:#2d3142"">Hi,&nbsp;"
                + name
                + @"</h3><p style=""Margin:0;-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-family:Imprima,Arial,sans-serif;line-height:27px;color:#2d3142;font-size:18px""><br></p><p style=""Margin:0;-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-family:Imprima,Arial,sans-serif;line-height:27px;color:#2d3142;font-size:18px"">You're receiving this message because you recently requested to reset your password.<br><br>Confirm your request by clicking the button below. This step adds extra form to fill your new password.</p></td></tr></table></td></tr></table></td></tr></table></td></tr></table><table cellpadding=""0"" cellspacing=""0"" class=""es-content"" align=""center"" role=""none"" style=""mso-table-lspace:0;mso-table-rspace:0;border-collapse:collapse;border-spacing:0;table-layout:fixed!important;width:100%""><tr><td align=""center"" style=""padding:0;Margin:0""><table bgcolor=""#efefef"" class=""es-content-body"" align=""center"" cellpadding=""0"" cellspacing=""0"" role=""none"" style=""mso-table-lspace:0;mso-table-rspace:0;border-collapse:collapse;border-spacing:0;background-color:#efefef;width:600px""><tr><td align=""left"" style=""Margin:0;padding-top:30px;padding-bottom:40px;padding-left:40px;padding-right:40px""><table cellpadding=""0"" cellspacing=""0"" width=""100%"" role=""none"" style=""mso-table-lspace:0;mso-table-rspace:0;border-collapse:collapse;border-spacing:0""><tr><td align=""center"" valign=""top"" style=""padding:0;Margin:0;width:520px""><table cellpadding=""0"" cellspacing=""0"" width=""100%"" role=""presentation"" style=""mso-table-lspace:0;mso-table-rspace:0;border-collapse:collapse;border-spacing:0""><tr><td align=""center"" style=""padding:0;Margin:0""><!--[if mso]><a href="""" target=""_blank"" hidden><v:roundrect xmlns:v=""urn:schemas-microsoft-com:vml"" xmlns:w=""urn:schemas-microsoft-com:office:word"" esdevvmlbutton href="""" style=""height:56px;v-text-anchor:middle;width:520px"" arcsize=""50%"" stroke=""f"" fillcolor=""#7630f3""><w:anchorlock></w:anchorlock><center style=""color:#fff;font-family:Imprima,Arial,sans-serif;font-size:22px;font-weight:700;line-height:22px;mso-text-raise:1px"">Confirm email</center></v:roundrect></a><![endif]--><!--[if !mso]><!-- --><span class=""msohide es-button-border"" style=""border-style:solid;border-color:#2cb543;background:#7630f3;border-width:0;display:block;border-radius:30px;width:auto;mso-hide:all""><a href="""
                + link
                + @""" class=""es-button msohide"" target=""_blank"" style=""mso-style-priority:100!important;text-decoration:none;-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;color:#fff;font-size:22px;padding:15px 20px 15px 20px;display:block;background:#7630f3;border-radius:30px;font-family:Imprima,Arial,sans-serif;font-weight:700;font-style:normal;line-height:26px;width:auto;text-align:center;mso-padding-alt:0;mso-border-alt:10px solid #7630f3;mso-hide:all;padding-left:5px;padding-right:5px"">Reset password</a></span><!--<![endif]--></td></tr></table></td></tr></table></td></tr><tr><td align=""left"" style=""padding:0;Margin:0;padding-left:40px;padding-right:40px""><table cellpadding=""0"" cellspacing=""0"" width=""100%"" role=""none"" style=""mso-table-lspace:0;mso-table-rspace:0;border-collapse:collapse;border-spacing:0""><tr><td align=""center"" valign=""top"" style=""padding:0;Margin:0;width:520px""><table cellpadding=""0"" cellspacing=""0"" width=""100%"" role=""presentation"" style=""mso-table-lspace:0;mso-table-rspace:0;border-collapse:collapse;border-spacing:0""><tr><td align=""left"" style=""padding:0;Margin:0""><p style=""Margin:0;-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-family:Imprima,Arial,sans-serif;line-height:27px;color:#2d3142;font-size:18px"">Thanks,<br><br>DATJ DIAMOND</p></td></tr><tr><td align=""center"" style=""padding:0;Margin:0;padding-bottom:20px;padding-top:40px;font-size:0""><table border=""0"" width=""100%"" height=""100%"" cellpadding=""0"" cellspacing=""0"" role=""presentation"" style=""mso-table-lspace:0;mso-table-rspace:0;border-collapse:collapse;border-spacing:0""><tr><td style=""padding:0;Margin:0;border-bottom:1px solid #666;background:unset;height:1px;width:100%;margin:0""></td></tr></table></td></tr></table></td></tr></table></td></tr></table></td></tr></table><table cellpadding=""0"" cellspacing=""0"" class=""es-content"" align=""center"" role=""none"" style=""mso-table-lspace:0;mso-table-rspace:0;border-collapse:collapse;border-spacing:0;table-layout:fixed!important;width:100%""><tr><td align=""center"" style=""padding:0;Margin:0""><table bgcolor=""#efefef"" class=""es-content-body"" align=""center"" cellpadding=""0"" cellspacing=""0"" style=""mso-table-lspace:0;mso-table-rspace:0;border-collapse:collapse;border-spacing:0;background-color:#efefef;border-radius:0 0 20px 20px;width:600px"" role=""none""><tr><td class=""esdev-adapt-off"" align=""left"" style=""Margin:0;padding-top:20px;padding-bottom:20px;padding-left:40px;padding-right:40px""><table cellpadding=""0"" cellspacing=""0"" class=""esdev-mso-table"" role=""none"" style=""mso-table-lspace:0;mso-table-rspace:0;border-collapse:collapse;border-spacing:0;width:520px""><tr><td class=""esdev-mso-td"" valign=""top"" style=""padding:0;Margin:0""><table cellpadding=""0"" cellspacing=""0"" align=""left"" class=""es-left"" role=""none"" style=""mso-table-lspace:0;mso-table-rspace:0;border-collapse:collapse;border-spacing:0;float:left""><tr><td align=""center"" valign=""top"" style=""padding:0;Margin:0;width:47px""><table cellpadding=""0"" cellspacing=""0"" width=""100%"" role=""presentation"" style=""mso-table-lspace:0;mso-table-rspace:0;border-collapse:collapse;border-spacing:0""><tr><td align=""center"" class=""es-m-txt-l"" style=""padding:0;Margin:0;font-size:0""><a target=""_blank"" href=""https://viewstripo.email"" style=""-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;text-decoration:underline;color:#2d3142;font-size:18px""><img src=""https://eikqahl.stripocdn.email/content/guids/CABINET_ee77850a5a9f3068d9355050e69c76d26d58c3ea2927fa145f0d7a894e624758/images/group_4076325.png"" alt=""Demo"" style=""display:block;border:0;outline:0;text-decoration:none;-ms-interpolation-mode:bicubic"" width=""47"" height=""47"" title=""Demo""></a></td></tr></table></td></tr></table></td><td style=""padding:0;Margin:0;width:20px""></td><td class=""esdev-mso-td"" valign=""top"" style=""padding:0;Margin:0""><table cellpadding=""0"" cellspacing=""0"" class=""es-right"" align=""right"" role=""none"" style=""mso-table-lspace:0;mso-table-rspace:0;border-collapse:collapse;border-spacing:0;float:right""><tr><td align=""center"" valign=""top"" style=""padding:0;Margin:0;width:453px""><table cellpadding=""0"" cellspacing=""0"" width=""100%"" role=""presentation"" style=""mso-table-lspace:0;mso-table-rspace:0;border-collapse:collapse;border-spacing:0""><tr><td align=""left"" style=""padding:0;Margin:0""><p style=""Margin:0;-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-family:Imprima,Arial,sans-serif;line-height:24px;color:#2d3142;font-size:16px"">This link expire in 5 minutes. If you have questions,<a target=""_blank"" style=""-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;text-decoration:underline;color:#2d3142;font-size:16px"" href=""https://viewstripo.email"">we're here to help</a></p></td></tr></table></td></tr></table></td></tr></table></td></tr></table></td></tr></table><table cellpadding=""0"" cellspacing=""0"" class=""es-footer"" align=""center"" role=""none"" style=""mso-table-lspace:0;mso-table-rspace:0;border-collapse:collapse;border-spacing:0;table-layout:fixed!important;width:100%;background-color:transparent;background-repeat:repeat;background-position:center top""><tr><td align=""center"" style=""padding:0;Margin:0""><table bgcolor=""#bcb8b1"" class=""es-footer-body"" align=""center"" cellpadding=""0"" cellspacing=""0"" role=""none"" style=""mso-table-lspace:0;mso-table-rspace:0;border-collapse:collapse;border-spacing:0;background-color:#fff;width:600px""><tr><td align=""left"" style=""Margin:0;padding-left:20px;padding-right:20px;padding-bottom:30px;padding-top:40px""><table cellpadding=""0"" cellspacing=""0"" width=""100%"" role=""none"" style=""mso-table-lspace:0;mso-table-rspace:0;border-collapse:collapse;border-spacing:0""><tr><td align=""left"" style=""padding:0;Margin:0;width:560px""><table cellpadding=""0"" cellspacing=""0"" width=""100%"" role=""presentation"" style=""mso-table-lspace:0;mso-table-rspace:0;border-collapse:collapse;border-spacing:0""><tr><td align=""center"" class=""es-m-txt-c"" style=""padding:0;Margin:0;padding-bottom:20px;font-size:0""><img src=""https://eikqahl.stripocdn.email/content/guids/44039dbf-1d18-45bc-bc7e-a579e359ff77/images/download.png"" alt=""Logo"" style=""display:block;border:0;outline:0;text-decoration:none;-ms-interpolation-mode:bicubic;font-size:12px"" title=""Logo"" height=""60""></td></tr><tr><td align=""center"" class=""es-m-txt-c"" style=""padding:0;Margin:0;padding-top:10px;padding-bottom:20px;font-size:0""><table cellpadding=""0"" cellspacing=""0"" class=""es-table-not-adapt es-social"" role=""presentation"" style=""mso-table-lspace:0;mso-table-rspace:0;border-collapse:collapse;border-spacing:0""><tr><td align=""center"" valign=""top"" style=""padding:0;Margin:0;padding-right:5px""><img src=""https://eikqahl.stripocdn.email/content/assets/img/social-icons/logo-black/twitter-logo-black.png"" alt=""Tw"" title=""Twitter"" height=""24"" style=""display:block;border:0;outline:0;text-decoration:none;-ms-interpolation-mode:bicubic""></td><td align=""center"" valign=""top"" style=""padding:0;Margin:0;padding-right:5px""><img src=""https://eikqahl.stripocdn.email/content/assets/img/social-icons/logo-black/facebook-logo-black.png"" alt=""Fb"" title=""Facebook"" height=""24"" style=""display:block;border:0;outline:0;text-decoration:none;-ms-interpolation-mode:bicubic""></td><td align=""center"" valign=""top"" style=""padding:0;Margin:0""><img src=""https://eikqahl.stripocdn.email/content/assets/img/social-icons/logo-black/linkedin-logo-black.png"" alt=""In"" title=""Linkedin"" height=""24"" style=""display:block;border:0;outline:0;text-decoration:none;-ms-interpolation-mode:bicubic""></td></tr></table></td></tr><tr><td align=""center"" style=""padding:0;Margin:0""><p style=""Margin:0;-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-family:Imprima,Arial,sans-serif;line-height:21px;color:#2d3142;font-size:13px""><a target=""_blank"" style=""-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;text-decoration:none;color:#2d3142;font-size:14px"" href=""""></a><a target=""_blank"" style=""-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;text-decoration:none;color:#2d3142;font-size:14px"" href="""">Privacy Policy</a><a target=""_blank"" style=""-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;text-decoration:none;color:#2d3142;font-size:13px"" href=""""></a>•<a target=""_blank"" style=""-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;text-decoration:none;color:#2d3142;font-size:14px"" href="""">Unsubscribe</a></p></td></tr><tr><td align=""center"" style=""padding:0;Margin:0;padding-top:20px""><p style=""Margin:0;-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-family:Imprima,Arial,sans-serif;line-height:21px;color:#2d3142;font-size:14px""><a target=""_blank"" href="""" style=""-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;text-decoration:underline;color:#2d3142;font-size:14px""></a>Copyright © 2024 DATJ Diamond .Inc</p></td></tr></table></td></tr></table></td></tr></table></td></tr></table></td></tr></table></div></body></html>";
            return htmlString;
        }

        public static string GetOrderContent(Order order, string content)
        {
            var orderTable = order
                .OrderDetails.Select(x =>
                    @"
                <tr style=""height:50px"">
                    <td style=""padding:0;Margin:0;text-align:center;font-family:manrope, arial, sans-serif;font-size:12px"">"
                    + $"{x.Diamond.Carat} Carat {x.Diamond.Shape.Name} Shape Lab Diamond"
                    + @"</td>
                          <td style=""padding:0;Margin:0;text-align:center;font-family:manrope, arial, sans-serif;font-size:12px"">$"
                    + (
                        x.Diamond.Carat * x.DiamondPrice.UnitPrice * 100 * order.PriceRate.Percent
                    ).ToString("N0")
                    + @"</td>
                         </tr>"
                    + (
                        x.AccessoryId != null
                            ? @"
                <tr style=""height:50px"">
                          <td style=""padding:0;Margin:0;text-align:center;font-family:manrope, arial, sans-serif;font-size:12px"">"
                                + x?.Accessory?.Name
                                + @"</td>
                          <td style=""padding:0;Margin:0;text-align:center;font-family:manrope, arial, sans-serif;font-size:12px"">$"
                                + (
                                    (
                                        (x?.Accessory?.MaterialWeight + (x?.Size - 3))
                                            * x?.MaterialPrice?.UnitPrice
                                        + x?.Accessory?.AccessoryType.ProcessingPrice
                                    ) * order.PriceRate.Percent
                                )?.ToString("N0")
                                + @"</td>
                         </tr>"
                            : ""
                    )
                )
                .ToList();
            string htmlString =
                @"<!DOCTYPE html PUBLIC ""-//W3C//DTD XHTML 1.0 Transitional//EN"" ""http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"">
<html dir=""ltr"" xmlns=""http://www.w3.org/1999/xhtml"" xmlns:o=""urn:schemas-microsoft-com:office:office"" lang=""en"" style=""font-family:arial, 'helvetica neue', helvetica, sans-serif"">
 <head>
  <meta charset=""UTF-8"">
  <meta content=""width=device-width, initial-scale=1"" name=""viewport"">
  <meta name=""x-apple-disable-message-reformatting"">
  <meta http-equiv=""X-UA-Compatible"" content=""IE=edge"">
  <meta content=""telephone=no"" name=""format-detection"">
  <title>New Template</title><!--[if (mso 16)]>
    <style type=""text/css"">
    a {text-decoration: none;}
    </style>
    <![endif]--><!--[if gte mso 9]><style>sup { font-size: 100% !important; }</style><![endif]--><!--[if gte mso 9]>
<xml>
    <o:OfficeDocumentSettings>
    <o:AllowPNG></o:AllowPNG>
    <o:PixelsPerInch>96</o:PixelsPerInch>
    </o:OfficeDocumentSettings>
</xml>
<![endif]--><!--[if !mso]><!-- -->
  <link href=""https://fonts.googleapis.com/css2?family=Manrope:wght@200;300;400;500;600;700;800&display=swap"" rel=""stylesheet"">
  <link href=""https://fonts.googleapis.com/css2?family=Manrope&display=swap"" rel=""stylesheet""><!--<![endif]-->
  <style type=""text/css"">
#outlook a {
	padding:0;
}
.es-button {
	mso-style-priority:100!important;
	text-decoration:none!important;
}
a[x-apple-data-detectors] {
	color:inherit!important;
	text-decoration:none!important;
	font-size:inherit!important;
	font-family:inherit!important;
	font-weight:inherit!important;
	line-height:inherit!important;
}
.es-desk-hidden {
	display:none;
	float:left;
	overflow:hidden;
	width:0;
	max-height:0;
	line-height:0;
	mso-hide:all;
}
@media only screen and (max-width:600px) {p, ul li, ol li, a { line-height:150%!important } h1, h2, h3, h1 a, h2 a, h3 a { line-height:120% } h1 { font-size:30px!important; text-align:center!important } h2 { font-size:24px!important; text-align:center!important } h3 { font-size:20px!important; text-align:center!important } .es-header-body h1 a, .es-content-body h1 a, .es-footer-body h1 a { font-size:30px!important; text-align:center!important } .es-header-body h2 a, .es-content-body h2 a, .es-footer-body h2 a { font-size:24px!important; text-align:center!important } .es-header-body h3 a, .es-content-body h3 a, .es-footer-body h3 a { font-size:20px!important; text-align:center!important } .es-menu td a { font-size:12px!important } .es-header-body p, .es-header-body ul li, .es-header-body ol li, .es-header-body a { font-size:12px!important } .es-content-body p, .es-content-body ul li, .es-content-body ol li, .es-content-body a { font-size:12px!important } .es-footer-body p, .es-footer-body ul li, .es-footer-body ol li, .es-footer-body a { font-size:12px!important } .es-infoblock p, .es-infoblock ul li, .es-infoblock ol li, .es-infoblock a { font-size:12px!important } *[class=""gmail-fix""] { display:none!important } .es-m-txt-c, .es-m-txt-c h1, .es-m-txt-c h2, .es-m-txt-c h3 { text-align:center!important } .es-m-txt-r, .es-m-txt-r h1, .es-m-txt-r h2, .es-m-txt-r h3 { text-align:right!important } .es-m-txt-l, .es-m-txt-l h1, .es-m-txt-l h2, .es-m-txt-l h3 { text-align:left!important } .es-m-txt-r img, .es-m-txt-c img, .es-m-txt-l img { display:inline!important } .es-button-border { display:inline-block!important } a.es-button, button.es-button { font-size:18px!important; display:inline-block!important } .es-adaptive table, .es-left, .es-right { width:100%!important } .es-content table, .es-header table, .es-footer table, .es-content, .es-footer, .es-header { width:100%!important; max-width:600px!important } .es-adapt-td { display:block!important; width:100%!important } .adapt-img { width:100%!important; height:auto!important } .es-m-p0 { padding:0!important } .es-m-p0r { padding-right:0!important } .es-m-p0l { padding-left:0!important } .es-m-p0t { padding-top:0!important } .es-m-p0b { padding-bottom:0!important } .es-m-p20b { padding-bottom:20px!important } .es-mobile-hidden, .es-hidden { display:none!important } tr.es-desk-hidden, td.es-desk-hidden, table.es-desk-hidden { width:auto!important; overflow:visible!important; float:none!important; max-height:inherit!important; line-height:inherit!important } tr.es-desk-hidden { display:table-row!important } table.es-desk-hidden { display:table!important } td.es-desk-menu-hidden { display:table-cell!important } .es-menu td { width:1%!important } table.es-table-not-adapt, .esd-block-html table { width:auto!important } table.es-social { display:inline-block!important } table.es-social td { display:inline-block!important } .es-desk-hidden { display:table-row!important; width:auto!important; overflow:visible!important; max-height:inherit!important } .es-m-p5 { padding:5px!important } .es-m-p5t { padding-top:5px!important } .es-m-p5b { padding-bottom:5px!important } .es-m-p5r { padding-right:5px!important } .es-m-p5l { padding-left:5px!important } .es-m-p10 { padding:10px!important } .es-m-p10t { padding-top:10px!important } .es-m-p10b { padding-bottom:10px!important } .es-m-p10r { padding-right:10px!important } .es-m-p10l { padding-left:10px!important } .es-m-p15 { padding:15px!important } .es-m-p15t { padding-top:15px!important } .es-m-p15b { padding-bottom:15px!important } .es-m-p15r { padding-right:15px!important } .es-m-p15l { padding-left:15px!important } .es-m-p20 { padding:20px!important } .es-m-p20t { padding-top:20px!important } .es-m-p20r { padding-right:20px!important } .es-m-p20l { padding-left:20px!important } .es-m-p25 { padding:25px!important } .es-m-p25t { padding-top:25px!important } .es-m-p25b { padding-bottom:25px!important } .es-m-p25r { padding-right:25px!important } .es-m-p25l { padding-left:25px!important } .es-m-p30 { padding:30px!important } .es-m-p30t { padding-top:30px!important } .es-m-p30b { padding-bottom:30px!important } .es-m-p30r { padding-right:30px!important } .es-m-p30l { padding-left:30px!important } .es-m-p35 { padding:35px!important } .es-m-p35t { padding-top:35px!important } .es-m-p35b { padding-bottom:35px!important } .es-m-p35r { padding-right:35px!important } .es-m-p35l { padding-left:35px!important } .es-m-p40 { padding:40px!important } .es-m-p40t { padding-top:40px!important } .es-m-p40b { padding-bottom:40px!important } .es-m-p40r { padding-right:40px!important } .es-m-p40l { padding-left:40px!important } .h-auto { height:auto!important } }
@media screen and (max-width:384px) {.mail-message-content { width:414px!important } }
</style>
 </head>
 <body style=""width:100%;font-family:arial, 'helvetica neue', helvetica, sans-serif;-webkit-text-size-adjust:100%;-ms-text-size-adjust:100%;padding:0;Margin:0"">
  <div dir=""ltr"" class=""es-wrapper-color"" lang=""en"" style=""background-color:#FFFFFF""><!--[if gte mso 9]>
			<v:background xmlns:v=""urn:schemas-microsoft-com:vml"" fill=""t"">
				<v:fill type=""tile"" color=""#ffffff""></v:fill>
			</v:background>
		<![endif]-->
   <table class=""es-wrapper"" width=""100%"" cellspacing=""0"" cellpadding=""0"" style=""mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;padding:0;Margin:0;width:100%;height:100%;background-repeat:repeat;background-position:center top;background-color:#FFFFFF"">
     <tr>
      <td valign=""top"" style=""padding:0;Margin:0"">
       <table cellpadding=""0"" cellspacing=""0"" class=""es-header"" align=""center"" style=""mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;table-layout:fixed !important;width:100%;background-color:transparent;background-repeat:repeat;background-position:center top"">
         <tr>
          <td align=""center"" style=""padding:0;Margin:0"">
           <table bgcolor=""#ffffff"" class=""es-header-body"" align=""center"" cellpadding=""0"" cellspacing=""0"" style=""mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;background-color:#FFFFFF;width:500px"">
             <tr>
              <td align=""left"" style=""padding:0;Margin:0;padding-right:20px;padding-left:30px;padding-top:40px"">
               <table cellpadding=""0"" cellspacing=""0"" width=""100%"" style=""mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px"">
                 <tr>
                  <td class=""es-m-p0r"" valign=""top"" align=""center"" style=""padding:0;Margin:0;width:450px"">
                   <table cellpadding=""0"" cellspacing=""0"" width=""100%"" style=""mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px"">
                     <tr>
                      <td align=""center"" class=""es-m-txt-c"" style=""padding:0;Margin:0;font-size:0px""><a target=""_blank"" href=""https://viewstripo.email"" style=""-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;text-decoration:underline;color:#44465F;font-size:14px""><img src=""https://eikqahl.stripocdn.email/content/guids/CABINET_01d9349d38b9ff1d43039f1e58de32c41a4c2da750284f1fee84f8388865c801/images/downloadremovebgpreview.png"" alt="""" style=""display:block;border:0;outline:none;text-decoration:none;-ms-interpolation-mode:bicubic"" title=""Logo"" width=""200"" height=""55""></a></td>
                     </tr>
                   </table></td>
                 </tr>
               </table></td>
             </tr>
           </table></td>
         </tr>
       </table>
       <table cellpadding=""0"" cellspacing=""0"" class=""es-content"" align=""center"" style=""mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;table-layout:fixed !important;width:100%"">
         <tr>
          <td align=""center"" background=""https://eikqahl.stripocdn.email/content/guids/CABINET_cc952a79d6ea8e3c503431d548249b8c/images/frame_29_QFf.png"" style=""padding:0;Margin:0;background-image:url(https://eikqahl.stripocdn.email/content/guids/CABINET_cc952a79d6ea8e3c503431d548249b8c/images/frame_29_QFf.png);background-repeat:no-repeat;background-position:center bottom"">
           <table bgcolor=""#ffffff"" class=""es-content-body"" align=""center"" cellpadding=""0"" cellspacing=""0"" style=""mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;background-color:#F4F4F4;width:500px"">
             <tr>
              <td align=""left"" bgcolor=""#ffffff"" style=""padding:0;Margin:0;background-color:#ffffff"">
               <table width=""100%"" cellspacing=""0"" cellpadding=""0"" style=""mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px"">
                 <tr>
                  <td class=""es-m-p0r"" valign=""top"" align=""center"" style=""padding:0;Margin:0;width:500px"">
                   <table width=""100%"" cellspacing=""0"" cellpadding=""0"" style=""mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px"">
                     <tr>
                      <td align=""center"" style=""padding:0;Margin:0;font-size:0px""><img class=""adapt-img"" src=""https://eikqahl.stripocdn.email/content/guids/CABINET_cc952a79d6ea8e3c503431d548249b8c/images/group_4075959.png"" alt style=""display:block;border:0;outline:none;text-decoration:none;-ms-interpolation-mode:bicubic"" width=""540"" height=""67""></td>
                     </tr>
                   </table></td>
                 </tr>
               </table></td>
             </tr>
             <tr>
              <td align=""left"" style=""Margin:0;padding-bottom:15px;padding-left:20px;padding-right:20px;padding-top:30px"">
               <table cellpadding=""0"" cellspacing=""0"" width=""100%"" style=""mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px"">
                 <tr>
                  <td align=""center"" valign=""top"" style=""padding:0;Margin:0;width:460px"">
                   <table cellpadding=""0"" cellspacing=""0"" width=""100%"" style=""mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px"">
                     <tr>
                      <td align=""center"" style=""padding:0;Margin:0""><h1 style=""Margin:0;line-height:36px;mso-line-height-rule:exactly;font-family:Manrope, sans-serif;font-size:30px;font-style:normal;font-weight:bold;color:#44465F"">"
                + content
                + @"</h1></td>
                     </tr>
                     <tr>
                      <td align=""center"" style=""padding:0;Margin:0;padding-top:5px;padding-bottom:5px""><p style=""Margin:0;-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-family:Manrope, sans-serif;line-height:21px;color:#44465F;font-size:14px"">"
                + $"Hello {order?.Customer?.Name}! {content}"
                + @"</p><p style=""Margin:0;-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-family:Manrope, sans-serif;line-height:21px;color:#44465F;font-size:14px"">Please review your order information below</p></td>
                     </tr>
                   </table></td>
                 </tr>
               </table></td>
             </tr>
             <tr>
              <td align=""left"" style=""padding:0;Margin:0;padding-left:20px;padding-right:20px"">
               <table cellpadding=""0"" cellspacing=""0"" width=""100%"" style=""mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px"">
                 <tr>
                  <td align=""center"" valign=""top"" style=""padding:0;Margin:0;width:460px"">
                   <table cellpadding=""0"" cellspacing=""0"" width=""100%"" style=""mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;border-top:1px solid #040404;border-bottom:1px solid transparent"">
                     <tr>
                      <td align=""center"" style=""padding:0;Margin:0;padding-top:10px""><p style=""Margin:0;-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-family:Manrope, sans-serif;line-height:45px;color:#44465F;font-size:24px""><strong>ORDER # "
                + order?.OrderId
                + @"</strong></p><p style=""Margin:0;-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-family:Manrope, sans-serif;line-height:21px;color:#44465F;font-size:14px"">"
                + order?.CreatedAt.ToString("dd/MM/yyyy")
                + @"</p></td>
                     </tr>
                   </table></td>
                 </tr>
               </table></td>
             </tr>
             <tr>
              <td align=""left"" style=""padding:0;Margin:0;padding-top:20px;padding-left:20px;padding-right:20px"">
               <table cellpadding=""0"" cellspacing=""0"" width=""100%"" style=""mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px"">
                 <tr>
                  <td align=""center"" valign=""top"" style=""padding:0;Margin:0;width:460px"">
                   <table cellpadding=""0"" cellspacing=""0"" width=""100%"" style=""mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;border-bottom:1px solid #333333"">
                     <tr>
                      <td align=""left"" style=""padding:0;Margin:0"">
                       <ul>
                        <li style=""-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-family:Manrope, sans-serif;line-height:17px;Margin-bottom:15px;margin-left:0;color:#44465F;font-size:17px""><p style=""Margin:0;-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-family:Manrope, sans-serif;line-height:14px;color:#44465F;font-size:14px""><strong>Client Name:</strong> "
                + order?.Customer?.Name
                + @"</p></li>
                        <li style=""-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-family:Manrope, sans-serif;line-height:17px;Margin-bottom:15px;margin-left:0;color:#44465F;font-size:17px""><p style=""Margin:0;-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-family:Manrope, sans-serif;line-height:14px;color:#44465F;font-size:14px""><strong>Address:</strong> "
                + order?.ShippingAddress
                + @"</p></li>
                        <li style=""-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-family:Manrope, sans-serif;line-height:17px;Margin-bottom:15px;margin-left:0;color:#44465F;font-size:17px""><p style=""Margin:0;-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-family:Manrope, sans-serif;line-height:14px;color:#44465F;font-size:14px""><strong>Phone number:</strong> "
                + order?.PhoneNumber
                + @"</p></li>
                        <li style=""-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-family:Manrope, sans-serif;line-height:17px;Margin-bottom:15px;margin-left:0;color:#44465F;font-size:17px""><p style=""Margin:0;-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-family:Manrope, sans-serif;line-height:14px;color:#44465F;font-size:14px""><strong>Email:</strong> "
                + order?.Customer?.Email
                + @"</p></li>
                       </ul></td>
                     </tr>
                     <tr>
                      <td align=""left"" style=""padding:0;Margin:0;padding-bottom:5px;padding-top:10px""><p style=""Margin:0;-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-family:Manrope, sans-serif;line-height:23px;color:#44465F;font-size:15px""><strong>ITEMS ORDERED</strong></p></td>
                     </tr>
                   </table></td>
                 </tr>
               </table></td>
             </tr>
             <tr>
              <td class=""esdev-adapt-off"" align=""left"" style=""padding:0;Margin:0;padding-top:20px;padding-left:20px;padding-right:20px"">
               <table cellpadding=""0"" cellspacing=""0"" width=""100%"" style=""mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px"">
                 <tr>
                  <td align=""center"" valign=""top"" style=""padding:0;Margin:0;width:460px"">
                   <table cellpadding=""0"" cellspacing=""0"" width=""100%"" bgcolor=""#ffffff"" style=""mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:separate;border-spacing:0px;background-color:#ffffff;border-radius:10px"">
                     <tr>
                      <td align=""center"" style=""padding:0;Margin:0"">
                       <table border=""1"" bordercolor=""#cccccc"" align=""center"" cellspacing=""10"" cellpadding=""10"" style=""mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;height:100px;width:500px"" class=""es-table"">
                         <tr style=""background-color:#E0E1FD;height:50px"">
                          <td style=""padding:0;Margin:0;font-family:manrope, arial, sans-serif;text-align:center;font-size:14px"">NAME</td>
                          <td style=""padding:0;Margin:0;font-family:manrope, arial, sans-serif;text-align:center;font-size:14px"">PRICE</td>
                         </tr>"
                + string.Join("", orderTable)
                + @"</table></td>
                     </tr>
                   </table></td>
                 </tr>
               </table></td>
             </tr>
             <tr>
              <td align=""left"" style=""padding:0;Margin:0;padding-left:20px;padding-right:20px"">
               <table cellpadding=""0"" cellspacing=""0"" width=""100%"" style=""mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px"">
                 <tr>
                  <td align=""center"" valign=""top"" style=""padding:0;Margin:0;width:460px"">
                   <table cellpadding=""0"" cellspacing=""0"" width=""100%"" style=""mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;border-bottom:1px solid #2f2c2c"">
                     <tr>
                      <td align=""left"" style=""padding:0;Margin:0""><p style=""Margin:0;-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-family:Manrope, sans-serif;line-height:21px;color:#44465F;font-size:14px""><br></p></td>
                     </tr>
                   </table></td>
                 </tr>
               </table></td>
             </tr>
             <tr>
              <td align=""left"" style=""padding:0;Margin:0;padding-top:10px;padding-left:20px;padding-right:20px""><!--[if mso]><table style=""width:460px"" cellpadding=""0"" cellspacing=""0""><tr><td style=""width:380px"" valign=""top""><![endif]-->
               <table cellpadding=""0"" cellspacing=""0"" class=""es-left"" align=""left"" style=""mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;float:left"">
                 <tr>
                  <td class=""es-m-p0r es-m-p20b"" valign=""top"" align=""center"" style=""padding:0;Margin:0;width:380px"">
                   <table cellpadding=""0"" cellspacing=""0"" width=""100%"" style=""mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px"">
                     <tr>
                      <td align=""right"" style=""padding:0;Margin:0""><p style=""Margin:0;-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-family:Manrope, sans-serif;line-height:27px;color:#44465F;font-size:18px""><strong>Subtotal:</strong></p><p style=""Margin:0;-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-family:Manrope, sans-serif;line-height:27px;color:#44465F;font-size:18px""><strong>Discount:</strong></p></td>
                     </tr>
                   </table></td>
                 </tr>
               </table><!--[if mso]></td><td style=""width:80px"" valign=""top""><![endif]-->
               <table class=""es-right"" cellpadding=""0"" cellspacing=""0"" align=""right"" style=""mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;float:right"">
                 <tr>
                  <td align=""left"" style=""padding:0;Margin:0;width:80px"">
                   <table cellpadding=""0"" cellspacing=""0"" width=""100%"" style=""mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px"">
                     <tr>
                      <td align=""right"" style=""padding:0;Margin:0""><p style=""Margin:0;-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-family:Manrope, sans-serif;line-height:27px;color:#44465F;font-size:18px"">$"
                + order?.TotalPrice.ToString("N0")
                + @"</p><p style=""Margin:0;-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-family:Manrope, sans-serif;line-height:27px;color:#44465F;font-size:18px"">"
                + (order.TotalDiscountPercent * 100).ToString("N0")
                + @"%</p></td>
                     </tr>
                   </table></td>
                 </tr>
               </table><!--[if mso]></td></tr></table><![endif]--></td>
             </tr>
             <tr>
              <td align=""left"" style=""padding:0;Margin:0;padding-top:20px;padding-left:20px;padding-right:20px"">
               <table cellpadding=""0"" cellspacing=""0"" width=""100%"" style=""mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px"">
                 <tr>
                  <td align=""center"" valign=""top"" style=""padding:0;Margin:0;width:460px"">
                   <table cellpadding=""0"" cellspacing=""0"" width=""100%"" style=""mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;border-top:1px solid #090808"">
                     <tr>
                      <td align=""left"" style=""padding:0;Margin:0""><p style=""Margin:0;-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-family:Manrope, sans-serif;line-height:21px;color:#44465F;font-size:14px""><br></p></td>
                     </tr>
                   </table></td>
                 </tr>
               </table></td>
             </tr>
             <tr>
              <td align=""left"" style=""padding:0;Margin:0;padding-left:20px;padding-right:20px""><!--[if mso]><table style=""width:460px"" cellpadding=""0"" cellspacing=""0""><tr><td style=""width:228px"" valign=""top""><![endif]-->
               <table cellpadding=""0"" cellspacing=""0"" class=""es-left"" align=""left"" style=""mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;float:left"">
                 <tr>
                  <td class=""es-m-p20b"" align=""left"" style=""padding:0;Margin:0;width:228px"">
                   <table cellpadding=""0"" cellspacing=""0"" width=""100%"" style=""mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px"">
                     <tr>
                      <td align=""left"" style=""padding:0;Margin:0""><p style=""Margin:0;-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-family:Manrope, sans-serif;line-height:36px;color:#44465F;font-size:24px""><strong>Total</strong></p></td>
                     </tr>
                   </table></td>
                 </tr>
               </table><!--[if mso]></td><td style=""width:232px"" valign=""top""><![endif]-->
               <table cellpadding=""0"" cellspacing=""0"" class=""es-right"" align=""right"" style=""mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;float:right"">
                 <tr>
                  <td align=""left"" style=""padding:0;Margin:0;width:232px"">
                   <table cellpadding=""0"" cellspacing=""0"" width=""100%"" style=""mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px"">
                     <tr>
                      <td align=""right"" style=""padding:0;Margin:0""><p style=""Margin:0;-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-family:Manrope, sans-serif;line-height:36px;color:#44465F;font-size:24px""><strong>$"
                + (order.TotalPrice * (1 - order.TotalDiscountPercent)).ToString("N0")
                + @"</strong></p></td>
                     </tr>
                   </table></td>
                 </tr>
               </table><!--[if mso]></td></tr></table><![endif]--></td>
             </tr>
             <tr>
              <td align=""left"" style=""padding:0;Margin:0;padding-left:20px;padding-right:20px;padding-bottom:40px"">
               <table cellpadding=""0"" cellspacing=""0"" width=""100%"" style=""mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px"">
                 <tr>
                  <td align=""center"" valign=""top"" style=""padding:0;Margin:0;width:460px"">
                   <table cellpadding=""0"" cellspacing=""0"" width=""100%"" style=""mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px"">
                     <tr>
                      <td align=""right"" style=""padding:0;Margin:0;padding-top:10px""><!--[if mso]><a href=""https://datj.id.vn/account/order-history"" target=""_blank"" hidden>
	<v:roundrect xmlns:v=""urn:schemas-microsoft-com:vml"" xmlns:w=""urn:schemas-microsoft-com:office:word"" esdevVmlButton href=""https://datj.id.vn/account/order-history"" 
                style=""height:39px; v-text-anchor:middle; width:168px"" arcsize=""38%"" stroke=""f""  fillcolor=""#a797f2"">
		<w:anchorlock></w:anchorlock>
		<center style='color:#ffffff; font-family:Manrope, sans-serif; font-size:14px; font-weight:700; line-height:14px;  mso-text-raise:1px'>View your order</center>
	</v:roundrect></a>
<![endif]--><!--[if !mso]><!-- --><span class=""msohide es-button-border"" style=""border-style:solid;border-color:#2CB543;background:#A797F2;border-width:0px;display:inline-block;border-radius:15px;width:auto;mso-hide:all""><a href=""https://datj.id.vn"" class=""es-button es-button-1719483107009"" target=""_blank"" style=""mso-style-priority:100 !important;text-decoration:none;-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;color:#FFFFFF;font-size:16px;padding:10px 15px;display:inline-block;background:#A797F2;border-radius:15px;font-family:Manrope, sans-serif;font-weight:bold;font-style:normal;line-height:19px;width:auto;text-align:center;mso-padding-alt:0;mso-border-alt:10px solid #A797F2"">View your order</a></span><!--<![endif]--></td>
                     </tr>
                   </table></td>
                 </tr>
               </table></td>
             </tr>
           </table></td>
         </tr>
       </table>
       <table cellpadding=""0"" cellspacing=""0"" class=""es-footer"" align=""center"" style=""mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;table-layout:fixed !important;width:100%;background-color:#A797F2;background-repeat:repeat;background-position:center top"">
         <tr>
          <td align=""center"" style=""padding:0;Margin:0"">
           <table bgcolor=""#ffffff"" class=""es-footer-body"" align=""center"" cellpadding=""0"" cellspacing=""0"" style=""mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;background-color:#A797F2;width:500px"">
             <tr>
              <td align=""left"" style=""Margin:0;padding-left:20px;padding-right:20px;padding-top:30px;padding-bottom:30px"">
               <table cellpadding=""0"" cellspacing=""0"" width=""100%"" style=""mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px"">
                 <tr>
                  <td align=""left"" style=""padding:0;Margin:0;width:460px"">
                   <table cellpadding=""0"" cellspacing=""0"" width=""100%"" style=""mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px"">
                     <tr>
                      <td align=""center"" class=""es-m-txt-c"" style=""padding:0;Margin:0;padding-bottom:10px;font-size:0px""><a target=""_blank"" href=""https://viewstripo.email"" style=""-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;text-decoration:underline;color:#FFFFFF;font-size:14px""><img src=""https://eikqahl.stripocdn.email/content/guids/CABINET_01d9349d38b9ff1d43039f1e58de32c41a4c2da750284f1fee84f8388865c801/images/blackremovebgpreview.png"" alt=""Logo"" style=""display:block;border:0;outline:none;text-decoration:none;-ms-interpolation-mode:bicubic"" title=""Logo"" height=""40"" width=""173""></a></td>
                     </tr>
                     <tr>
                      <td align=""center"" style=""padding:0;Margin:0""><p style=""Margin:0;-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-family:Manrope, sans-serif;line-height:21px;color:#FFFFFF;font-size:14px"">datj.company@gmail.com</p><p style=""Margin:0;-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-family:Manrope, sans-serif;line-height:21px;color:#FFFFFF;font-size:14px"">DATJ DIAMOND<br></p><p style=""Margin:0;-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-family:Manrope, sans-serif;line-height:21px;color:#FFFFFF;font-size:14px"">FPT University, Thu Duc, Ho Chi Minh, Vietnam<br></p><p style=""Margin:0;-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-family:Manrope, sans-serif;line-height:21px;color:#FFFFFF;font-size:14px"">Copyright ©2024 DatJ Company<a target=""_blank"" href="""" style=""-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;text-decoration:underline;color:#FFFFFF;font-size:14px""></a></p></td>
                     </tr>
                   </table></td>
                 </tr>
               </table></td>
             </tr>
           </table></td>
         </tr>
       </table></td>
     </tr>
   </table>
  </div>
 </body>
</html>";
            return htmlString;
        }

        public bool SendVerifyEmail(string toEmail, string name, string token, string subject)
        {
            try
            {
                string url = $"{_config["ClientUrl"]}/authentication/verify-gmail?token={token}";
                var message = new MailMessage()
                {
                    From = new MailAddress(_config["Mail:Address"], _config["Mail:DisplayName"]),
                    Subject = subject,
                    IsBodyHtml = true,
                    Body = GetVerifyContent(name, url),
                };
                message.To.Add(toEmail);
                var smtp = new SmtpClient(_config["Mail:Host"])
                {
                    Port =
                        _config["Mail:Port"] != null ? Convert.ToInt32(_config["Mail:Port"]) : 587,
                    Credentials = new NetworkCredential(
                        _config["Mail:Address"],
                        _config["Mail:AppPassword"]
                    ),
                    EnableSsl = bool.Parse(_config["Mail:EnableSsl"]),
                };
                smtp.Send(message);
                return true;
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
                return false;
            }
        }

        public bool SendResetEmail(string toEmail, string name, string token, string subject)
        {
            try
            {
                string url = $"{_config["ClientUrl"]}/authentication/reset-password?token={token}";
                var message = new MailMessage()
                {
                    From = new MailAddress(_config["Mail:Address"], _config["Mail:DisplayName"]),
                    Subject = subject,
                    IsBodyHtml = true,
                    Body = GetResetContent(name, url),
                };
                message.To.Add(toEmail);
                var smtp = new SmtpClient(_config["Mail:Host"])
                {
                    Port =
                        _config["Mail:Port"] != null ? Convert.ToInt32(_config["Mail:Port"]) : 587,
                    Credentials = new NetworkCredential(
                        _config["Mail:Address"],
                        _config["Mail:AppPassword"]
                    ),
                    EnableSsl = bool.Parse(_config["Mail:EnableSsl"]),
                };
                smtp.Send(message);
                return true;
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
                return false;
            }
        }

        public bool SendOrderEmail(Order order, string emailType)
        {
            string subject = "";
            switch (emailType)
            {
                case "Processing":
                    subject = "Your order is being processed";
                    break;
                case "Confirmed":
                    subject = "Your order has been confirmed";
                    break;
                case "Delivering":
                    subject = "Your order is on its way";
                    break;
                case "Completed":
                    subject = "Your order has been arrived";
                    break;
                case "Failed":
                    subject = "Your order has been cancelled";
                    break;
            }
            try
            {
                var message = new MailMessage()
                {
                    From = new MailAddress(_config["Mail:Address"], _config["Mail:DisplayName"]),
                    Subject = $"[DATJ Diamond] – {subject}",
                    IsBodyHtml = true,
                    Body = GetOrderContent(order, subject),
                };
                message.To.Add(order.Customer.Email);
                var smtp = new SmtpClient(_config["Mail:Host"])
                {
                    Port =
                        _config["Mail:Port"] != null ? Convert.ToInt32(_config["Mail:Port"]) : 587,
                    Credentials = new NetworkCredential(
                        _config["Mail:Address"],
                        _config["Mail:AppPassword"]
                    ),
                    EnableSsl = bool.Parse(_config["Mail:EnableSsl"]),
                };
                smtp.Send(message);
                return true;
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
                return false;
            }
        }
    }
}
