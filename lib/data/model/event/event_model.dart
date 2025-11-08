class EventModel {
  String? title;
  String? description;
  String? photo;
  String? startDate;
  String? endDate;
  String? city;
  String? governorate;
  int? price;
  String? ageGroup;
  String? gender;
  String? userName;
  String? userPhoto;
  String? teamName;
  String? categoryName;
  String? paymetState;
  DateTime? sharedDate;
  int? userId;
  int? categoryId;
  int? teamId;
  int? numberOfPraticipants;
  int? id;
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
    required this.price,
    required this.ageGroup,
    required this.gender,
    this.id,
    required this.categoryName,
    required this.teamName,
    required this.userName,
    required this.userPhoto,
    required this.paymetState,
    required this.sharedDate,
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
      price: json['price'] as int?,
      ageGroup: json['age_group'] as String?,
      gender: json['gender'] as String?,
      id: json['id'] as int?,
      categoryName: json['category_name'] as String?,
      teamName: json['team_name'] as String?,
      userName: json['user_name'] as String?,
      userPhoto: json['user_photo'] as String?,
      paymetState: json['payment_type'] as String?,
      sharedDate: json['shared_date'] as DateTime?,
    );
  }
}
