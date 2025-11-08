import 'package:ourcommunity/data/model/membership_requests/membership_requests_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MembershipRequestsData {
  SupabaseClient supabase = Supabase.instance.client;

  Future<void> addGroupRequest(
      {required GroupRequestModel groupRequestModel}) async {
    // Check if a similar request (same sender, same team, same request_to) already exists and is not 'accepted' or 'rejected'
    final existingRequests =
        await supabase.from('membership_requests').select().match({
      'sender_data->>id': groupRequestModel.senderModel!.id.toString(),
      'team_data->>team_id': groupRequestModel.teamModel!.teamId.toString(),
      'requset_to_data->>id': groupRequestModel.requestToModel!.id.toString(),
    }).not('requeste_status', 'in', ['accepted', 'rejected']);

    if (existingRequests.isNotEmpty) {
      return;
    }
    return await supabase.from('membership_requests').insert({
      'requset_to_data': {
        'id': groupRequestModel.requestToModel!.id,
        'name': groupRequestModel.requestToModel!.name,
        'photo': groupRequestModel.requestToModel!.photo,
        'email': groupRequestModel.requestToModel!.email,
        'city': groupRequestModel.requestToModel!.city,
        'neighborhood': groupRequestModel.requestToModel!.neighborhood,
        'age': groupRequestModel.requestToModel!.age,
      },
      'sender_data': {
        'id': groupRequestModel.senderModel!.id,
        'name': groupRequestModel.senderModel!.name,
        'photo': groupRequestModel.senderModel!.photo,
        'email': groupRequestModel.senderModel!.email,
        'city': groupRequestModel.senderModel!.city,
        'neighborhood': groupRequestModel.senderModel!.neighborhood,
        'age': groupRequestModel.senderModel!.age,
      },
      'team_data': {
        'team_name': groupRequestModel.teamModel!.teamName,
        'category_id': groupRequestModel.teamModel!.categoryId,
        'team_description': groupRequestModel.teamModel!.teamDescription,
        'security': groupRequestModel.teamModel!.security,
        'builder_id': groupRequestModel.teamModel!.builderId,
        'category_name': groupRequestModel.teamModel!.categoryName,
        'builder_name': groupRequestModel.teamModel!.builderName,
        'team_logo': groupRequestModel.teamModel!.teamLogo,
        'team_id': groupRequestModel.teamModel!.teamId,
      },
      'requeste_status': groupRequestModel.requesteStatus,
    });
  }

  Future<void> updateRequestStatus({
    required int requestId,
    required String newStatus,
  }) async {
    await supabase.from('membership_requests').update({
      'requeste_status': newStatus,
    }).eq('id', requestId);
  }

  Stream<List<Map<String, dynamic>>> getRequestsByRequestToId(int targetId) {
    return supabase
        .from('membership_requests')
        .stream(primaryKey: ['id']).map((rows) => rows.where((row) {
              final requestId = row['requset_to_data']?['id'];
              final senderId = row['sender_data']?['id'];
              return requestId == targetId || senderId == targetId;
            }).toList());
  }
}
