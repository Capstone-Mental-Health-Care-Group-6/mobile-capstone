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
    'Mengatasi Gangguan Kecemasan':
        // 'Jangan Berharap Kepada Manusia\n\nApakah informasi yang\nsaya berikan sudah jelas?',
        '',
    'Mengatasi Stress':
                // 'Uninstall Mobile Legend dan Jangan Main Compe di VALORANT jika bermain SOLO \n\nApakah informasi yang\nsaya berikan sudah jelas?',
                '',
    'Mengatasi Depresi':
                // 'Perbanyak Ibadah \n\nApakah informasi yang\nsaya berikan sudah jelas?',
                '',
    'Mengatasi Psikomatis':
                // 'Dukungan keluarga dan teman-teman sangat penting. Membangun jaringan dukungan yang kuat dapat membantu individu dengan psikosomatis merasa lebih terhubung dan kurang terisolasi. Apakah masalah anda sudah terselesaikan? \n\nApakah informasi yang\nsaya berikan sudah jelas?',
                '',
  };
  // Map<String, String> menuExplanations = {};
  
  Future postPrompt(String message) async{
    try {
      // print(message);
      chatbotAi = await chatBotAi.postPromptChatbotAi(token,message);
      // if(chatbotAi!.data.prompt == "Mengatasi Gangguan Kecemasan"){
        menuExplanations['Mengatasi Gangguan Kecemasan'] = "${chatbotAi!.data.resultPrompt} \n\nApakah informasi yang\nsaya berikan sudah jelas?";
      // }else if(chatbotAi!.data.prompt == "Mengatasi Stress"){
        menuExplanations['Mengatasi Stress'] = "${chatbotAi!.data.resultPrompt} \n\nApakah informasi yang\nsaya berikan sudah jelas?";
      // }else if(chatbotAi!.data.prompt == "Mengatasi Depresi"){
        menuExplanations['Mengatasi Depresi'] = "${chatbotAi!.data.resultPrompt} \n\nApakah informasi yang\nsaya berikan sudah jelas?";
      // }else{
        menuExplanations['Mengatasi Psikomatis'] = "${chatbotAi!.data.resultPrompt} \n\nApakah informasi yang\nsaya berikan sudah jelas?";
      // }
      isLoading = false;
    } catch (e) {
      throw Exception(e);
    }
    notifyListeners();
  }

  // Future fetchPrompt(String token) async{
  //   try {
  //     chatbotAi = await chatBotAi.fetchChatBotAI(token);
      
  //   } catch (e) {
  //     throw Exception(e);
  //   }
  //   notifyListeners();
  // }

  void addMenuMessage(String message) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _chatMessages.add(ChatBotPrompt(text: message, isUser: false));
      notifyListeners();
    });
  }

  void addUserMessage(String message) async {
    _chatMessages.add(ChatBotPrompt(text: message, isUser: true));
    if(message != "Ya" && message != "Tidak"){
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

  void handleMenuButtonPress(int buttonIndex) {
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
          !message.text.contains('Bagaimanakah'));

      showMenuExplanation(menuResponse);
      notifyListeners();
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
      // if(isLoading){
      //   debugPrint(isLoading.toString());
      //   addMenuMessage("Memuat");
      //   notifyListeners();
      // }else{
      //   debugPrint(isLoading.toString());
        addMenuMessage('${menuExplanations[menuKey]}');        
        addMenuMessage('Ya');
        addMenuMessage('Tidak');
        notifyListeners();
      // }
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
