class ChatBotPrompt {
  final String text;
  final bool isUser;
  ChatBotPrompt({required this.text, required this.isUser});
}

class ChatBotAI {
    Data data;
    String message;

    ChatBotAI({
        required this.data,
        required this.message,
    });

    factory ChatBotAI.fromJson(Map<String, dynamic> json) => ChatBotAI(
        data: Data.fromJson(json["data"]),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "message": message,
    };
}

class Data {
    String id;
    int userId;
    String prompt;
    String resultPrompt;
    DateTime date;

    Data({
        required this.id,
        required this.userId,
        required this.prompt,
        required this.resultPrompt,
        required this.date,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        userId: json["user_id"],
        prompt: json["prompt"],
        resultPrompt: json["result_prompt"],
        date: DateTime.parse(json["date"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "prompt": prompt,
        "result_prompt": resultPrompt,
        "date": date.toIso8601String(),
    };
}

String token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MDI5MTI5OTYsImlhdCI6MTcwMjgyNjU5NiwiaWQiOjc5LCJyb2xlIjoiUGF0aWVudCIsInN0YXR1cyI6IkFjdGl2ZSJ9.Ay9595AE7eFJEOAF6WQpOns4QEsKfwuE2zhhyGpS-kI";