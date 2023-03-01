using Alunos.Connection;
using Alunos.Models;
using MongoDB.Driver;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Alunos.Service
{
    public class Autenticacao
    {
        public Autenticacao()
        {

        }
        public bool verificarLogin(string email, string senha)
        {
            Conexao con = new Conexao();
            bool exists = con.Users.Find(x => x.Mail == email).Any() & con.Users.Find(x => x.Password == senha).Any();
            if (exists == true)
            {
                return true;
            }
            return false;
        }
    }
}