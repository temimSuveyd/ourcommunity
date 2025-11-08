import 'package:ourcommunity/core/params/team_params.dart';
import 'package:ourcommunity/data/model/team/team_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class TeamData {
  final SupabaseClient supabase = Supabase.instance.client;

  Future<int> addTeam({required TeamModel teamModel}) async {
    final response = await supabase.from('teams').insert({
      'team_name': teamModel.teamName,
      'category_id': teamModel.categoryId,
      'team_description': teamModel.teamDescription,
      'security': teamModel.security,
      'builder_id': teamModel.builderId,
      'builder_name': teamModel.builderName,
      'category_name': teamModel.categoryName,
      'team_logo': teamModel.teamLogo,
    }).select('id');

    return response.first['id'] as int;
  }

  Future<void> updateTeamInfo({
    required TeamModel teamModel,
  }) async {
    await supabase.from('teams').update({
      'team_name': teamModel.teamName,
      'team_description': teamModel.teamDescription,
      'team_logo': teamModel.teamLogo,
    }).eq('id', teamModel.teamId!);
  }

  Future<void> addMemberToTeam(TeamParams params) async {
    await Supabase.instance.client.from('team_members').insert({
      'team_id': params.teamId,
      'user_id': params.userId,
      'user_role': params.role,
      'user_name': params.userName,
      'user_photo': params.userPhoto,
      'joined_at': params.joinedAt!.toIso8601String(),
    });
  }

  Future<List<Map<String, dynamic>>> getTeamsByBuilderId(int builderId) async {
    final response =
        await supabase.from('teams').select('*').eq('builder_id', builderId);

    return response.map((e) => e).toList();
  }

  Future<List<Map<String, dynamic>>> getTeams(int userId) async {
    final response = await supabase
        .from('team_members')
        .select('team_id, teams(*)')
        .eq('user_id', userId);
    final uniqueTeams = <int, Map<String, dynamic>>{};
    for (var item in response) {
      final team = item['teams'];
      if (team != null && team['id'] != null) {
        uniqueTeams[team['id']] = item;
      }
    }
    return uniqueTeams.values.toList();
  }

  Stream<List<Map<String, dynamic>>> getMembers(int teamId) {
    final response = supabase
        .from('team_members')
        .stream(primaryKey: ['id']).eq('team_id', teamId);

    return response;
  }

  Stream<List<int>> getMembersId(int teamId) {
    return supabase
        .from("team_members")
        .stream(primaryKey: ['id'])
        .eq('team_id', teamId)
        .map(
            (list) => list.map<int>((item) => item['user_id'] as int).toList());
  }

  Future<void> deleteTeam(int teamId) async {
    await supabase.from('team_members').delete().eq('team_id', teamId);
    await supabase.from('teams').delete().eq('id', teamId);
  }
}
