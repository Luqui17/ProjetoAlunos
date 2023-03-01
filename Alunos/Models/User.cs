using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Alunos.Models
{
    public class User
    {
        [BsonRepresentation(BsonType.ObjectId)]
        public string Id { get; set; }
        public string Name { get; set; }
        public string Mail { get; set; }
        public string Password { get; set; }
        public DateTime DtCreated { get; set; }
        public User(string name, string mail, string password)
        {
            this.Name = name;
            this.Mail = mail;
            this.Password = password;
        }
    }
}