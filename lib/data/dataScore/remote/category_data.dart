import 'package:supabase_flutter/supabase_flutter.dart';

class CategoryDate {
  final SupabaseClient supabase = Supabase.instance.client;

  Future<List<Map<String, dynamic>>> getCategories() async {
    final response = await supabase
        .from('categories')
        .select('id, category_name') // veya 'id, name_en' ihtiyacına göre
        .order('id', ascending: true); // opsiyonel: sıralama

    return response.map((e) => e).toList();
  }
}
