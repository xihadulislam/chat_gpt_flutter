const String OPEN_AI_KEY =
    "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";

const String baseURL = "https://api.openai.com/v1";

String endPoint(String endPoint) => "$baseURL/$endPoint";

Map<String, String> headerBearerOption(String token) => {
      "Content-Type": "application/json",
      'Authorization': 'Bearer $token',
    };

enum ApiState { loading, success, error, notFound }
