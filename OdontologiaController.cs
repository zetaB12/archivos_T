using System;
using System.Web.Mvc;
using System.Collections.Generic;
using CO_Comun;
using EN_MAESTROS;
using EN_SEGURIDAD;
using LN_MAESTROS;

namespace ESCASOFT_WEB.Controllers.Maestros
{
    [RoutePrefix("Odontologia")]
    public class OdontologiaController : Controller
    {
        [Route("New")]
        public ActionResult New()
        {
            ViewBag.OdontologiaID = 0;
            return View("~/Views/Maestros/Odontologia/OdontologiaNew.cshtml");
        }

        [HttpPost]
        [Route("Create")]
        public ActionResult Create(EN_Odontologia _objOdontologia)
        {
            try
            {
                _objOdontologia.UserId = GetSessionUser();
                _objOdontologia.TypeRegister = 1;
                EN_Result lista = LN_Odontologia.Instance.Odontologia_CUD(_objOdontologia);
                return Json(lista);
            }
            catch (Exception ex)
            {
                Response.StatusCode = 500;
                Response.StatusDescription = ex.Message;

                return Json(new CO_Comun.EN_Result(ex));
            }
        }

        private string GetSessionUser()
        {
            EN_Usuario _usuario = Session["usuario"] as EN_Usuario;
            return _usuario.USUARIO;
        }
    }
}