class TeamModel {
  String? teamName = '';
  String? categoryName = '';
  int? categoryId = 0;
  int? teamId = 0;
  String? teamDescription = '';
  String? security = '';
  int? builderId = 0;
  String? builderName = '';
  String? teamLogo = '';

  TeamModel({
    this.teamName,
    this.categoryId,
    this.teamDescription,
    this.security,
    this.builderId,
    this.categoryName,
    this.builderName,
    this.teamLogo,
    this.teamId,
  });

  factory TeamModel.fromJson(Map<String, dynamic> json) {
    if (json['teams'] != null) {
      return TeamModel(
        teamName: json['teams']['team_name'] as String,
        categoryId: json['teams']['category_id'] as int,
        teamDescription: json['teams']['team_description'] as String,
        security: json['teams']['security']  ?? '',
        builderId: json['teams']['builder_id'] as int,
        categoryName: json['teams']['category_name'] as String,
        builderName: json['teams']['builder_name'] as String,
        teamLogo: json['teams']['team_logo'] as String,
        teamId: json['team_id'] as int,
      );
    } else {
      return TeamModel(
        teamName: json['team_name'] as String,
        categoryId: json['category_id'] ?? 0,
        teamDescription: json['team_description'] as String,
        security: json['security'] as String,
        builderId: json['builder_id'] as int,
        categoryName: json['category_name'] as String,
        builderName: json['builder_name'] as String,
        teamLogo: json['team_logo'] as String,
        teamId: json['team_id'] as int,
      );
    }
  }

  TeamModel copyWith({
    String? teamName,
    int? categoryId,
    String? teamDescription,
    String? security,
    int? builderId,
    String? categoryName,
    String? builderName,
    String? teamLogo,
    int? teamId,
  }) {
    return TeamModel(
      teamName: teamName ?? this.teamName,
      categoryId: categoryId ?? this.categoryId,
      teamDescription: teamDescription ?? this.teamDescription,
      security: security ?? this.security,
      builderId: builderId ?? this.builderId,
      categoryName: categoryName ?? this.categoryName,
      builderName: builderName ?? this.builderName,
      teamLogo: teamLogo ?? this.teamLogo,
      teamId: teamId ?? this.teamId,
    );
  }
}
