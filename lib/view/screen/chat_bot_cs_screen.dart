import 'package:empathi_care/model/chat_bot_cs_model.dart';
import 'package:empathi_care/utils/constant/date.dart';
import 'package:empathi_care/view_model/chat_bot_cs_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatMenuScreen extends StatefulWidget {
  const ChatMenuScreen({super.key});

  @override
  State<ChatMenuScreen> createState() => _ChatMenuScreenState();
}

class _ChatMenuScreenState extends State<ChatMenuScreen> {
  late ChatBotCSProvider _chatBotProvider;

  @override
  void initState() {
    super.initState();
    _chatBotProvider = Provider.of<ChatBotCSProvider>(context, listen: false);
    _chatBotProvider.addInitialMessages();
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
          'HelpBot',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 10,
          bottom: 10,
          left: 5,
          right: 10,
        ),
        child: Column(
          children: [
            Text('$formattedDate $formattedHour'),
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Consumer<ChatBotCSProvider>(
                    builder: (context, provider, child) {
                      return ListView.builder(
                        itemCount: provider.chatBotCs.length,
                        itemBuilder: (context, index) {
                          final message = provider.chatBotCs[index];
                          var buttonKey = index;

                          return Align(
                            alignment: message.isUser
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                            child: message.isUser
                                ? _buildUserMessageContainer(message)
                                : (message.text.contains("Selamat") ||
                                        provider.menuExplanations.values
                                            .contains(message.text) ||
                                        message.text.contains("Terimakasih") ||
                                        message.text.contains("Bagaimanakah"))
                                    ? _buildBotMessageContainer(message)
                                    : _buildMenuResponseButton(
                                        message, index, buttonKey, provider),
                          );
                        },
                      );
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

  Widget _buildUserMessageContainer(ChatBotCS message) {
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
          const CircleAvatar(
            backgroundImage: AssetImage('assets/images/Ellipse 7.png'),
            radius: 20.0,
          ),
        ],
      ),
    );
  }

  Widget _buildBotMessageContainer(ChatBotCS message) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/ChatBot.png',
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

  Widget _buildMenuResponseButton(
    ChatBotCS message,
    int index,
    int buttonKey,
    ChatBotCSProvider provider,
  ) {
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
            provider.handleMenuButtonPress(index);
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
}
