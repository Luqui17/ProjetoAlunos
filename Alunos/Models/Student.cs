using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Alunos.Models
{
    [BsonNoId]
    [BsonIgnoreExtraElements]
    public class Student
    {
        [BsonRepresentation(BsonType.ObjectId)]
        public string Id { get; set; }
        public string Name { get; set; }
        public string CPF { get; set; }
        public BsonDateTime DtCreated { get; }
        public string Age { get; set; }
        public bool Active { get; set; }
        public bool Deleted { get; set; }
        //[BsonRepresentation(BsonType.String)]
        public List<string> Id_Course { get; set; }
        public Student(string name, string cpf, string Age)
        {
            this.Name = name;
            this.CPF = cpf;
            this.Age = Age;
        }
    }
}