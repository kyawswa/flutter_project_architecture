import 'package:event_bus/event_bus.dart';
import 'package:flutter_app_mvp/model/incrementor.dart';

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
  final Incrementor incrementor = Incrementor();

  IncrementPresenter() {
    incrementListener();
  }
  
  void incrementListener() {
    eventBus.on<IncrementAction>().listen((event) {
      // All events are of type UserLoggedInEvent (or subtypes of it).
      print(event.increment);
      switch(event.type) {
        case Event.ADD_INCREMENT:
          // response event to update the UI. call model service increment method. Presenter only handle ui logic.
          eventBus.fire(IncrementAction(Event.RESPONSE, incrementor.increment(event.increment)));
          break;
        default:
          break;
      }
    });
  }
}