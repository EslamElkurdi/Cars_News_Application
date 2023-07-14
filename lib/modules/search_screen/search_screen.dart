import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/shared/bloc/states.dart';

import '../../shared/bloc/cubit.dart';
import '../../shared/components/components.dart';


class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var searchController = TextEditingController();

    return BlocConsumer<NewsAppCubit, NewsAppStates>(
      listener: (context, state){},
      builder: (context, state)
      {
        var article = NewsAppCubit.get(context).search;

        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children:
            [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaultFormField(
                  controller: searchController,
                  type: TextInputType.text,
                  validate: (String? value)
                  {
                    if(value!.isEmpty){
                      return 'search must not be empty';
                    }
                    return null;
                  },
                  label: 'Search',
                  prefIcon: Icons.search,
                  onChange: (value)
                  {
                    NewsAppCubit.get(context).getSearch(value);
                  },
                ),
              ),
              Expanded(child: articleBuilder(article, context))
            ],
          ),
        );
      },
    );
  }
}
