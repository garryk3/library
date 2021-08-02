import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart';

class EventObserver extends BlocObserver {
  final Logger logger;
  EventObserver(this.logger);

  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
  }

  @override
  void onError(Cubit cubit, Object error, StackTrace stackTrace) {
    logger.e('Error on $cubit!', error, stackTrace);
    super.onError(cubit, error, stackTrace);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    logger.d('Bloc $bloc: prev state @@@ - ${transition.currentState}, next state @@@ - ${transition.nextState}');
    super.onTransition(bloc, transition);
  }
}
