import 'dart:io';
import 'package:dart_frog/dart_frog.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

const hardcodeApikey = 'AIzaSyCar3JtTbKoUSaKNoI9whGjEHdsUN0ZOD8';

final apiKey = Platform.environment['GEMINI_API_KEY'] ?? hardcodeApikey;

final _model = GenerativeModel(model: 'gemini-pro', apiKey: apiKey);

Middleware modelProvider() {
  return provider<GenerativeModel>((context) => _model);
}

Handler middleware(Handler handler) {
  return handler.use(modelProvider());
}
