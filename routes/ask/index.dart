import 'dart:io';
import 'package:dart_frog/dart_frog.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

Future<Response> onRequest(RequestContext context) async {
  switch (context.request.method) {
    case HttpMethod.get:
      return _onGetResquest(context);
    case _:
      return Response(
        statusCode: HttpStatus.methodNotAllowed,
      );
  }
}

Future<Response> _onGetResquest(RequestContext context) async {
  final request = context.request;
  final queryParameters = request.uri.queryParameters;
  final question = queryParameters['question'];
  if (question == null || question.isEmpty) {
    return Response(
      statusCode: HttpStatus.badRequest,
    );
  }

  final model = context.read<GenerativeModel>();
  final promt = [Content.text(question)];
  final response = await model.generateContent(promt);

  return Response.json(body: 
    {
      'question': question,
      'response': response.text,
    },
  );
}
