import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:empathi_care/model/chat_bot_ai_model.dart';
import 'package:empathi_care/utils/baseurl.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatbotAiApiService{
  late SharedPreferences sp;
  final Dio _dio = Dio();
  String token = '';
  late String message;

  // Future<Psikolog> fetchPsikolog(String token) async {
  Future<ChatBotAI> fetchChatBotAI() async {
    sp = await SharedPreferences.getInstance();

    token = sp.getString('accesstoken').toString();
    try {
      final response = await _dio.get(
        "${Url.baseUrl}/chatbot",
        options: Options(
          headers: {'Authorization':'Bearer $token'}
          // headers: {'Authorization':'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MDI5MTI5OTYsImlhdCI6MTcwMjgyNjU5NiwiaWQiOjc5LCJyb2xlIjoiUGF0aWVudCIsInN0YXR1cyI6IkFjdGl2ZSJ9.Ay9595AE7eFJEOAF6WQpOns4QEsKfwuE2zhhyGpS-kI'}
        )
      );
      
      // final Map<String,dynamic> responseData = response.data;
      // ChatBotAI data = ChatBotAI.fromJson(response.data);
      return ChatBotAI.fromJson(response.data);
    } catch (e) {
      throw Exception('$e');
    }
  }

   Future<ChatBotAI> postPromptChatbotAi( String prompt) async {
     sp = await SharedPreferences.getInstance();

    token = sp.getString('accesstoken').toString();
    try {
      final response =
        await _dio.post('${Url.baseUrl}/chatbot',
          data: jsonEncode(<String, String>{
            'prompt': prompt,
          }),
          options: Options(
            headers: {'Authorization':'Bearer $token'}
            // headers: {'Authorization':'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MDI5MDE3MzQsImlhdCI6MTcwMjgxNTMzNCwiaWQiOjc5LCJyb2xlIjoiUGF0aWVudCIsInN0YXR1cyI6IkFjdGl2ZSJ9.RZ3A4MeJWrtDFNr8wX4GAGzrbSmhTezsc0FuPO-JWIk'}
          )
        );
        debugPrint(response.data.toString());
      return ChatBotAI.fromJson(response.data);
    } catch (e) {
      throw Exception('$e');
    }
  }
}