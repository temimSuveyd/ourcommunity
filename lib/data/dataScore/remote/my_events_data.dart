import 'package:supabase_flutter/supabase_flutter.dart';

class MyEventsData {
  SupabaseClient supabase = Supabase.instance.client;

  Stream<List<Map<String, dynamic>>> getMyEvents(int userId) {
    return supabase
        .from("events")
        .stream(primaryKey: ["id"]).eq('user_id', userId);
  }
}
