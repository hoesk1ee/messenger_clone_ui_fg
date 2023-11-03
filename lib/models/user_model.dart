class UserModel {
  final String name;
  final String picUrl;
  final String lastOnline;
  final bool isRead;
  bool isOnline;
  final List<String> myChat;
  final List<String> userChat;
  final String lastSent;

  UserModel({
    required this.userChat,
    required this.name,
    required this.myChat,
    required this.lastSent,
    required this.picUrl,
    required this.lastOnline,
    required this.isOnline,
    required this.isRead,
  });
}
