import 'package:flutter/material.dart';
import '../../models/chat_conversation.dart';
import 'chat_detail_screen.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<ChatConversation> conversations = [
    ChatConversation(
      id: '1',
      userName: 'Sarah Johnson',
      lastMessage: 'Is the jacket still available?',
      timestamp: DateTime.now().subtract(Duration(minutes: 15)),
      unreadCount: 2,
      userAvatar: 'S',
    ),
    ChatConversation(
      id: '2',
      userName: 'Mike Chen',
      lastMessage: 'Thanks for the quick delivery!',
      timestamp: DateTime.now().subtract(Duration(hours: 2)),
      unreadCount: 0,
      userAvatar: 'M',
    ),
    ChatConversation(
      id: '3',
      userName: 'Emma Wilson',
      lastMessage: 'Can you send more photos?',
      timestamp: DateTime.now().subtract(Duration(days: 1)),
      unreadCount: 1,
      userAvatar: 'E',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Messages'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: conversations.isEmpty
          ? _buildEmptyState()
          : _buildConversationsList(),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.chat_bubble_outline,
            size: 80,
            color: Colors.grey[400],
          ),
          SizedBox(height: 16),
          Text(
            'No messages yet',
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Start shopping to begin conversations',
            style: TextStyle(
              color: Colors.grey[500],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildConversationsList() {
    return ListView.builder(
      itemCount: conversations.length,
      itemBuilder: (context, index) {
        final conversation = conversations[index];
        return _buildConversationTile(conversation);
      },
    );
  }

  Widget _buildConversationTile(ChatConversation conversation) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.blue,
        child: Text(
          conversation.userAvatar,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      title: Text(
        conversation.userName,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        conversation.lastMessage,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            _formatTime(conversation.timestamp),
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 12,
            ),
          ),
          if (conversation.unreadCount > 0)
            Container(
              margin: EdgeInsets.only(top: 4),
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                conversation.unreadCount.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
        ],
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatDetailScreen(conversation: conversation),
          ),
        );
      },
    );
  }

  String _formatTime(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);

    if (difference.inMinutes < 60) {
      return '${difference.inMinutes}m';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}h';
    } else {
      return '${difference.inDays}d';
    }
  }
}