import 'package:ourcommunity/data/model/team/team_model.dart';
import 'package:ourcommunity/data/model/user_model.dart';

class GroupRequestModel {
  String? requesteStatus = '';
  TeamModel? teamModel = TeamModel();
  UserModel? senderModel = UserModel();
  UserModel? requestToModel = UserModel();
  int? id;
  GroupRequestModel({
    this.requesteStatus,
    this.teamModel,
    this.requestToModel,
    this.senderModel,
    this.id,
  });

  factory GroupRequestModel.fromMap(Map<String, dynamic> map) {
    return GroupRequestModel(
      requesteStatus: map['requeste_status'],
      teamModel: map['team_data'] != null
          ? TeamModel.fromJson(map['team_data'])
          : TeamModel(),
      requestToModel:
          UserModel.fromMap(map['requset_to_data'], 'requset_to_data'),
      senderModel: UserModel.fromMap(map['sender_data'], 'ender_data'),
      id: map['id'],
    );
  }

  GroupRequestModel copyWith({
    String? requesteStatus,
    TeamModel? teamModel,
    UserModel? senderModel,
    UserModel? requestToModel,
    int? id,
  }) {
    return GroupRequestModel(
        requesteStatus: requesteStatus ?? this.requesteStatus,
        teamModel: teamModel ?? this.teamModel,
        requestToModel: requestToModel ?? this.requestToModel,
        senderModel: senderModel ?? this.senderModel,
        id: id ?? this.id);
  }
}
