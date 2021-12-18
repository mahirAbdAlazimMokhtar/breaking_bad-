import 'package:breaking_bad_series/app_routes.dart';
import 'package:flutter/material.dart';
void main() {
  runApp( BreakingBadApp(appRoutes: AppRoutes(),));
}

class BreakingBadApp extends StatelessWidget {

  final AppRoutes appRoutes;

   const BreakingBadApp({Key? key,required this.appRoutes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      //تستخدم للانتقال بين الشاشات
      onGenerateRoute:appRoutes.generateRoute ,
    );
  }
}
