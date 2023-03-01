using Alunos.Connection;
using Alunos.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Alunos.Service
{
    public class CadastrarAluno
    {
        public CadastrarAluno(string nome, string cpf,string Age) 
        {
            var conexao = new Conexao();
            Student student = new Student(nome, cpf,Age);
            conexao.Student.InsertOne(student);
        }
    }
}