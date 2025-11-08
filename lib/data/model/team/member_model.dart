class MemberModel {
  String? userName;
  String? userRole;
  String? userPhoto;
  String? joinedAt;
  MemberModel(
      {required this.userName,
      required this.userPhoto,
      required this.userRole,
      required this.joinedAt});

  factory MemberModel.fromJson(Map<String, dynamic> json) {
    return MemberModel(
      userName: json['user_name'] as String,
      userPhoto: json['user_photo'] as String,
      userRole: json['user_role'] as String,
      joinedAt: json['joined_at'] as String,
    );
  }
}
