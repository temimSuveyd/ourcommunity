class TeamModel {
  final String teamName;
  final int categoryId;
  final String teamDescription;
  final String security;
  final int builderId;

  TeamModel({
    required this.teamName,
    required this.categoryId,
    required this.teamDescription,
    required this.security,
    required this.builderId,
  });

  factory TeamModel.fromJson(Map<String, dynamic> json) {
    return TeamModel(
      teamName: json['team_name'] as String,
      categoryId: json['category_id'] as int,
      teamDescription: json['team_description'] as String,
      security: json['security'] as String,
      builderId: json['builder_id'] as int,
    );
  }
}
