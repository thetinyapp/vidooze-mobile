import 'package:flutter_dotenv/flutter_dotenv.dart';

class Env {
  static String apiUrl = dotenv.get("API_URL", fallback: "");
}
