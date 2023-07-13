import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/modules/business/business_screen.dart';
import 'package:newsapp/shared/bloc/cubit.dart';
import 'package:newsapp/shared/bloc/states.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=> NewsAppCubit(),
      child: BlocConsumer<NewsAppCubit, NewsAppStates>(
        listener: (context, state){},
        builder: (context, state)
        {
          var cubit = NewsAppCubit.get(context);

          return Scaffold(
            appBar: AppBar(
              title: const Text("News App"),
              actions:
              [
                IconButton(
                    onPressed: ()
                    {

                    },
                    icon: Icon(
                      Icons.search
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
      ),
    );
  }
}
