trigger RewardAssignmentTrigger on Reward_Assignment__c (before insert) {
	
    for( Reward_Assignment__c ra_i : Trigger.new ){
        
        ra_i.Current_Points__c += ra_i.Points_to_Award__c;
        
        if( ra_i.Current_Points__c >= ra_i.Points_Needed__c ){
            
            ra_i.Status__c = 'Reward';
        }
    }
}