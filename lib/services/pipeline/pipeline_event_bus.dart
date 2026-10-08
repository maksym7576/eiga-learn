import 'dart:async';

class PipelineEvent {
  PipelineEvent(this.type, this.message, {this.data});
  final String type;
  final String message;
  final Map<String, dynamic>? data;
}

class PipelineEventBus {
  final _controller = StreamController<PipelineEvent>.broadcast();

  Stream<PipelineEvent> get stream => _controller.stream;

  void fire(PipelineEvent event) {
    _controller.add(event);
  }

  void dispose() {
    _controller.close();
  }
}
