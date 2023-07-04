using System;
using System.Globalization;
using System.Threading;
using Newtonsoft.Json.Linq;
using WebServiceLocalization.WebService;

namespace WebServiceLocalization
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Check language parameter
                string langParam = Request.QueryString["lang"];

                if (string.IsNullOrEmpty(langParam) || (langParam != "tr" && langParam != "en"))
                {
                    // Use English by default if language parameter is not specified or invalid
                    Thread.CurrentThread.CurrentUICulture = new CultureInfo("en-US");
                    Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture("en-US");
                    SetLocalization();
                }
                else
                {
                    // If the language parameter is correct, adjust the language settings according to the specified language
                    if (langParam == "tr")
                    {
                        Thread.CurrentThread.CurrentUICulture = new CultureInfo("tr-TR");
                        Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture("tr-TR");
                    }
                    else if (langParam == "en")
                    {
                        Thread.CurrentThread.CurrentUICulture = new CultureInfo("en-US");
                        Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture("en-US");
                    }

                    SetLocalization();
                }

                BindGridView();
            }
        }

        protected void btnSaveStudent_Click(object sender, EventArgs e)
        {
            SaveStudentInfo();
            BindGridView();
            ClearInputFields(); // Clear input fields
        }

        private void ClearInputFields()
        {
            txtName.Text = string.Empty;
            txtSurname.Text = string.Empty;
            txtAge.Text = string.Empty;
            txtDepartment.Text = string.Empty;
        }

        private void SetLocalization()
        {
            if (Thread.CurrentThread.CurrentUICulture.Name == "tr-TR")
            {
                litWelcomeMessage.Text = Resources.Resource.welcomeMsg;
                litStudentInfo.Text = Resources.Resource.studentInfo;
                litAddNewStudent.Text = Resources.Resource.addNewStudent;
                litName.Text = Resources.Resource.name;
                litSurname.Text = Resources.Resource.surname;
                litAge.Text = Resources.Resource.age;
                litDepartment.Text = Resources.Resource.dept;
                btnSaveStudent.Text = Resources.Resource.save;

                // Update GridView column headers
                GridView1.Columns[0].HeaderText = Resources.Resource.name;
                GridView1.Columns[1].HeaderText = Resources.Resource.surname;
                GridView1.Columns[2].HeaderText = Resources.Resource.age;
                GridView1.Columns[3].HeaderText = Resources.Resource.dept;
            }
            else
            {
                litWelcomeMessage.Text = Resources.Resource.welcomeMsg;
                litStudentInfo.Text = Resources.Resource.studentInfo;
                litAddNewStudent.Text = Resources.Resource.addNewStudent;
                litName.Text = Resources.Resource.name;
                litSurname.Text = Resources.Resource.surname;
                litAge.Text = Resources.Resource.age;
                litDepartment.Text = Resources.Resource.dept;
                btnSaveStudent.Text = Resources.Resource.save;

                // Update GridView column headers
                GridView1.Columns[0].HeaderText = Resources.Resource.name;
                GridView1.Columns[1].HeaderText = Resources.Resource.surname;
                GridView1.Columns[2].HeaderText = Resources.Resource.age;
                GridView1.Columns[3].HeaderText = Resources.Resource.dept;
            }
        }

        private void SaveStudentInfo()
        {
            string name = txtName.Text;
            string surname = txtSurname.Text;
            string age = txtAge.Text;
            string department = txtDepartment.Text;

            // Convert student information to JSON format
            string json = $"{{\"name\":\"{name}\", \"surname\":\"{surname}\", \"age\":\"{age}\", \"department\":\"{department}\"}}";

            // Make a request to the web service
            StudentsWebService studentsWebService = new StudentsWebService();
            studentsWebService.SaveStudentInfo(json);
        }

        private void BindGridView()
        {
            // Get student information from web service
            StudentsWebService studentsWebService = new StudentsWebService();
            string studentJson = studentsWebService.GetAllStudents();

            // Parse JSON data
            var jsonObject = JObject.Parse(studentJson);

            // Bind students array to GridView
            GridView1.DataSource = jsonObject["students"];
            GridView1.DataBind();
        }
    }
}