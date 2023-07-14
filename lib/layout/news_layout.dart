import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/modules/business/business_screen.dart';
import 'package:newsapp/shared/bloc/cubit.dart';
import 'package:newsapp/shared/bloc/states.dart';
import 'package:newsapp/shared/network/remote/dio.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsAppCubit, NewsAppStates>(
      listener: (context, state){},
      builder: (context, state)
      {
        var cubit = NewsAppCubit.get(context);
        //q=tesla&from=2023-06-13&sortBy=publishedAt&apiKey=c4c9f4ddc89d4c6da21f8337ae191838
        return Scaffold(
          appBar: AppBar(
            title: const Text("Cars News App"),
            actions:
            [
              IconButton(
                  onPressed: ()
                  {

                  },
                  icon: Icon(
                    Icons.search
                  )
              ),
              IconButton(
                  onPressed: ()
                  {
                      NewsAppCubit.get(context).changeAppMode();
                  },
                  icon: Icon(
                      Icons.dark_mode_outlined
                  )
              )
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index)
            {
              cubit.changeBottomNavBar(index);
            },
            items: cubit.bottomNavBarItems,
          ),

        );
      },
    );
  }
}
