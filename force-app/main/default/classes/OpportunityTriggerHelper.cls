public with sharing class OpportunityTriggerHelper {
    public OpportunityTriggerHelper() {}

    public void VerifyOpps(Opportunity[] records){
        Set<Id> accountIds = new Set<Id>();

        for(Opportunity opp : records){
            accountIds.add(opp.AccountId);
        }

        List<Opportunity> existingOpps = [
            SELECT Id, Name, StageName, OppRating__c, AccountId 
            FROM Opportunity 
            WHERE AccountId IN :accountIds
        ];

        Map<Id, List<Opportunity>> oppMap = new Map<Id, List<Opportunity>>();
        
        for(Opportunity opp : existingOpps){
            if(!oppMap.containsKey(opp.AccountId)){
                oppMap.put(opp.AccountId, new List<Opportunity>());
            }
            oppMap.get(opp.AccountId).add(opp);
        }

        for(Opportunity opp : records){
            if(oppMap.containsKey(opp.AccountId)){
                for(Opportunity existingOpp : oppMap.get(opp.AccountId)){
                    if(existingOpp.StageName == opp.StageName && existingOpp.OppRating__c == opp.OppRating__c) {
                        if(opp.StageName != 'Encerrado' && opp.StageName != 'Contrato Enviado') {
                            opp.addError('Não é possível criar ou atualizar uma oportunidade com o mesmo tipo e na mesma fase, exceto se a fase for Encerrado ou Contrato Enviado.');
                        }
                    }
                }
            }
        }
    }
}
