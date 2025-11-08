class TeamParams {
  int? teamId = 0;
  int? userId = 0;
  DateTime? joinedAt = DateTime.now();
  String? role = '';
  String? userPhoto = '';
  String? userName = '';

  TeamParams(
      {this.joinedAt,
      this.role,
      this.teamId,
      this.userId,
      this.userName,
      this.userPhoto});

  TeamParams copyWith({
    int? teamId,
    int? userId,
    DateTime? joinedAt,
    String? role,
    String? userPhoto,
    String? userName,
  }) {
    return TeamParams(
      teamId: teamId ?? this.teamId,
      userId: userId ?? this.userId,
      joinedAt: joinedAt ?? this.joinedAt,
      role: role ?? this.role,
      userName: userName ?? this.userName,
      userPhoto: userPhoto ?? this.userPhoto,
    );
  }
}
