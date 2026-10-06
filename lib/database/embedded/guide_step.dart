class GuideStep {
  const GuideStep({
    required this.title,
    this.subtitle,
    this.link,
    this.linkLabel,
  });

  final String title;
  final String? subtitle;
  final String? link;
  final String? linkLabel;
}
