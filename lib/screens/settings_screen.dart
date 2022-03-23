import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/reusable_components.dart';
import 'package:news_app/services/cubit.dart';
import 'package:news_app/services/states.dart';

TextEditingController textEditingController = TextEditingController();

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List list = [];
    return BlocConsumer<NewsCubit, NewsAppStates>(
      listener: (context, states) {},
      builder: (context, states) {
        list = NewsCubit.get(context).search;
        NewsCubit cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: customTextFormField(
                  onChanged: (value) {
                    cubit.getSSearchedNews(value);
                  },
                  controller: textEditingController,
                  function: (String? value) {
                    if (value!.isEmpty) {
                      return 'Search Field cant be empty';
                    } else
                      return null;
                  },
                  label: 'Search',
                  prefixIcon: Icons.search,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Expanded(
                child: list.length > 0
                    ? ListView.builder(
                        itemCount: list.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              buildNewsItem(list[index], context),
                              SizedBox(
                                height: 8,
                              ),
                              Divider(
                                thickness: 2,
                              ),
                            ],
                          );
                        },
                      )
                    : Container(),
              ),
            ],
          ),
        );
      },
    );
  }
}
