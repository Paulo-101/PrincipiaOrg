public with sharing class OpportunityTriggerHandler {
    private Boolean isTriggerExecuting;
    private Integer triggerSize;
    private OpportunityTriggerHelper helper;

    public OpportunityTriggerHandler(Boolean isTriggerExecuting, Integer triggerSize) {
        this.isTriggerExecuting = isTriggerExecuting;
        this.triggerSize = triggerSize;
        this.helper = new OpportunityTriggerHelper();
    }

    public void beforeInsert(Opportunity[] newRecords){
        this.helper.VerifyOpps(newRecords);
    }

    public void beforeUpdate(Opportunity[] oldRecords, Opportunity[] newRecords, Map<Id, Opportunity> oldRecordMap, Map<Id, Opportunity> newRecordMap){
        this.helper.VerifyOpps(newRecords);
    }

    public void afterInsert(Opportunity[] newRecords, Map<Id, Opportunity> newRecordMap){
    }

    public void afterUpdate(Opportunity[] oldRecords, Opportunity[] newRecords, Map<Id, Opportunity> oldRecordMap, Map<Id, Opportunity> newRecordMap){
    }
}