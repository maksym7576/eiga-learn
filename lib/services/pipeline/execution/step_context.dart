import 'package:eiga/database/models/video.dart';
import 'package:eiga/database/models/phrase.dart';

class StepContext {
  StepContext({
    required this.video,
    required this.phrases,
    required this.previousResults,
    required this.runningGlossary,
  });

  final Video video;
  final List<Phrase> phrases;
  final Map<String, dynamic> previousResults;
  final List<String> runningGlossary;
}
