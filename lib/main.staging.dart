import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:vidooze_mobile/main.dart' as main_runner;

void main() async {
  await dotenv.load(fileName: ".env.staging");
  main_runner.main();
}
