import 'package:breaking_bad_series/constants/strings.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
//اول كلاس حيستقبل الداتا منها حنمشي علي ال ريبو اللي حياخد اوبجكت من هنا
class CharactersWebServices {
  //this for create object from dio
  Dio? dio;

  //لا استطيع اعطاء قيمة مباشرة للديو لانها تحتاج object from BaseOptions
  //هنا جهزت ال api بتاعي عشان استدعيهو لما اجي افعل ال ديو
  CharactersWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      receiveTimeout: 20 * 1000, //20 second
      connectTimeout: 20 * 1000,
    );
    //Now i Initial the dio
    //and dio need options
    dio = Dio(options);
  }

//عايز اعمل اول دالة تجيب كل الممثلين = GET DATA
//طالما حتجيب داتا اذا النوع حيكون future وطالما هي داتا جايه من النت حتكون عبارة عن لسته
  Future<List<dynamic>> getAllCharacters() async {
    try {
      Response response = await dio!.get('characters');
      if (kDebugMode) {
        print(response.data.toString());
      }
      return response.data;
    } catch (error) {
      if (kDebugMode) {
        print(error.toString());
      }
      return [];
    }
  }
  //for get  characters quote
  Future<List<dynamic>> getAllCharactersQuotes(String charName) async {
    try {
      Response response = await dio!.get('quote',queryParameters: {'author':charName },);
      if (kDebugMode) {
        print(response.data.toString());
      }
      return response.data;
    } catch (error) {
      if (kDebugMode) {
        print(error.toString());
      }
      return [];
    }
  }
}
