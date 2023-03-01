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
        public const string NOME_DA_BASE = "Escola";
        public const string NOME_DA_COLECAO = "Alunos";
        public const string NOME_DA_COLECAO2 = "Usuario";
        public const string NOME_DA_COLECAO3 = "Cursos";

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

        public IMongoCollection<Student> Student
        {
            get { return _BaseDeDados.GetCollection<Student>(NOME_DA_COLECAO); }
        }
        public IMongoCollection<User> Users
        {
            get { return _BaseDeDados.GetCollection<User>(NOME_DA_COLECAO2); }
        }
        public IMongoCollection<Course> Courses
        {
            get { return _BaseDeDados.GetCollection<Course>(NOME_DA_COLECAO3); }
        }
    }
}