using Alunos.Connection;
using Alunos.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Alunos.Service
{
    public class CadastrarCurso
    {
        public CadastrarCurso(string name, string teacherName)
        {
            var conexaoBiblioteca = new Conexao();
            Course course = new Course(name,teacherName);

            conexaoBiblioteca.Courses.InsertOne(course);
        }
    }
}