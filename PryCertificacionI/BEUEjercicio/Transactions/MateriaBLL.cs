using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BEUEjercicio.Transactions
{
    public class MateriaBLL
    {
        public static Materia Get(int? id)
        {
            Entities db = new Entities();
            return db.Materias.Find(id);
        }

        public static void Create(Materia m)
        {
            using (Entities db = new Entities())
            {
                using (var transaction = db.Database.BeginTransaction())
                {
                    try
                    {
                        db.Materias.Add(m);
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

        public static void Update(Materia materia)
        {
            using (Entities db = new Entities())
            {
                using (var transaction = db.Database.BeginTransaction())
                {
                    try
                    {
                        db.Materias.Attach(materia);
                        db.Entry(materia).State = System.Data.Entity.EntityState.Modified;
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
                        Materia materia = db.Materias.Find(id);
                        db.Entry(materia).State = System.Data.Entity.EntityState.Deleted;
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

        public static List<Materia> List()
        {
            Entities db = new Entities();
            return db.Materias.ToList();
        }

        public static List<Materia> ListToNames()
        {
            Entities db = new Entities();
            List<Materia> resultado = new List<Materia>();
            db.Materias.ToList().ForEach(x => resultado.Add(new Materia { nombre = x.nrc + " - " + x.nombre, idmateria = x.idmateria }));
            return resultado;
        }
    }
}
