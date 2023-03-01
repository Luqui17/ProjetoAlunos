using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;
using MongoDB.Driver;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Web;

namespace Alunos.Models
{
    [BsonIgnoreExtraElements]
    public class Course
    {
        [BsonRepresentation(BsonType.ObjectId)]
        [BsonId]
        public string Id { get; set; }
        public string Name { get; set; }
        public string TeacherName { get; set; }
        public List<Notes> Notes { get; set; }

        public Course(string name, string teacherName)
        {
            this.Name = name;
            this.TeacherName = teacherName;
        }
    }
}