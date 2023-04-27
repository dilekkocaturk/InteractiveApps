using System;
using System.Text.RegularExpressions;

namespace CreditCardValidation
{
    public partial class CreditCardValidation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            lblResult.Text = "";
            lblResult.Font.Bold = true;
            lblCardNumber.Visible = false;
            lblNameOnCard.Visible = false;
            lblExp.Visible = false;
            imgIcon.Visible = false;
            lblResult.BackColor = System.Drawing.Color.White;

            // Retrieve the input values from the form
            string nameOnCard = txtNameOnCard.Text;
            string cardNumber = txtCardNumber.Text;
            string cvv = txtCVV.Text;
            int expMonth = int.Parse(ddlExpirationMonth.SelectedValue);
            int expYear = int.Parse(ddlExpirationYear.SelectedValue);

            // Validate the credit card information
            string cardType = IdentifyCardType(cardNumber);
            bool isValid = ValidateCreditCard(cardNumber);
            bool isCVVValid = ValidateCVV(cvv, cardType);
            bool isExpirationValid = ValidateExpiration(expMonth, expYear);

            // Display the validation result to the user
            if (isValid && isCVVValid && isExpirationValid && !String.IsNullOrEmpty(nameOnCard))
            {
                lblNameOnCard.Text = nameOnCard;
                lblNameOnCard.Visible = true;
                lblExp.Text = expMonth.ToString() + "/" + (expYear % 100).ToString();
                lblExp.Visible = true;

                if (cardType == "Visa")
                    imgIcon.ImageUrl = "https://cdn-icons-png.flaticon.com/512/349/349221.png";

                else if (cardType == "MasterCard")
                    imgIcon.ImageUrl = "https://icons-for-free.com/iconfiles/png/512/credit+card+mastercard+payment+shop+icon-1320167879935976478.png";

                else if (cardType == "Discover")
                    imgIcon.ImageUrl = "https://cdn-icons-png.flaticon.com/512/349/349230.png";

                else if (cardType == "American Express")
                    imgIcon.ImageUrl = "https://cdn-icons-png.flaticon.com/512/349/349228.png";

                imgIcon.Visible = true;
                lblResult.ForeColor = System.Drawing.Color.Green;
                lblResult.Text = "Your credit card information is valid.";
                imgCard.Visible = true;
                lblCardNumber.Text = cardNumber;
                lblCardNumber.Visible = true;
            }
            else
            {
                lblResult.ForeColor = System.Drawing.Color.Red;

                if (String.IsNullOrEmpty(nameOnCard))
                    lblResult.Text = "No name on card provided. ";

                if (!isValid)
                {
                    if (String.IsNullOrEmpty(txtCardNumber.Text))
                        lblResult.Text += "No card number provided. ";

                    else if (!IsCardNumberLengthValid(txtCardNumber.Text))
                        lblResult.Text += "Credit card number has an inappropriate number of digits. ";

                    else if (!((IdentifyCardType(txtCardNumber.Text) == "Visa" || IdentifyCardType(txtCardNumber.Text) == "MasterCard" ||
                                IdentifyCardType(txtCardNumber.Text) == "Discover" || IdentifyCardType(txtCardNumber.Text) == "American Express")))
                        lblResult.Text += "Credit card number is in invalid format. ";

                    else if (!ValidateLuhn(txtCardNumber.Text))
                        lblResult.Text += "Credit card number is invalid. ";

                    else
                        lblResult.Text += "Unknown card type. ";
                }

                if (!isExpirationValid)
                    lblResult.Text += "Expiration date is invalid. ";


                if (!isCVVValid)
                {
                    if (String.IsNullOrEmpty(txtCVV.Text))
                        lblResult.Text += "No CCV number provided. ";

                    else
                        lblResult.Text += "CCV number is invalid. ";
                }
            }
        }

        // To display the cardtype as an image of MasterCard, Visa etc.
        private string IdentifyCardType(string cardNumber)
        {
            if (Regex.IsMatch(cardNumber, @"^4"))
                return "Visa";

            else if (Regex.IsMatch(cardNumber, @"^5[1-5]"))
                return "MasterCard";
            
            else if (Regex.IsMatch(cardNumber, @"^6011"))
                return "Discover";
            
            else if (Regex.IsMatch(cardNumber, @"^3[47]"))
                return "American Express";
            
            else
                return "";          
        }
        private bool IsCardNumberLengthValid(string cardNumber)
        {

            if (cardNumber.Length == 15 || cardNumber.Length == 16)
                return true;
            else
                return false;
        }
        private bool ValidateCreditCard(string cardNumber)
        {
            // Check the prefix of the credit card number
            //Visa
            if (cardNumber.Length == 16 && cardNumber.StartsWith("4"))
            {
                return ValidateLuhn(cardNumber);
            }
            
            //MasterCard
            if (cardNumber.Length == 16 && cardNumber.StartsWith("5"))
            {
                int secondDigit = int.Parse(cardNumber[1].ToString());
                if (secondDigit >= 1 && secondDigit <= 5)
                    return ValidateLuhn(cardNumber);               
            }
            
            //Discover
            if (cardNumber.Length == 16 && cardNumber.StartsWith("6011"))
                return ValidateLuhn(cardNumber);
            
            //American Express
            if (cardNumber.Length == 15 && (cardNumber.StartsWith("34") || cardNumber.StartsWith("37")))
                return ValidateLuhn(cardNumber);
            
            return false;
        }
        private bool ValidateLuhn(string cardNumber)
        {
            // Implement the Luhn algorithm to validate the credit card number
            int sum = 0;
            bool isAlternate = false;
            for (int i = cardNumber.Length - 1; i >= 0; i--)
            {
                int currentDigit = int.Parse(cardNumber[i].ToString());

                if (isAlternate)
                {
                    currentDigit *= 2;

                    if (currentDigit > 9)
                        currentDigit -= 9;
                }

                sum += currentDigit;
                isAlternate = !isAlternate;
            }

            return sum % 10 == 0;
        }
        private bool ValidateCVV(string cvv, string cardType)
        {
            // Check the length of the CVV code
            if (cardType == "American Express")
                return cvv.Length == 4;

            else
                return cvv.Length == 3;          
        }
        private bool ValidateExpiration(int expMonth, int expYear)
        {
            // Check if the expiration date is in the future
            DateTime expirationDate = new DateTime(expYear, expMonth, 1).AddMonths(1).AddDays(-1);
            return expirationDate > DateTime.Now;
        }
    }
}
