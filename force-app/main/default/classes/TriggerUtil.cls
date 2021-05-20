public inherited sharing class TriggerUtil {
  public static void summariseChildData(List<Contact> newList) {
    Set<Id> accountIds = new Set<Id>();

    for (Contact con : [SELECT AccountId FROM Contact WHERE Id IN :newList]) {
      accountIds.add(con.AccountId);
    }

    List<Account> accountsToBeUpdated = new List<Account>();

    for (Account a : [
      SELECT Id, (SELECT Id FROM Contacts)
      FROM Account
      WHERE Id IN :accountIds
    ]) {
      Account updatedAccount = new Account(
        Id = a.Id,
        Contacts_Count__c = a.Contacts.size()
      );
      accountsToBeUpdated.add(updatedAccount);
    }

    if (
      !accountsToBeUpdated.isEmpty() &&
      Schema.sObjectType.Account.fields.Contacts_Count__c.isUpdateable()
    ) {
      update accountsToBeUpdated;
    }
  }
}
