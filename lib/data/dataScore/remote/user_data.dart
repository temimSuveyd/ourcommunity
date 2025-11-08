import 'package:ourcommunity/data/model/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserData {
  final SupabaseClient supabase = Supabase.instance.client;

  Future<void> addUSer(
      {required UserModel userModel, required String userUid}) async {
    return await supabase.from('users').insert({
      "profile_data": {
        'name': userModel.name,
        'email': userModel.email,
        'age': userModel.age,
        'city': userModel.city,
        'neighborhood': userModel.neighborhood,
        'photo': userModel.photo,
        'user_id': userUid,
      },
    });
  }
  Future<void> updateUserData({
    required UserModel userModel,
    required String userUid,
  }) async {
    await supabase.from('users').update({
      "profile_data": {
       'name': userModel.name,
        'email': userModel.email,
        'age': userModel.age,
        'city': userModel.city,
        'neighborhood': userModel.neighborhood,
        'photo': userModel.photo,
        'user_id':  userUid,
      },
    }).eq('id', userModel.id!);
  }

  Future<List<Map<String, dynamic>>> getUserDataByuid(String userId) async {
    final response = await supabase
        .from('users')
        .select()
        .eq('profile_data->>user_id', userId);

    return response.map((e) => e).toList();
  }

  Future<List<Map<String, dynamic>>> getUserDataByid(int id) async {
    final response = await supabase.from('users').select().eq('id', id);

    return response.map((e) => e).toList();
  }

  Stream<List<Map<String, dynamic>>> getAllUser() {
    return supabase.from('users').stream(primaryKey: ['id']);
  }
}
