using System;
using System.Collections.Generic;

public class Solution
{
    /// <summary>
    /// Returns the number of unique address.
    /// Assumption: All emails in collection are valid emails.
    /// Assumption: No nulls or empty values are passed
    /// </summary> 
    public int NumberOfUniqueEmailAddresses(string[] emails)
    {
        HashSet<string> uniqueEmails = new HashSet<string>();

        foreach (string email in emails)
        {
            string[] emailParts = email.ToLowerInvariant().Split('@');

            emailParts[0] = CleanLocalPart(emailParts[0]);

            uniqueEmails.Add(emailParts[0] + emailParts[1]);
        }

        return uniqueEmails.Count;
    }
    /// <summary>
    /// Removes irrelevant characters in the local part of the email
    /// </summary>
    /// <param name="localPart">string representing the local part of the email</param>
    private string CleanLocalPart(string localPart)
    {
        // Strip periods
        localPart = localPart.Replace(".", "");

        // Remove +
        int indexOfPlus = localPart.IndexOf("+");
        if (indexOfPlus >= 0)
        {
            localPart = localPart.Substring(0, indexOfPlus);
        }

        return localPart;
    }
}
