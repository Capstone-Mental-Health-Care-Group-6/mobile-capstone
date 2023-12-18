import 'package:empathi_care/model/chat_bot_ai_model.dart';
import 'package:empathi_care/utils/constant/date.dart';
import 'package:empathi_care/view_model/chat_bot_ai_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatAIScreen extends StatefulWidget {
  const ChatAIScreen({super.key});

  @override
  State<ChatAIScreen> createState() => _ChatAIScreenState();
}

class _ChatAIScreenState extends State<ChatAIScreen> {
  late ChatBotAIProvider _chatBotProvider;

  @override
  void initState() {
    super.initState();

    _chatBotProvider = Provider.of<ChatBotAIProvider>(context, listen: false);
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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.more_vert),
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem(
                  value: 'option1',
                  child: Text('Option 1'),
                ),
                const PopupMenuItem(
                  value: 'option2',
                  child: Text('Option 2'),
                ),
              ];
            },
            onSelected: (value) {},
          ),
        ],
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
                              provider.handleMenuButtonPress(index);
                            }
                          },
                          child: message.isUser
                              ? _buildUserMessageContainer(message)
                              : (message.text.contains("Selamat") ||
                                      message.text.contains("Apakah informasi") ||
                                      message.text.contains("Bagaimanakah") ||
                                      message.text.contains("Terimakasih"))
                                  ? _buildBotMessageContainer(message)
                                  // : provider.isLoading ? _buildBotMessageContainer(message) : _buildMenuResponseButton(
                                  //     message, index, buttonKey, provider),
                                      : _buildMenuResponseButton(
                                      message, index, buttonKey, provider)
                        ),
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
          const CircleAvatar(
            backgroundImage: AssetImage('assets/images/Ellipse 7.png'),
            radius: 20.0,
          ),
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

  Widget _buildMenuResponseButton(
    ChatBotPrompt message,
    int index,
    int buttonKey,
    ChatBotAIProvider provider,
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
