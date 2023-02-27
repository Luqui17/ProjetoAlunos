using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Alunos.Models
{
    public class AlunosTeste
    {
        [BsonRepresentation(BsonType.ObjectId)]
        public int Id { get; set; }
        public string Nome { get; set; }
        public string CPF { get; set; }
        public int Idade { get; set; }

        public AlunosTeste(string nome, string cpf, int idade)
        {

        }
    }
}