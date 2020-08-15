import 'package:flutter/services.dart';

/// Class for not user events
abstract class ServiceEvent {}

/// Event with [IsolateBloc]'s state or or with event from [IsolateBlocWrapper]
class IsolateBlocTransitionEvent<Event> extends ServiceEvent {
  final String blocUuid;
  final Event event;

  IsolateBlocTransitionEvent(this.blocUuid, this.event);
}

/// Request to create new [IsolateBloc]
class CreateIsolateBlocEvent extends ServiceEvent {
  final Type blocType;

  CreateIsolateBlocEvent(this.blocType);
}

/// Event to bind [IsolateBlocWrapper] to the [IsolateBloc] when second one is created
class IsolateBlocCreatedEvent extends ServiceEvent {
  final String blocUuid;
  final Type blocType;

  IsolateBlocCreatedEvent(this.blocType, this.blocUuid);
}

/// When every [IsolateBloc]s are initialized
class IsolateBlocsInitialized extends ServiceEvent {
  final Map<Type, Object> initialStates;

  IsolateBlocsInitialized(this.initialStates);
}

/// Event to close IsolateBloc. Called by [IsolateBlocWrapper.close()]
class CloseIsolateBlocEvent extends ServiceEvent {
  final String blocUuid;

  CloseIsolateBlocEvent(this.blocUuid);
}

/// Event to invoke [MethodChannel] in main isolate.
class InvokePlatformChannelEvent extends ServiceEvent {
  final ByteData data;
  final String channel;
  final String id;

  InvokePlatformChannelEvent(this.data, this.channel, this.id);
}

/// Event with response from [MethodChannel]
class PlatformChannelResponseEvent extends ServiceEvent {
  final ByteData data;
  final String id;

  PlatformChannelResponseEvent(this.data, this.id);
}

/// Event to invoke [MethodChannel.setMethodCallHandler] in [IsolateBloc]'s isolate.
class InvokeMethodChannelEvent extends ServiceEvent {
  final ByteData data;
  final String channel;
  final String id;

  InvokeMethodChannelEvent(this.data, this.channel, this.id);
}

/// Event with response from [MethodChannel.setMethodCallHandler] in [IsolateBloc]'s isolate.
class MethodChannelResponseEvent extends ServiceEvent {
  final ByteData data;
  final String id;

  MethodChannelResponseEvent(this.data, this.id);
}
