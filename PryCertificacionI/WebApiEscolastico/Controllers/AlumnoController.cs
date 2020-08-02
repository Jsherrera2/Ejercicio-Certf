using BEUEjercicio;
using BEUEjercicio.Transactions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Http;
using System.Web.Http.Cors;
using System.Web.Http.Description;
using System.Web.Http.Results;
using System.Web.Mvc;


namespace WebApiEscolastico.Controllers
{
    [EnableCors(origins: "http://localhost:4200", headers:"*", methods:"*")]
    public class AlumnoController : ApiController
    {

        public IHttpActionResult Post(Alumno alumno)
        {
            try
            {
                AlumnoBLL.Create(alumno);
                return Content(HttpStatusCode.Created, "Alumno creado correctamente");
                //return Created("Alumno creado correcto", alumno);
            }
            catch (Exception ex)
            {

                //return InternalServerError(ex);
                return BadRequest(ex.Message);
            }
        }


        [ResponseType(typeof(Alumno))]
        public IHttpActionResult Get()
        {
            try
            {
                List<Alumno> todos = AlumnoBLL.List();
                return Content(HttpStatusCode.OK, todos);
            }
            catch (Exception ex)
            {

                return Content(HttpStatusCode.BadRequest, ex);
            }
            //List<Alumno> todos = AlumnoBLL.List();
            ////return Content(HttpStatusCode.OK, todos);
            //return Json(todos);
        }


        public IHttpActionResult Get(String criteria)
        {
            try
            {
                List<Alumno> todos = AlumnoBLL.List(criteria);
                return Content(HttpStatusCode.OK, todos);
            }
            catch (Exception ex)
            {
                return Content(HttpStatusCode.BadRequest, ex);
            }
        }
        public IHttpActionResult Put(Alumno alumno)
        {
            try
            {
                AlumnoBLL.Update(alumno);
                return Content(HttpStatusCode.OK, "Alumno actualizado correctamente");

            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        public IHttpActionResult Get(int id)
        {
            try
            {
                Alumno result = AlumnoBLL.Get(id);
                if (result == null)
                {
                    return NotFound();
                }
                return Content(HttpStatusCode.OK, result);
            }
            catch (Exception ex)
            {
                return Content(HttpStatusCode.BadRequest, ex);
            }
        }


        [ResponseType(typeof(Alumno))]
        public IHttpActionResult Delete(int id)
        {
            try
            {
                AlumnoBLL.Delete(id);
                return Ok("Alumno elimano correctamente");

                //return Created("Alumno Eliminado correctamente", id);
            }
            catch (Exception ex)
            {
                //return InternalServerError(ex);
                ///return BadRequest(ex.Message);
                // return Content(HttpStatusCode.Created, "Alumno creado correctamente");
                return Content(HttpStatusCode.BadRequest, ex);

            }
        }

       


    }
}