import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/shared/bloc/cubit.dart';
import 'package:newsapp/shared/bloc/states.dart';
import 'package:newsapp/shared/components/components.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsAppCubit, NewsAppStates>(
        builder: (context , state){
          var article = NewsAppCubit.get(context).business;

          return articleBuilder(article, context);
        },
        listener: (context , state){}
    );
  }
}
