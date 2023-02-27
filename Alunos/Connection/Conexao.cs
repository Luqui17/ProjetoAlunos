using MongoDB.Driver;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Alunos.Models;

namespace Alunos.Connection
{
    public class Conexao
    {
        public const string STRING_DE_CONEXAO = "mongodb://localhost:27017";
        public const string NOME_DA_BASE = "Classe";
        public const string NOME_DA_COLECAO = "Alunos";
        public const string NOME_DA_COLECAO2 = "Usuario";

        private static readonly IMongoClient _cliente;
        private static readonly IMongoDatabase _BaseDeDados;

        static Conexao()
        {
            _cliente = new MongoClient(STRING_DE_CONEXAO);
            _BaseDeDados = _cliente.GetDatabase(NOME_DA_BASE);

        }
        public IMongoClient Client
        {
            get { return _cliente; }
        }

        public IMongoCollection<AlunosTeste> Alunos
        {
            get { return _BaseDeDados.GetCollection<AlunosTeste>(NOME_DA_COLECAO); }
        }
        public IMongoCollection<Usuario> Usuarios
        {
            get { return _BaseDeDados.GetCollection<Usuario>(NOME_DA_COLECAO2); }
        }
       
    }
}