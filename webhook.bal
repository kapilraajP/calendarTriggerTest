import ballerinax/trigger.google.calendar;
import ballerina/http;
import ballerina/log;

configurable calendar:ListenerConfig config = ?;

listener http:Listener httpListener = new(8090);
listener calendar:Listener webhookListener =  new(config,httpListener);

service calendar:CalendarService on webhookListener {
  
    remote function onNewEvent(calendar:Event payload ) returns error? {
      log:printInfo("Created new event");
    }
    remote function onEventUpdate(calendar:Event payload ) returns error? {
      log:printInfo("Updated event");
    }
    remote function onEventDelete(calendar:Event payload ) returns error? {
      log:printInfo("Deleted event");
    }
}

service /ignore on httpListener {}
