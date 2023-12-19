import 'package:empathi_care/model/chat_bot_cs_model.dart';
import 'package:flutter/material.dart';

class ChatBotCSProvider extends ChangeNotifier {
  final List<ChatBotCS> _chatMessages = [];
  final Map<int, bool> _buttonHoverStatus = {};

  Map<int, bool> get buttonHoverStatus => _buttonHoverStatus;

  List<ChatBotCS> get chatBotCs => _chatMessages;
  final Map<String, String> menuExplanations = {
    'Bagaimana cara mengubah Biodata diri?':
        "Buka aplikasi. Masuk ke akun Anda. Cari 'Profil' atau pada  menu. Klik opsi 'Edit Profil'. Isi data baru dan simpan perubahan. \n\nApakah informasi yang saya berikan sudah jelas?",
    'Apa Fitur yang Tersedia?':
        'Kami memiliki beberapa fitur yang tersedia seperti Artikel, Buat Janji, Chatbot dan Konseling. Namun, kami memiliki fitur unggulan yaitu konseling dengan dokter spesialis yang tersedia. \n\nApakah informasi yang saya berikan sudah jelas?',
    'Panduan Untuk Buat Janji Dengan Konselor':
        "Klik menu 'Buat Janji'. Pilih konselor yang ingin Anda panggil. Pilih tanggal dan waktu. Klik tombol 'Buat Janji'.\n\nApakah informasi yang saya berikan sudah jelas?",
    'Panduan Untuk Konseling':
        "Klik menu 'Konseling'. Pastikan Anda Sudah membuat Janji Dengan Dokter, Pilih Dokter yang ingin Anda konsultasi. Anda akan berkomunikasi melalui chat dan video call.\n\nApakah informasi yang saya berikan sudah jelas?",
    'Panduan Untuk Chatbot':
        "Klik menu 'Chatbot'. Pilih pertanyaan yang ingin Anda tanyakan. AI akan membalas pertanyaan Anda.\n\nApakah informasi yang saya berikan sudah jelas?"
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

  void addAllMenuButtons() {
    for (var key in menuExplanations.keys) {
      addButton(key);
    }
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
        menuExplanations.keys.any((key) => lastMessage.contains(key))) {
      String menuResponse = _chatMessages[buttonIndex].text;
      addUserMessage(menuResponse);

      _chatMessages.removeWhere((message) =>
          !message.isUser &&
          !message.text.contains('Selamat') &&
          !message.text.contains('Bagaimanakah') &&
          !message.text.startsWith('1') &&
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
      addAllMenuButtons();

      _chatMessages.removeWhere((message) =>
          !message.isUser &&
          (message.text.contains('Ya') || message.text.contains('Tidak')));
      notifyListeners();
    }
  }

  void showMenuExplanation(String menuKey) {
    if (menuExplanations.containsKey(menuKey)) {
      addMenuMessage('Load...');

      Future.delayed(const Duration(seconds: 5), () {
        _chatMessages.removeLast();

        addMenuMessage('${menuExplanations[menuKey]}');
        addMenuMessage('Ya');
        addMenuMessage('Tidak');

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
      addAllMenuButtons();
    });
  }
}
