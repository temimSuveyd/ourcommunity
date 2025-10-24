import 'package:supabase_flutter/supabase_flutter.dart';

class UserData {
  final SupabaseClient supabase = Supabase.instance.client;

  Future<List<Map<String, dynamic>>> getUserDataById(String userId) async {
    final response = await supabase
        .from('users')
        .select()
        .eq('profile_data->>user_id', userId);

    return response.map((e) => e).toList();
  }
}
