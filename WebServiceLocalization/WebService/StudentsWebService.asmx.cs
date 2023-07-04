using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services;
using Newtonsoft.Json.Linq;

namespace WebServiceLocalization.WebService
{
    /// <summary>
    /// Summary description for StudentsWebService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class StudentsWebService : System.Web.Services.WebService
    {

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }

        [WebMethod]
        public string GetAllStudents()
        {
            string studentJson = File.ReadAllText(HttpContext.Current.Server.MapPath("~/App_Data/students.json"));
            return studentJson;
        }

        [WebMethod]
        public void SaveStudentInfo(string studentJson)
        {
            // Read and update students.json
            string filePath = HttpContext.Current.Server.MapPath("~/App_Data/students.json");
            string existingJson = File.ReadAllText(filePath);

            // Parse JSON data
            var jsonObject = JObject.Parse(existingJson);

            // Add new student information to students array
            var studentsArray = (JArray)jsonObject["students"];
            studentsArray.Add(JObject.Parse(studentJson));

            // Write updated JSON data to file
            File.WriteAllText(filePath, jsonObject.ToString());
        }
    }
}