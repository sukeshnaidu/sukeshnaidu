public class RecentlyCreatedAccountsController {
    @AuraEnabled
    public static List<Account> getRecentlyCreatedAccounts() {
        return [SELECT Name, AccountNumber, Type, CreatedDate FROM Account ORDER BY CreatedDate DESC LIMIT 10];
    }
}