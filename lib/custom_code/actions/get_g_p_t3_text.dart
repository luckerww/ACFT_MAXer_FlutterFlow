// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// ignore_for_file: avoid_print

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

Future<String> getGPT3Text(
  String apiKey,
  String prompt,
  int maxTokens,
  double temperature,
  double presencePenalty,
) async {
  final data = {
    'prompt': prompt,
    'max_tokens': maxTokens,
    'temperature': temperature,
    'presence_penalty': presencePenalty
  };

  final headers = {
    'Authorization':
        'Bearer sk-proj-Z4R3E2MiI92sKvZ1qQbmT3BlbkFJcYYcgczwHWIJV38LUMyn',
    'Content-Type': 'application/json'
  };
  final request = http.Request(
    'POST',
    Uri.parse('https://api.openai.com/v1/engines/text-davinci-003/completions'),
  );
  request.body = json.encode(data);
  request.headers.addAll(headers);

  final httpResponse = await request.send();

  if (httpResponse.statusCode == 200) {
    final jsonResponse = json.decode(await httpResponse.stream.bytesToString());

    String ress = jsonResponse['choices'][0]['text'];
    ress = ress.trim();
    return ress;
  } else {
    print(httpResponse.reasonPhrase);
    return '';
  }
}
