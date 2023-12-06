import 'package:empathi_care/model/chat_bot_cs_model.dart';
import 'package:flutter/material.dart';

class ChatBotCSProvider extends ChangeNotifier {
  final List<ChatBotCS> _chatMessages = [];
  final Map<int, bool> _buttonHoverStatus = {};

  Map<int, bool> get buttonHoverStatus => _buttonHoverStatus;

  List<ChatBotCS> get chatBotCs => _chatMessages;
  final Map<String, String> menuExplanations = {
    'Bagaimana cara mengubah Biodata diri?':
        '1. Buka aplikasi.\n2. Masuk ke akun Anda.\n3. Cari "Profil" atau pada  menu.\n4. Klik opsi "Edit Profil".\n5. Isi data baru dan simpan perubahan.\n\nApakah informasi yang\nsaya berikan sudah jelas?',
    'Apa saja fitur yang tersedia?':
        'Explanation for Fitur\n\nApakah informasi yang\nsaya berikan sudah jelas?',
    'Panduan Konseling':
        'Explanation for Konseling\n\nApakah informasi yang\nsaya berikan sudah jelas?',
  };

  void addMenuMessage(String message) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _chatMessages.add(ChatBotCS(text: message, isUser: false));
      notifyListeners();
    });
  }

  void addUserMessage(String message) {
    _chatMessages.add(ChatBotCS(text: message, isUser: true));
    notifyListeners();
  }

  void addButton(String buttonText) {
    addMenuMessage(buttonText);
  }

  void addMenuButtons() {
    addButton('Bagaimana cara mengubah Biodata diri?');
    addButton('Apa saja fitur yang tersedia?');
    addButton('Panduan Konseling');
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

    if (lastMessage.contains("Bagaimana") ||
        lastMessage.contains("fitur") ||
        lastMessage.contains("Konseling")) {
      String menuResponse = _chatMessages[buttonIndex].text;
      addUserMessage(menuResponse);

      _chatMessages.removeWhere((message) =>
          !message.isUser &&
          !message.text.contains('Selamat') &&
          !message.text.contains('Bagaimanakah') &&
          !message.text.startsWith('1') &&
          !message.text.startsWith('Explanation'));
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
      addMenuMessage('${menuExplanations[menuKey]}');
      addMenuMessage('Ya');
      addMenuMessage('Tidak');
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
