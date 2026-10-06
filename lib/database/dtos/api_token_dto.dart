class ApiTokenDto {
  const ApiTokenDto({
    required this.id,
    required this.storageKey,
    required this.name,
  });

  final String id;
  final String storageKey;
  final String name;
}
