



import 'User.dart';

class Post {
  int? id;
  String? title;
  String? image;
  String? content;
  User? user;

  DateTime? createdAt;

  Post({this.id, this.title,this.image, this.content, this.user, this.createdAt});
}