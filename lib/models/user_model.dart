class UserModel {
  final String name;
  final String picUrl;
  final String lastOnline;
  final bool isRead;
  bool isOnline;
  final List<String> chat;
  final String lastSent;

  UserModel({
    required this.name,
    required this.chat,
    required this.lastSent,
    required this.picUrl,
    required this.lastOnline,
    required this.isOnline,
    required this.isRead,
  });
}
