class EventModel {
  String? title;
  String? description;
  String? photo;
  String? startDate;
  String? endDate;
  String? city;
  int? categoryId;
  int? teamId;
  String? governorate;
  int? userId;
  int? numberOfPraticipants;
  String? price;      // added, default/nullable
  String? ageGroup;   // added, default/nullable
  String? gender;     // added, default/nullable
  EventModel({
    required this.title,
    required this.description,
    required this.photo,
    required this.startDate,
    required this.endDate,
    required this.city,
    required this.categoryId,
    required this.teamId,
    required this.governorate,
    required this.numberOfPraticipants,
    required this.userId,
    this.price,
    this.ageGroup,
    this.gender,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      title: json['title'] as String?,
      description: json['description'] as String?,
      photo: json['image_path'] as String?,
      startDate: json['start_date']?.toString(),
      endDate: json['end_date']?.toString(),
      city: json['city'] as String?,
      categoryId: json['category_id'] as int?,
      teamId: json['team_id'] as int?,
      governorate: json['governorate'] as String?,
      numberOfPraticipants: json['number_of_praticipants'] is int
          ? json['number_of_praticipants']
          : int.tryParse(json['number_of_praticipants']?.toString() ?? ''),
      userId: json['user_id'] as int?,
      price: json['price'] as String?,         // nullable, no default
      ageGroup: json['age_group'] as String?,  // nullable, no default
      gender: json['gender'] as String?,       // nullable, no default
    );
  }
}
