public class AccountContactCountHandler{
    public static void updateNoOfCotactIntoAccounts(List<contact> lstOfContacts){
     //---> the Set class rocks for finding the unique values in a list
    Set<Id> acctIds = new Set<Id>();
   	for (Contact c : lstOfContacts) {
     if (c.AccountId != null) {
            acctIds.add(c.AccountId);
        }
    }
   
    List<Account> lstOfAcconts = new List<Account>();
    
    //****** Here is the Aggregate query...don't count in loops, let the DB do it for you*****
    for (AggregateResult ar : [SELECT AccountId AcctId, Count(id) ContactCount 
                               FROM Contact 
                               WHERE AccountId in: acctIds 
                               GROUP BY AccountId]){
        Account a = new Account();
        a.Id = (Id) ar.get('AcctId'); //---> handy trick for updates, set the id and update
        a.Number_of_Contacts__c = (Integer) ar.get('ContactCount');
        lstOfAcconts.add(a);
    }
    
    //----> probably you'll want to do a little more error handling than this...but this should work. 
    update lstOfAcconts;
    }}