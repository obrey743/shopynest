port 'package:flutter/material.dart';
import '../../models/chat_conversation.dart';
import '../../models/chat_message.dart';

class ChatDetailScreen extends StatefulWidget {
  final ChatConversation conversation;

  ChatDetailScreen({required this.conversation});

  @override
  _ChatDetailScreenState createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  final _messageController = TextEditingController();
  final List<ChatMessage> messages = [
    ChatMessage(
      id: '1',
      text: 'Hi! Is the vintage denim jacket still available?',
      isFromCurrentUser: false,
      timestamp: DateTime.now().subtract(Duration(minutes: 20)),
    ),
    ChatMessage(
      id: '2',
      text: 'Yes, it is! Are you interested in purchasing it?',
      isFromCurrentUser: true,
      timestamp: DateTime.now().subtract(Duration(minutes: 18)),
    ),
    ChatMessage(
      id: '3',
      text: 'Absolutely! Can you tell me more about the condition?',
      isFromCurrentUser: false,
      timestamp: DateTime.now().subtract(Duration(minutes: 15)),
    ),
  ];

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(
        children: [
          Expanded(child: _buildMessagesList()),
          _buildMessageInput(),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.blue,
            radius: 18,
            child: Text(
              widget.conversation.userAvatar,
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(width: 12),
          Text(widget.conversation.userName),
        ],
      ),
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
    );
  }

  Widget _buildMessagesList() {
    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final message = messages[index];
        return _buildMessageBubble(message);
      },
    );
  }

  Widget _buildMessageBubble(ChatMessage message) {
    return Align(
      alignment: message.isFromCurrentUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.only(bottom: 8),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: message.isFromCurrentUser ? Colors.blue : Colors.grey[200],
          borderRadius: BorderRadius.circular(18),
        ),
        child: Text(
          message.text,
          style: TextStyle(
            color: message.isFromCurrentUser ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _messageController,
              decoration: InputDecoration(
                hintText: 'Type a message...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[100],
                contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
            ),
          ),
          SizedBox(width: 8),
          CircleAvatar(
            backgroundColor: Colors.blue,
            child: IconButton(
              icon: Icon(Icons.send, color: Colors.white),
              onPressed: _sendMessage,
            ),
          ),
        ],
      ),
    );
  }

  void _sendMessage() {
    if (_messageController.text.trim().isNotEmpty) {
      setState(() {
        messages.add(
          ChatMessage(
            id: DateTime.now().millisecondsSinceEpoch.toString(),
            text: _messageController.text,
            isFromCurrentUser: true,
            timestamp: DateTime.now(),
          ),
        );
        _messageController.clear();
      });
    }
  }
}
