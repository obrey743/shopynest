class ChatMessage {
  final String id;
  final String text;
  final bool isFromCurrentUser;
  final DateTime timestamp;

  ChatMessage({
    required this.id,
    required this.text,
    required this.isFromCurrentUser,
    required this.timestamp,
  });

  factory ChatMessage.fromJson(Map<String, dynamic> json) {
    return ChatMessage(
      id: json['id'],
      text: json['text'],
      isFromCurrentUser: json['isFromCurrentUser'],
      timestamp: DateTime.parse(json['timestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'text': text,
      'isFromCurrentUser': isFromCurrentUser,
      'timestamp': timestamp.toIso8601String(),
    };
  }
}