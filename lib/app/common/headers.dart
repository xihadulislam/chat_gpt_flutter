const String OPEN_AI_KEY =
    "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";

const String baseURL = "https://api.openai.com/v1";

String endPoint(String endPoint) => "$baseURL/$endPoint";

Map<String, String> headerBearerOption(String token) => {
      "Content-Type": "application/json",
      'Authorization': 'Bearer $token',
    };

enum ApiState { loading, success, error, notFound }
