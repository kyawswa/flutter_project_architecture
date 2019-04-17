import 'package:event_bus/event_bus.dart';

class IncrementAction {
  Event type;
  int increment;

  IncrementAction(this.type, this.increment);

}

enum Event {
  ADD_INCREMENT,
  RESPONSE
}
class IncrementPresenter {

  final EventBus eventBus = EventBus();

  IncrementPresenter() {
    incrementListener();
  }
  
  void incrementListener() {
    eventBus.on<IncrementAction>().listen((event) {
      // All events are of type UserLoggedInEvent (or subtypes of it).
      print(event.increment);
      switch(event.type) {
        case Event.ADD_INCREMENT:
          // response event to update the UI.
          eventBus.fire(IncrementAction(Event.RESPONSE, event.increment+1));
          break;
        default:
          break;
      }
    });
  }
}