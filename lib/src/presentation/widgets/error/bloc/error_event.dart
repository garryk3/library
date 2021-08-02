part of 'error_bloc.dart';

@immutable
abstract class ErrorEvent extends Equatable {
  final String message;
  const ErrorEvent(this.message);

  @override
  List<Object> get props => [message];
}

@immutable
class ErrorEventShow extends ErrorEvent {
  const ErrorEventShow(String message) : super(message);
}

@immutable
class ErrorEventHide extends ErrorEvent {
  const ErrorEventHide() : super(null);
}
