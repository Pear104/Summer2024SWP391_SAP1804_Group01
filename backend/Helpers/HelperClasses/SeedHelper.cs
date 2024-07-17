namespace Helpers.HelperClasses
{
    public static class SeedHelper
    {
        public static string GenerateRandomFeedback()
        {
            string[] beginnings =
            {
                "The diamond is ",
                "Absolutely stunning ",
                "I am amazed by ",
                "Incredible craftsmanship, ",
                "Gorgeous diamond ",
                "Impressive quality ",
                "Shines brilliantly, ",
                "Exquisite design ",
                "Sparkles like a star, ",
                "Beyond expectations, "
            };

            string[] middles =
            {
                "and ",
                "with ",
                "set in ",
                "as ",
                "that ",
                "which ",
                "has a ",
                "among ",
                "thanks to ",
                "especially "
            };

            string[] endings =
            {
                "its clarity and brilliance. ",
                "the elegant setting. ",
                "the stunning brilliance. ",
                "it shines in the light. ",
                "the unique cut. ",
                "the beautiful sparkle. ",
                "the exquisite craftsmanship. ",
                "the perfect size. ",
                "the exceptional quality. ",
                "its breathtaking beauty. "
            };

            Random random = new Random();

            string beginning = beginnings[random.Next(beginnings.Length)];
            string middle = middles[random.Next(middles.Length)];
            string ending = endings[random.Next(endings.Length)];

            // Combine the parts to form a feedback
            string feedback = beginning + middle + ending;

            // Ensure the feedback has more than 50 characters
            if (feedback.Length <= 50)
            {
                // If generated feedback is too short, concatenate additional parts
                var middlesStr = middles[random.Next(middles.Length)];
                feedback +=
                    char.ToUpper(middlesStr[0])
                    + middlesStr.Substring(1)
                    + endings[random.Next(endings.Length)];
            }

            return feedback;
        }

        public static DateTime GenerateRandomDate(DateTime minDate, DateTime maxDate)
        {
            Random random = new Random();

            // Calculate the range of days between minDate and maxDate
            TimeSpan range = maxDate - minDate;

            // Generate a random number of days within that range
            int randomDays = random.Next(0, (int)range.TotalDays + 1);

            // Add the random number of days to minDate to get a random date
            DateTime randomDate = minDate.AddDays(randomDays);

            return randomDate;
        }
    }
}
