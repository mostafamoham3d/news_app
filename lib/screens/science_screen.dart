import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/reusable_components.dart';
import 'package:news_app/services/cubit.dart';
import 'package:news_app/services/states.dart';

class ScienceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        List list = NewsCubit.get(context).science;
        return list.length > 0
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
            : Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }
}
