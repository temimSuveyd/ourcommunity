


import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';



class Services extends GetxService{

  late SharedPreferences sharedPreferences;



  Future<Services> init()  async{
    /*await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );*/
    sharedPreferences= await   SharedPreferences.getInstance();
    return this;
  }


}


initailservieses()async{

 await Get.putAsync(() => Services().init());
}