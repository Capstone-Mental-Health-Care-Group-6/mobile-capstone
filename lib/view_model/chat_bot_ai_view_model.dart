import 'package:empathi_care/model/chat_bot_ai_model.dart';
import 'package:empathi_care/model/services/chat_bot_ai_service.dart';
import 'package:flutter/material.dart';

class ChatBotAIProvider extends ChangeNotifier {
  final List<ChatBotPrompt> _chatMessages = [];
  final Map<int, bool> _buttonHoverStatus = {};
  ChatbotAiApiService chatBotAi = ChatbotAiApiService();
  ChatBotAI? chatbotAi;
  bool isLoading = true;
  List<ChatBotPrompt> get chatBotPrompt => _chatMessages;
  Map<int, bool> get buttonHoverStatus => _buttonHoverStatus;
  Map<String, String> menuExplanations = {
    'Mengatasi Gangguan Kecemasan': '',
    'Mengatasi Stress': '',
    'Mengatasi Depresi': '',
    'Mengatasi Psikomatis': '',
  };

  Future postPrompt(String message) async {
    try {
      isLoading = true;
      notifyListeners();

      chatbotAi = await chatBotAi.postPromptChatbotAi(message);

      menuExplanations['Mengatasi Gangguan Kecemasan'] =
          "${chatbotAi!.data.resultPrompt} \n\n *chatbot ini dapat membuat kesalahan. jika memang tidak dapat menyelesaikan masalah gangguan kecemasan maka harap hubungi psikolog profesional \n\nApakah informasi yang\nsaya berikan sudah jelas?";

      menuExplanations['Mengatasi Stress'] =
          "${chatbotAi!.data.resultPrompt} \n\n *chatbot ini dapat membuat kesalahan. jika memang tidak dapat menyelesaikan masalah stress maka harap hubungi psikolog profesional \n\nApakah informasi yang\nsaya berikan sudah jelas?";

      menuExplanations['Mengatasi Depresi'] =
          "${chatbotAi!.data.resultPrompt} \n\n *chatbot ini dapat membuat kesalahan. jika memang tidak dapat menyelesaikan masalah depresi maka hubungi psikolog profesional \n\nApakah informasi yang\nsaya berikan sudah jelas?";

      menuExplanations['Mengatasi Psikomatis'] =
          "${chatbotAi!.data.resultPrompt} \n\n *chatbot ini dapat membuat kesalahan. jika memang tidak dapat menyelesaikan masalah gangguan psikomatis maka hubungi psikolog profesional \n\nApakah informasi yang\nsaya berikan sudah jelas?";

      isLoading = false;
      notifyListeners();
    } catch (e) {
      isLoading = false;
      throw Exception(e);                
    }
  }

  void addMenuMessage(String message) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _chatMessages.add(ChatBotPrompt(text: message, isUser: false));
      notifyListeners();
    });
  }

  void addUserMessage(String message) async {
    _chatMessages.add(ChatBotPrompt(text: message, isUser: true));
    if (message != "Ya" && message != "Tidak" && !menuExplanations.values.contains(message)) {
      postPrompt(message);
    }
    notifyListeners();
  }

  void addButton(String buttonText) {
    addMenuMessage(buttonText);
  }

  void addMenuButtons() {
    addButton('Mengatasi Gangguan Kecemasan');
    addButton('Mengatasi Stress');
    addButton('Mengatasi Depresi');
    addButton('Mengatasi Psikomatis');
  }

  void clearMessages() {
    _chatMessages.clear();
    _buttonHoverStatus.clear();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
  }

  void handleMenuButtonPress(int buttonIndex, String token) {
    String lastMessage =
        _chatMessages.isNotEmpty ? _chatMessages[buttonIndex].text : "";

    if (lastMessage.contains("Gangguan") ||
        lastMessage.contains("Stress") ||
        lastMessage.contains("Depresi") ||
        lastMessage.contains("Psikomatis")) {
      String menuResponse = _chatMessages[buttonIndex].text;
      addUserMessage(menuResponse);

      _chatMessages.removeWhere((message) =>
          !message.isUser &&
          !message.text.contains('Selamat') &&
          !message.text.contains('gangguan kecemasan') &&
          !message.text.contains('masalah stress') &&
          !message.text.contains('masalah depresi') &&
          !message.text.contains('masalah gangguan psikomatis') &&
          !message.text.contains('Bagaimanakah') &&
          !menuExplanations.values.contains(message.text));

      notifyListeners();

      showMenuExplanation(menuResponse);
    } else if (lastMessage == 'Ya') {
      addUserMessage('Ya');
      addMenuMessage(
          'Terimakasih atas percakapannya!\nJika Anda memiliki pertanyaan lain nanti,\njangan ragu untuk datang kembali.\nSemoga harimu menyenangkan!');
      _chatMessages.removeWhere((message) =>
          !message.isUser &&
          (message.text.contains('Ya') || message.text.contains('Tidak')));
      notifyListeners();
    } else if (lastMessage == 'Tidak') {
      addUserMessage('Tidak');
      addMenuMessage('Bagaimanakah saya dapat membantu Anda?');
      addMenuButtons();

      _chatMessages.removeWhere((message) =>
          !message.isUser &&
          (message.text.contains('Ya') || message.text.contains('Tidak')));
      notifyListeners();
    }
  }

  void showMenuExplanation(String menuKey) {
    if (menuExplanations.containsKey(menuKey)) {
      addMenuMessage('load...');
      notifyListeners();

      postPrompt(menuKey).then((_) {
        _chatMessages.removeLast();

        addMenuMessage('${menuExplanations[menuKey]}');
        addMenuMessage('Ya');
        addMenuMessage('Tidak');
        notifyListeners();
      }).catchError((error) {
        _chatMessages.removeLast();
        notifyListeners();
      });
    }
  }

  void setButtonHoverStatus(int buttonIndex, bool isHovered) {
    _buttonHoverStatus[buttonIndex] = isHovered;
    notifyListeners();
  }

  void addInitialMessages() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      addMenuMessage(
          'Selamat datang di aplikasi kesehatan mental kami! Saya akan dengan senang hati membantu Anda memahami fitur yang tersedia. Berikut beberapa hal yang dapat Anda lakukan:');
      addMenuButtons();
    });
  }
}