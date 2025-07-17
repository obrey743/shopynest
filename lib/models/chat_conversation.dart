class ChatConversation {
  final String id;
  final String userName;
  final String lastMessage;
  final DateTime timestamp;
  final int unreadCount;
  final String userAvatar;

  ChatConversation({
    required this.id,
    required this.userName,
    required this.lastMessage,
    required this.timestamp,
    required this.unreadCount,
    required this.userAvatar,
  });

  factory ChatConversation.fromJson(Map<String, dynamic> json) {
    return ChatConversation(
      id: json['id'],
      userName: json['userName'],
      lastMessage: json['lastMessage'],
      timestamp: DateTime.parse(json['timestamp']),
      unreadCount: json['unreadCount'],
      userAvatar: json['userAvatar'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userName': userName,
      'lastMessage': lastMessage,
      'timestamp': timestamp.toIso8601String(),
      'unreadCount': unreadCount,
      'userAvatar': userAvatar,
    };
  }
}