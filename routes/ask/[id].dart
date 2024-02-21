import 'dart:convert';

import 'package:dart_frog/dart_frog.dart';

Response onRequest(RequestContext context, String id) {
  final id = context.request.uri.path;
  return Response(
      body: jsonEncode(
    {'path': '/ask/$id'},
  ),
  );
}
