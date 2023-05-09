public class InsertContact {
    public static void createContact(String firstName, String lastName, String email, Id accountId) {
        Contact contact = new Contact();
        contact.FirstName = firstName;
        contact.LastName = lastName;
        contact.Email = email;
        contact.AccountId = accountId;
        insert contact;
    }
}