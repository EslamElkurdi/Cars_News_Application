import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:newsapp/modules/business/business_screen.dart';
import 'package:newsapp/shared/bloc/cubit.dart';
import 'package:newsapp/shared/bloc/states.dart';
import 'package:newsapp/shared/constants/bloc_observer.dart';
import 'package:newsapp/shared/network/local/cach_helper.dart';
import 'package:newsapp/shared/network/remote/dio.dart';

import 'layout/news_layout.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();

  await CacheHelper.init();
  DioHelper.init();

  bool? isDark = CacheHelper.getData(key: 'isDark');

  runApp(MyApp(isDark));
}

class MyApp extends StatelessWidget {


  final bool? isDark;
  MyApp(this.isDark);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:  (context)=> NewsAppCubit()..getBusinessData()..getSportsData()..getScienceData()..changeAppMode(
        fromShared: isDark
      ),
      child: BlocConsumer<NewsAppCubit, NewsAppStates>(
          listener:(context, state){},
          builder: (context, state){
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(
                  textTheme: TextTheme(

                      bodyText1: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600
                      )
                  ),
                  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                    type: BottomNavigationBarType.fixed,
                  ),
                  scaffoldBackgroundColor: Colors.white,
                  appBarTheme: const AppBarTheme(
                    titleSpacing: 20,
                    titleTextStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    iconTheme: IconThemeData(
                      color: Colors.black,
                    ),
                    color: Colors.white,
                    elevation: 0.0,
                    backwardsCompatibility: false,
                    systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.white,
                      statusBarIconBrightness: Brightness.dark,
                    ),
                  )
              ),

              darkTheme: ThemeData(
                  bottomNavigationBarTheme: BottomNavigationBarThemeData(
                      type: BottomNavigationBarType.fixed,
                      backgroundColor: HexColor('333739'),
                      unselectedItemColor: Colors.grey
                  ),
                  scaffoldBackgroundColor: HexColor('333739'),
                  appBarTheme: AppBarTheme(
                    titleSpacing: 20,
                    backgroundColor: HexColor('333739'),
                    titleTextStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    iconTheme: IconThemeData(
                      color: Colors.white,
                    ),
                    // color: Colors.white,
                    elevation: 0.0,
                    backwardsCompatibility: false,
                    systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: HexColor('333739'),
                      statusBarIconBrightness: Brightness.light,
                    ),
                  ),
                  textTheme: TextTheme(
                      bodyText1: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600
                      )
                  )
              ),

              themeMode: NewsAppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,

              home: const Directionality(
                textDirection: TextDirection.ltr,
                child: NewsLayout(),
              ),
            );
          },

      ),
    );
  }
}


