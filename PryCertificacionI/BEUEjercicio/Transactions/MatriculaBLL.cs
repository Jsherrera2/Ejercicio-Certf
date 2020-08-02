using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BEUEjercicio.Transactions
{
    public class MatriculaBLL
    {
        public static Matricula Get(int? id)
        {
            Entities db = new Entities();
            return db.Matriculas.Find(id);
        }

        public static void Create(Matricula m)
        {
            using (Entities db = new Entities())
            {
                using (var transaction = db.Database.BeginTransaction())
                {
                    try
                    {
                        Materia mt = db.Materias.Find(m.idmateria);
                        setUp(m, mt);

                        db.Matriculas.Add(m);
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

        public static void Update(Matricula matricula)
        {
            using (Entities db = new Entities())
            {
                using (var transaction = db.Database.BeginTransaction())
                {
                    try
                    {
                        Materia mt = db.Materias.Find(matricula.idmateria);
                        setUp(matricula, mt);
                        db.Matriculas.Attach(matricula);
                        db.Entry(matricula).State = System.Data.Entity.EntityState.Modified;
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
                        Matricula matricula = db.Matriculas.Find(id);
                        db.Entry(matricula).State = System.Data.Entity.EntityState.Deleted;
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

        public static List<Matricula> List()
        {
            Entities db = new Entities();
            return db.Matriculas.ToList();
        }

        private static void setUp(Matricula m, Materia mt)
        {
            m.fecha = DateTime.Now;
            m.estado = "1"; //Creada
            if (m.tipo.Equals("P"))
            {
                m.costo = 0;
            }
            else
            {
                if (m.tipo.Equals("S"))
                {
                    m.costo = (decimal)(12.25 * mt.creditos);
                }
                else
                {
                    m.costo = (decimal)(24.50 * mt.creditos);
                }
            }
        }


        public static List<Matricula> List(int id)
        {
            Entities db = new Entities();
            return db.Matriculas.Where(x => x.Alumno.idalumno == id).ToList();
        }

    }
}
