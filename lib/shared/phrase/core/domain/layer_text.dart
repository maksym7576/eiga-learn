import 'dart:ui';
import 'layer_state.dart';
import 'token.dart';

class LayerText {
  final List<Token> tokens;
  final TextDirection dir;
  final bool spaced;
  final LayerState state;

  const LayerText({
    required this.tokens,
    this.dir = TextDirection.ltr,
    this.spaced = true,
    this.state = LayerState.ready,
  });

  bool get isEmpty => tokens.isEmpty;
  bool get isNotEmpty => tokens.isNotEmpty;
}
