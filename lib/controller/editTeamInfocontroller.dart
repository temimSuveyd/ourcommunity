import 'package:get/get.dart';

class Editteaminfocontroller extends GetxController {
  var teamName = "قراء الدسمة".obs;
  var teamDescription = "نادي كتاب لمناقشة الروايات والكتب.".obs;
  var teamRules = "قراءة الكتاب المحدد قبل الجلسة".obs;

  void updateTeamInfo({String? name, String? desc, String? rules}) {
    if (name != null) teamName.value = name;
    if (desc != null) teamDescription.value = desc;
    if (rules != null) teamRules.value = rules;
  }
}