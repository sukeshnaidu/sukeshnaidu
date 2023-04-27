trigger NumberofContactTrigger on Contact (after insert,after update) {
    if(trigger.isafter && (trigger.isInsert || trigger.isupdate)){
        AccountContactCountHandler.updateNoOfCotactIntoAccounts(trigger.new);
    }
}