class SubtitleSettingsState {
  final bool bd;
  final double fs;
  final double vo;
  final double gap;
  final double ga;
  final double lo;
  final double lt;
  final double th;
  final double go;
  final double oo;
  final double to;
  final double bop;
  final double bp;
  final double so;
  final double as;
  final double ts;

  const SubtitleSettingsState({
    this.bd = true,
    this.fs = 20.0,
    this.vo = 0.05,
    this.gap = 0.2,
    this.ga = 0.2,
    this.lo = 0.0,
    this.lt = 0.0,
    this.th = 0.0,
    this.go = 1.0,
    this.oo = 1.0,
    this.to = 1.0,
    this.bop = 0.6,
    this.bp = 8.0,
    this.so = 1.0,
    this.as = 1.0,
    this.ts = 1.0,
  });

  SubtitleSettingsState copyWith({
    bool? bd,
    double? fs,
    double? vo,
    double? gap,
    double? ga,
    double? lo,
    double? lt,
    double? th,
    double? go,
    double? oo,
    double? to,
    double? bop,
    double? bp,
    double? so,
    double? as,
    double? ts,
  }) {
    return SubtitleSettingsState(
      bd: bd ?? this.bd,
      fs: fs ?? this.fs,
      vo: vo ?? this.vo,
      gap: gap ?? this.gap,
      ga: ga ?? this.ga,
      lo: lo ?? this.lo,
      lt: lt ?? this.lt,
      th: th ?? this.th,
      go: go ?? this.go,
      oo: oo ?? this.oo,
      to: to ?? this.to,
      bop: bop ?? this.bop,
      bp: bp ?? this.bp,
      so: so ?? this.so,
      as: as ?? this.as,
      ts: ts ?? this.ts,
    );
  }
}
