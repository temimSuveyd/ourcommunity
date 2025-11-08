import 'package:ourcommunity/core/params/favorite_events_prams.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class FavoriteEventsData {
  SupabaseClient supabase = Supabase.instance.client;

  Future<void> addEventToFavorite(FavoriteEventsPrams params) {
    return supabase
        .from("favorites_events")
        .select()
        .eq("user_id", params.userId!)
        .eq("event_id", params.eventId!)
        .maybeSingle()
        .then((existing) async {
      if (existing != null) {
        return;
      }
      await supabase.from("favorites_events").insert({
        "user_id": params.userId,
        "event_id": params.eventId,
      });
    });
  }
  Future<void> deleteEventFromFavorite(FavoriteEventsPrams params) async {
    await supabase
        .from("favorites_events")
        .delete()
        .eq("user_id", params.userId!)
        .eq("event_id", params.eventId!);
  }

  Stream<List<int>> getAllFavoriteEventsIdAsStream({required int userId}) {
    return supabase
        .from("favorites_events")
        .stream(primaryKey: ["id"])
        .eq("user_id", userId)
        .map((list) =>
            list.map<int>((item) => item["event_id"] as int).toList());
    // .order("share_date", ascending: false);
  }
    Future<bool> isEventFavorited({required int userId, required int eventId}) async {
      final result = await supabase
          .from("favorites_events")
          .select("id")
          .eq("user_id", userId)
          .eq("event_id", eventId)
          .maybeSingle();
      return result != null;
    }
    Future<List<int>> getAllFavoriteEventsId(int userId) {
    return supabase
        .from("favorites_events")
        .select("event_id")
        .eq("user_id", userId)
        .then((list) => (list as List<dynamic>)
            .map<int>((item) => item["event_id"] as int)
            .toList());
  }


  Stream<List<Map<String, dynamic>>> getAllFavoriteEvents(
      List<int> favoritesList) {
    return supabase
        .from("events")
        .stream(primaryKey: ["id"]).inFilter('id', favoritesList);
    // .order("share_date", ascending: false);
  }
}
