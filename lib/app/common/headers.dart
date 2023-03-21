const String OPEN_AI_KEY =
    "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";

const String baseURL = "https://api.openai.com/v1";

String endPoint(String endPoint) => "$baseURL/$endPoint";

Map<String, String> headerBearerOption(String token) => {
      "Content-Type": "application/json",
      'Authorization': 'Bearer $token',
    };

enum ApiState { loading, success, error, notFound }
