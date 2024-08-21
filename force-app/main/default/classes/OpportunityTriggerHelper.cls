public with sharing class OpportunityTriggerHelper {
    public OpportunityTriggerHelper() {

    }

    public void VerifyOpps(Opportunity[] records){
        for(Opportunity Opp : records){
            //Opportunity LstOpp = [SELECT Id, Name, StageName, OppRating__c FROM Opportunity WHERE AccountId =: Opp.AccountId AND StageName =: Opp.StageName AND OppRating__c =: Opp.OppRating__c];
            List<Opportunity> LstOpp = [SELECT Id, Name, StageName, OppRating__c FROM Opportunity WHERE AccountId =: Opp.AccountId AND StageName =: Opp.StageName AND OppRating__c =: Opp.OppRating__c];
            
            if(LstOpp.size() > 0){
                Opp.addError('Não é permitido existir mais uma Oportunidade com mesma classificação, na mesma etapa do funil');
            }
        }       
    }
}