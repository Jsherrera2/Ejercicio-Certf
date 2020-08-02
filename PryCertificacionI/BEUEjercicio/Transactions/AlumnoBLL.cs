using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BEUEjercicio.Transactions
{
    public class AlumnoBLL
    {
        public static Alumno Get(int? id)
        {
            Entities db = new Entities();
            return db.Alumnoes.Find(id);
        }

        public static void Create(Alumno a)
        {
            using (Entities db = new Entities())
            {
                using (var transaction = db.Database.BeginTransaction())
                {
                    try
                    {
                        db.Alumnoes.Add(a);
                        db.SaveChanges();
                        transaction.Commit();
                    }
                    catch (Exception ex)
                    {
                        transaction.Rollback();
                        throw ex;
                    }
                }
            }
        }

        public static void Update(Alumno alumno)
        {
            using (Entities db = new Entities())
            {
                using (var transaction = db.Database.BeginTransaction())
                {
                    try
                    {
                        db.Alumnoes.Attach(alumno);
                        db.Entry(alumno).State = System.Data.Entity.EntityState.Modified;
                        db.SaveChanges();
                        transaction.Commit();
                    }
                    catch (Exception ex)
                    {
                        transaction.Rollback();
                        throw ex;
                    }
                }
            }
        }

        public static void Delete(int? id)
        {
            using (Entities db = new Entities())
            {
                using (var transaction = db.Database.BeginTransaction())
                {
                    try
                    {
                        Alumno alumno = db.Alumnoes.Find(id);
                        db.Entry(alumno).State = System.Data.Entity.EntityState.Deleted;
                        db.SaveChanges();
                        transaction.Commit();
                    }
                    catch (Exception ex)
                    {
                        transaction.Rollback();
                        throw ex;
                    }
                }
            }
        }

        public static List<Alumno> List()
        {
            Entities db = new Entities();
            return db.Alumnoes.ToList();
        }

        public static List<Alumno> ListToNames()
        {
            Entities db = new Entities();
            List<Alumno> resultado = new List<Alumno>();
            db.Alumnoes.ToList().ForEach(x => resultado.Add(new Alumno { nombres = x.nombres + " " + x.apellidos, idalumno = x.idalumno }));
            return resultado;
        }






        private static Alumno GetAlumno(string cedula)
        {
            Entities db = new Entities();
            return db.Alumnoes.FirstOrDefault(x => x.cedula == cedula);
        }

        private static List<Alumno> GetAlumnos(string criterio)
        {
            //Ejemplo: criterio = 'quin'
            //Posibles resultados => Quintana, Quintero, Pulloquinga, Quingaluisa...
            Entities db = new Entities();
            return db.Alumnoes.Where(x => x.apellidos.ToLower().Contains(criterio)).ToList();
        }


        public static List<Alumno> List(string criterio)
        {
            Entities db = new Entities();
            return db.Alumnoes.Where(x => x.cedula.Contains(criterio)).ToList();
        }


    }
}
