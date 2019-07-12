trigger RewardEventTrigger on Reward_Event__e (after insert) {
    
    List<Reward_Assignment__c> rewardAssignmentList = new List<Reward_Assignment__c>();
    
    for( Reward_Event__e e : Trigger.new ){
        
        Reward__c r = new Reward__c(
            External_Id__c = e.Reward_External_Id__c
        );
        
        rewardAssignmentList.add( 
            
            new Reward_Assignment__c(
                Reward__r = r,
                Reward_To__c = e.User_Id__c,
                External_Id__c = e.User_Id__c+e.Reward_External_Id__c,
                Status__c = 'In Progress'
            )
        );
    
        
    }
    
    Schema.SObjectField f = Reward_Assignment__c.Fields.External_Id__c;        
    Database.upsert( rewardAssignmentList,f,true);
}