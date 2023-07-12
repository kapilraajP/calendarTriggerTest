import ballerinax/trigger.google.calendar;
import ballerina/http;

configurable calendar:ListenerConfig config = ?;

listener http:Listener httpListener = new(8090);
listener calendar:Listener webhookListener =  new(config,httpListener);

service calendar:CalendarService on webhookListener {
  
    remote function onNewEvent(calendar:Event payload ) returns error? {
      //Not Implemented
    }
    remote function onEventUpdate(calendar:Event payload ) returns error? {
      //Not Implemented
    }
    remote function onEventDelete(calendar:Event payload ) returns error? {
      //Not Implemented
    }
}

service /ignore on httpListener {}