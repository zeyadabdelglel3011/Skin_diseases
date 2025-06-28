class ChatMessage {
  final String senderId;
  final String text;
  final String timestamp;
  final String? imageUrl;

  ChatMessage({
    required this.senderId,
    required this.text,
    required this.timestamp,
    this.imageUrl,
  });
}
