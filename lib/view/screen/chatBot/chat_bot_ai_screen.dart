import 'package:empathi_care/model/chat_bot_ai_model.dart';
import 'package:empathi_care/utils/constant/date.dart';
import 'package:empathi_care/view_model/chat_bot_ai_view_model.dart';
import 'package:empathi_care/view_model/get_patient_by_id_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';

class ChatAIScreen extends StatefulWidget {
  const ChatAIScreen({super.key});

  @override
  State<ChatAIScreen> createState() => _ChatAIScreenState();
}

class _ChatAIScreenState extends State<ChatAIScreen> {
  late ChatBotAIProvider _chatBotProvider;
  late SharedPreferences sp;
  String token = '';

  late GetPatientByIdViewModel getPatientByIdViewModel;

  String avatar = "";

  @override
  void initState() {
    super.initState();

    _chatBotProvider = Provider.of<ChatBotAIProvider>(context, listen: false);
    _chatBotProvider.addInitialMessages();
    initial();
  }

  void initial() async {
    sp = await SharedPreferences.getInstance();
    token = sp.getString('accesstoken').toString();
    avatar = sp.getString('avatar') ?? '';
    await Future.delayed(const Duration(seconds: 2));
    setState(() {});
  }

  @override
  void dispose() {
    _chatBotProvider.clearMessages();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'VirtuBot',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10, left: 5, right: 10),
        child: Column(
          children: [
            Text('$formattedDate $formattedHour'),
            Expanded(
              child: Consumer<ChatBotAIProvider>(
                builder: (context, provider, child) {
                  return ListView.builder(
                    itemCount: provider.chatBotPrompt.length,
                    itemBuilder: (context, index) {
                      final message = provider.chatBotPrompt[index];
                      var buttonKey = index;
                      return Align(
                          alignment: message.isUser
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          child: GestureDetector(
                            onTap: () {
                              if (!message.isUser) {
                                provider.handleMenuButtonPress(index, token);
                              }
                            },
                            child: message.isUser
                                ? _buildUserMessageContainer(message)
                                : (message.text.contains("Selamat") ||
                                        message.text.contains("Bagaimanakah") ||
                                        message.text
                                            .contains("gangguan kecemasan") ||
                                        message.text
                                            .contains("masalah stress") ||
                                        message.text
                                            .contains("masalah depresi") ||
                                        message.text.contains(
                                            "masalah gangguan psikomatis") ||
                                        message.text.contains("Terimakasih"))
                                    ? _buildBotMessageContainer(message)
                                    : message.text.contains("load")
                                        ? _buildLoadMessage()
                                        : _buildMenuResponseButton(message,
                                            index, buttonKey, provider, token),
                          ));
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUserMessageContainer(ChatBotPrompt message) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Flexible(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 345.0),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: const Color(0xFFAAD6FF),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                message.text,
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
            ),
          ),
          const SizedBox(width: 8.0),
          if (avatar.isNotEmpty) ...[
            CircleAvatar(
              backgroundImage: NetworkImage(avatar),
              radius: 20.0,
            )
          ]
        ],
      ),
    );
  }

  Widget _buildBotMessageContainer(ChatBotPrompt message) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/chatbot_home.png',
          ),
          const SizedBox(width: 10.0),
          Flexible(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 345.0),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: const Color(0xFFAAD6FF),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                message.text,
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuResponseButton(ChatBotPrompt message, int index,
      int buttonKey, ChatBotAIProvider provider, String token) {
    bool processingTap = false;

    return Container(
      margin: const EdgeInsets.only(left: 55, bottom: 5),
      child: GestureDetector(
        onTapDown: (_) {
          provider.setButtonHoverStatus(index, true);
        },
        onTapUp: (_) {
          provider.setButtonHoverStatus(index, false);

          if (!processingTap) {
            processingTap = true;

            Future.delayed(const Duration(seconds: 1), () {
              processingTap = false;
            });
            provider.handleMenuButtonPress(index, token);
          }
        },
        onTapCancel: () {
          provider.setButtonHoverStatus(index, false);
        },
        child: Container(
          decoration: BoxDecoration(
            color: provider.buttonHoverStatus[index] ?? false
                ? const Color(0xFF0085FF)
                : Colors.white,
            borderRadius: BorderRadius.circular(9),
            border: Border.all(color: const Color(0xFF0085FF), width: 2),
          ),
          padding: const EdgeInsets.all(5),
          child: Text(
            message.text,
            style: TextStyle(
              color: provider.buttonHoverStatus[index] ?? false
                  ? Colors.white
                  : Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoadMessage() {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/chatbot.png',
          ),
          const SizedBox(width: 10.0),
          Padding(
            padding: const EdgeInsets.only(top: 7),
            child: Shimmer.fromColors(
              baseColor: const Color.fromARGB(255, 46, 46, 46),
              highlightColor: const Color.fromARGB(255, 117, 117, 117),
              child: const Text(
                "Typing...",
                style: TextStyle(
                  fontSize: 13.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
