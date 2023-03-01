using Alunos.Connection;
using Alunos.Models;
using MongoDB.Driver;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Alunos.Service
{
    public class CadastrarUsuario
    {
        public CadastrarUsuario(string nome, string email, string senha)
        {
            var conexaoBiblioteca = new Conexao();
            User usuario = new User(nome, email, senha);

            conexaoBiblioteca.Users.InsertOne(usuario);
        }
        
    }
}

