import 'dart:convert';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GroqCall {
  static Future<ApiCallResponse> call({
    String? prompt = 'https://dummyjson.com/c/dc96-cb11-4961-b389',
    String? new123 = '',
    List<String>? datasetList,
  }) async {
    final dataset = _serializeList(datasetList);

    final ffApiRequestBody = '''
{
  "model": "llama3-8b-8192",
  "messages": [
    {
      "role": "system",
      "content": "You are a helpful assistant."
    },
    {
      "role": "user",
      "content": "this is the dataset${dataset} PRINT DATASET AND PROMPT${escapeStringForJson(prompt)}"
    }
  ],
  "temperature": 0.7,
  "top_p": 1,
  "max_tokens": 1024,
  "stream": false
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'groq',
      apiUrl: 'https://api.groq.com/openai/v1/chat/completions',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer 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',
        'Content-Type': '\tapplication/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? response(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.choices[:].message.content''',
      ));
}

class RealtimedatabasePostCall {
  static Future<ApiCallResponse> call({
    String? title = '',
    String? description = '',
  }) async {
    final ffApiRequestBody = '''
{
  "users": [
    {
      "userId": "U001",
      "crisisName": "Flood in Ganga Nagar",
      "description": "Heavy floods have displaced hundreds of families.",
      "location": "Ganga Nagar, Uttar Pradesh",
      "needs": {
        "primary": "Food Supplies",
        "secondary": "Temporary Shelter"
      },
      "status": "Critical"
    },
    {
      "userId": "U002",
      "crisisName": "Fire in Rohini Slum",
      "description": "A major fire broke out affecting 120 huts.",
      "location": "Rohini Sector 27, Delhi",
      "needs": {
        "primary": "Clothing",
        "secondary": "Medical Aid"
      },
      "status": "High"
    },
    {
      "userId": "U003",
      "crisisName": "Earthquake Aftershock",
      "description": "Aftershock damaged homes in the village.",
      "location": "Chamoli, Uttarakhand",
      "needs": {
        "primary": "Reconstruction Materials",
        "secondary": "Clean Drinking Water"
      },
      "status": "Medium"
    },
    {
      "userId": "U004",
      "crisisName": "Drought Crisis",
      "description": "Water scarcity and crop failure reported.",
      "location": "Barmer, Rajasthan",
      "needs": {
        "primary": "Water Tankers",
        "secondary": "Livestock Feed"
      },
      "status": "Low"
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'realtimedatabasePost',
      apiUrl: 'https://fleet-d99c0-default-rtdb.firebaseio.com/crises.json',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class RealtimedatabaseGetCall {
  static Future<ApiCallResponse> call({
    String? title = '',
    String? description = '',
  }) async {
    final ffApiRequestBody = '''
{
  "users": [
    {
      "userId": "U001",
      "crisisName": "Flood in Ganga Nagar",
      "description": "Heavy floods have displaced hundreds of families.",
      "location": "Ganga Nagar, Uttar Pradesh",
      "needs": {
        "primary": "Food Supplies",
        "secondary": "Temporary Shelter"
      },
      "status": "Critical"
    },
    {
      "userId": "U002",
      "crisisName": "Fire in Rohini Slum",
      "description": "A major fire broke out affecting 120 huts.",
      "location": "Rohini Sector 27, Delhi",
      "needs": {
        "primary": "Clothing",
        "secondary": "Medical Aid"
      },
      "status": "High"
    },
    {
      "userId": "U003",
      "crisisName": "Earthquake Aftershock",
      "description": "Aftershock damaged homes in the village.",
      "location": "Chamoli, Uttarakhand",
      "needs": {
        "primary": "Reconstruction Materials",
        "secondary": "Clean Drinking Water"
      },
      "status": "Medium"
    },
    {
      "userId": "U004",
      "crisisName": "Drought Crisis",
      "description": "Water scarcity and crop failure reported.",
      "location": "Barmer, Rajasthan",
      "needs": {
        "primary": "Water Tankers",
        "secondary": "Livestock Feed"
      },
      "status": "Low"
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'realtimedatabaseGet',
      apiUrl: 'https://fleet-d99c0-default-rtdb.firebaseio.com/crises.json',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class FirestoredataCall {
  static Future<ApiCallResponse> call({
    dynamic datafiresJson,
    String? prompt = '',
  }) async {
    final datafires = _serializeJson(datafiresJson, true);
    final ffApiRequestBody = '''
{
  "prompt": "${escapeStringForJson(prompt)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'firestoredata',
      apiUrl: 'https://sendtogroq-xsvifii5bq-uc.a.run.app',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? dattaaa(dynamic response) => getJsonField(
        response,
        r'''$''',
        true,
      ) as List?;
  static String? data(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.result''',
      ));
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
