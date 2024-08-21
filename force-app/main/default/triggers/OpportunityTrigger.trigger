trigger OpportunityTrigger on Opportunity (before insert, after insert, before update, after update) {
  OpportunityTriggerHandler handler = new OpportunityTriggerHandler(Trigger.isExecuting, Trigger.size);
  
    switch on Trigger.operationType {
      when BEFORE_INSERT{
        handler.beforeInsert(Trigger.new);
      }
      when BEFORE_UPDATE{
        handler.beforeUpdate(Trigger.old, Trigger.new, Trigger.oldMap, Trigger.newMap);
      }
      /*when AFTER_INSERT {
        handler.afterInsert(Trigger.new, Trigger.newMap);
      }
      when AFTER_UPDATE {
        handler.afterUpdate(Trigger.old, Trigger.new, Trigger.oldMap, Trigger.newMap);
      }*/
    }
  }