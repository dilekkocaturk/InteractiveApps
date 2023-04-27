using System;
using System.Collections.Generic;
using System.Linq;
using System.Media;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace HangmanGame
{
    public partial class HangmanGame : System.Web.UI.Page
    {     
        private string selectedWord;
        private string selectedHint;
        private int wrongGuesses;
        private int count = 60;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadRandomWord();
                DrawHangman(wrongGuesses);

                tmrCountDown.Enabled = true;
                count = 60;
                lblCountDown.Text = count.ToString();
            }
            else
            {
                // Restore variables from ViewState
                selectedWord = ViewState["SelectedWord"].ToString();
                selectedHint = ViewState["SelectedHint"].ToString();
                wrongGuesses = (int)ViewState["WrongGuesses"];    
            }
        }   
        private void LoadRandomWord()
        {
            XmlDocument xml = new XmlDocument();
            xml.Load(Server.MapPath("~/words.xml"));
            XmlNodeList nodeList = xml.SelectNodes("//Words/Word");
            Random rnd = new Random();
            int randomIndex = rnd.Next(0, nodeList.Count);
            selectedWord = nodeList[randomIndex]["Name"].InnerText.ToUpper();
            selectedHint = nodeList[randomIndex]["Hint"].InnerText;
            lblHint.Text = selectedHint;
            lblWord.Text = string.Join(" ", selectedWord.ToCharArray().Select(c => c == ' ' ? "\u00A0" : "_"));

            lblHint.Visible = false;

            // Save changes to ViewState
            ViewState["SelectedWord"] = selectedWord;
            ViewState["SelectedHint"] = selectedHint;
            ViewState["WrongGuesses"] = wrongGuesses;
        }    
        protected void btnPlayAgain_Click(object sender, EventArgs e)
        {
            Session.Clear(); // Clear Session to select new word
            Response.Redirect(Request.RawUrl); // Refresh the page
        }
        protected void btnHint_Click(object sender, EventArgs e)
        {
            lblHint.Visible = true;
            btnHint.Visible = false;
        }
        private void DrawHangman(int wrongGuesses)
        {
            switch (wrongGuesses)
            {
                case 0:
                    imgHangman.ImageUrl = "~/Resources/default.png";

                    break;
                case 1:
                    imgHangman.ImageUrl = "~/Resources/head.png";
                    break;
                case 2:
                    imgHangman.ImageUrl = "~/Resources/body.png";
                    break;
                case 3:
                    imgHangman.ImageUrl = "~/Resources/leftArm.png";
                    break;
                case 4:
                    imgHangman.ImageUrl = "~/Resources/rightArm.png";
                    break;
                case 5:
                    imgHangman.ImageUrl = "~/Resources/leftLeg.png";
                    break;
                case 6:
                    imgHangman.ImageUrl = "~/Resources/rightLeg.png";
                    break;
                default:
                    break;
            }
        }
        protected void btnGuess_Click(object sender, EventArgs e)
        {
            string letter = ((Button)sender).Text.ToUpper();
            if (selectedWord.Contains(letter))
            {
                // Convert word to char array by removing "_" symbols in lblWord
                char[] word = lblWord.Text.Replace(" ", "").ToCharArray(); 

                for (int i = 0; i < selectedWord.Length; i++)
                {
                    if (selectedWord[i] == letter[0])
                    {
                        // Add the correctly guessed letter to the corresponding position of the word
                        word[i] = letter[0]; 

                        lblResult.Text = "Right Guess";
                        ((Button)sender).BackColor = System.Drawing.Color.LightGreen;
                    }
                }
                // Write the word to the screen by re-inserting the "_" symbols
                lblWord.Text = string.Join(" ", word.Select(c => c == ' ' ? "\u00A0" : c.ToString()));

                // If the word no longer contains any "_" symbols, the game is won
                if (!lblWord.Text.Contains("_")) 
                {
                    lblResult.Text = "Congratulations, you won!";
                    btnHint.Enabled = false;
                    PlayWinSound();
                    imgGifRight.ImageUrl = "~/Resources/win.gif";
                    imgGifRight.Visible = true;
                    imgGifLeft.ImageUrl = "~/Resources/win.gif";
                    imgGifLeft.Visible = true;
                    tmrCountDown.Enabled = false;
                    DisableButtons();    
                }
            }
            else
            {
                lblResult.Text = "Wrong Guess";
                ((Button)sender).BackColor = System.Drawing.Color.IndianRed;
                wrongGuesses++;
                ViewState["WrongGuesses"] = wrongGuesses;
                DrawHangman(wrongGuesses);
                if (wrongGuesses >= 6)
                {
                    lblResult.Text = $"Sorry, you lost! The word was {selectedWord}.";
                    btnHint.Enabled = false;
                    PlayLoseSound();
                    imgGifRight.ImageUrl = "~/Resources/lose.gif";
                    imgGifRight.Visible = true;
                    imgGifLeft.ImageUrl = "~/Resources/lose.gif";
                    imgGifLeft.Visible = true;
                    tmrCountDown.Enabled = false;
                    DisableButtons();

                    lblWord.Text = selectedWord;      
                }
            }
            ((Button)sender).Enabled = false;
        }
        protected void tmrCountDown_Tick(object sender, EventArgs e)
        {
            int countdown = int.Parse(lblCountDown.Text);

            if (countdown > 0)
            {
                countdown--;
                lblCountDown.Text = countdown.ToString();
            }
            else
            {
                UpdatePanel2.Update();
                lblResult.Text = $"Time is up! The word was {selectedWord}.";
                btnHint.Enabled = false;
                PlayLoseSound();
                imgGifRight.ImageUrl = "~/Resources/lose.gif";
                imgGifRight.Visible = true;
                imgGifLeft.ImageUrl = "~/Resources/lose.gif";
                imgGifLeft.Visible = true;            
                tmrCountDown.Enabled = false;
                DisableButtons();

                lblWord.Text = selectedWord;
                DrawHangman(6);
                
            }
        }
        protected void PlayWinSound()
        {
            SoundPlayer sp = new SoundPlayer();
            sp.SoundLocation = Server.MapPath("~/Resources/win.wav");
            sp.Load();
            sp.Play();
        }
        protected void PlayLoseSound()
        {
            SoundPlayer sp = new SoundPlayer();
            sp.SoundLocation = Server.MapPath("~/Resources/lose.wav");
            sp.Load();
            sp.Play();
        }
        private void DisableButtons()
        {
            foreach (Control control in pnlButtons.Controls)
            {
                if (control is Button button)
                    button.Enabled = false;
            }
        }
        private void EnableButtons()
        {
            foreach (Control control in pnlButtons.Controls)
            {
                if (control is Button button)
                    button.Enabled = true;
            }
        }
    }
}