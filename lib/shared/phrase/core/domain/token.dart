class Token {
  final String text;
  final int index;
  final int? groupId;

  const Token({
    required this.text,
    required this.index,
    this.groupId,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Token &&
          runtimeType == other.runtimeType &&
          text == other.text &&
          index == other.index &&
          groupId == other.groupId;

  @override
  int get hashCode => text.hashCode ^ index.hashCode ^ groupId.hashCode;
}
