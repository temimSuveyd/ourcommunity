import 'package:ourcommunity/core/params/event_params.dart';
import 'package:ourcommunity/data/model/event/event_model.dart';
import 'package:ourcommunity/data/model/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class EventData {
  final SupabaseClient supabase = Supabase.instance.client;

  Future<void> addEvent(EventModel dataModel) {
    return supabase.from('events').insert({
      'title': dataModel.title,
      'description': dataModel.description,
      'image_path': dataModel.photo,
      'start_date': dataModel.startDate,
      'end_date': dataModel.endDate,
      'city': dataModel.city,
      'category_id': dataModel.categoryId,
      'team_id': dataModel.teamId,
      'governorate': dataModel.governorate,
      'number_of_praticipants': dataModel.numberOfPraticipants,
      'user_id': dataModel.userId,
      'price': dataModel.price,
      'age_group': dataModel.ageGroup,
      'gender': dataModel.gender,
      'share_date': DateTime.now().toIso8601String(),
      'user_name': dataModel.userName,
      'user_photo': dataModel.userPhoto,
      'team_name': dataModel.userPhoto,
      'category_name': dataModel.categoryName,
    });
  }

  Future<void> addMemberToEvent({
    required UserModel userModel,
    required String userUid,
    required int eventId,
  }) async {
    return await supabase.from('event_members').insert({
      "profile_data": {
        'name': userModel.name,
        'email': userModel.email,
        'age': userModel.age,
        'city': userModel.city,
        'neighborhood': userModel.neighborhood,
        'photo': userModel.photo,
        'user_id': userModel.id,
      },
      'event_id': eventId,
    });
  }

  Future<void> deleteMemberFromEvent({
    required int userId,
    required int eventId,
  }) async {
    await supabase.from('event_members').delete().match({
      'event_id': eventId,
      'profile_data->>user_id': userId,
    });
  }

  Future<bool> userInEvent(int eventId, int userId) async {
    final result = await supabase
        .from("event_members")
        .select("id")
        .eq('profile_data->>user_id', userId.toString())
        .eq("event_id", eventId)
        .maybeSingle();
    return result != null;
  }

  Stream<List<Map<String, dynamic>>> getFilteredEvents(EventParams params) {
    var query = supabase.from("events").select();

    if (params.governorate != "All") {
      query = query.eq("governorate", params.governorate!);
    }
    if (params.price != "All") {
      query = query.eq("payment_type", params.price!);
    }
    if (params.ageGroup != "All") {
      query = query.eq("age_group", params.ageGroup!);
    }
    if (params.gender != "All") {
      query = query.eq("gender", params.gender!);
    }
    if (params.categoryId != 0) {
      query = query.eq("category_id", params.categoryId!);
    }
    if (params.teamId != 0) {
      query = query.eq("team_id", params.teamId!);
    }
    if (params.city != "All") {
      query = query.eq("city", params.city!);
    }
    // aktif olan faliyetler (bitme tarihinden önce)
    if (params.eventState == "Ongoing") {
      query = query.gte("end_date", params.endDate!);
    }
    // aktif olmayan faliyetler (bitme tarihinden sonra)
    if (params.eventState == "Ended") {
      query = query.lte("end_date", params.endDate!);
    }
    // aktif olan faliyetler (başlangıç tarihinden sonra)
    if (params.eventState == "Started") {
      query = query.gte("start_date", params.startDate!);
    }
    // aktif olmayan faliyetler (başlangıç tarihinden önce)
    if (params.eventState == "Unstarted") {
      query = query.lte("start_date", params.startDate!);
      query = query.gte("end_date", params.endDate!);
    }

    return Stream.fromFuture(query);
  }

  Stream<List<Map<String, dynamic>>> getAllEvents(String city) {
    return supabase
        .from("events")
        .stream(primaryKey: ["id"])
        .eq("city", city)
        .order("share_date", ascending: false);
  }
  Stream<List<Map<String, dynamic>>> getEventMembersStream(int eventId) {
    return supabase
        .from('event_members')
        .stream(primaryKey: ['id'])
        .eq('event_id', eventId);
  }


}
