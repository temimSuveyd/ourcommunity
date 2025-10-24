import 'package:supabase_flutter/supabase_flutter.dart';

class TeamData {
  final SupabaseClient supabase = Supabase.instance.client;

  Future<void> addTeam({
    required String teamName,
    required int categoryId,
    required String teamDescription,
    required String security,
    required int builderId,
  }) async {
    await supabase.from('teams').insert({
      'team_name': teamName,
      'category_id': categoryId,
      'team_description': teamDescription,
      'security': security,
      'builder_id': builderId,
    });
  }

  Future<List<Map<String, dynamic>>> getTeamsByBuilderId(int builderId) async {
    final response =
        await supabase.from('teams').select('*').eq('builder_id', builderId);

    return response.map((e) => e).toList();
  }
}
