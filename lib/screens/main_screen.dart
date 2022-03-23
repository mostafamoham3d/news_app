import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/screens/settings_screen.dart';
import 'package:news_app/services/cubit.dart';
import 'package:news_app/services/states.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsAppStates>(
      listener: (context, states) {},
      builder: (context, states) {
        NewsCubit cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () {
                  cubit.changeTheme();
                  //print(cubit.isDark.toString());
                },
                icon: cubit.isDark
                    ? Icon(Icons.wb_sunny)
                    : Icon(Icons.brightness_2_sharp),
                color: Theme.of(context).iconTheme.color,
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => SettingsScreen()));
                },
                icon: Icon(Icons.search),
                color: Theme.of(context).iconTheme.color,
              ),
            ],
            title: Text(
              'News App',
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.bottomNavItems,
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeScreen(index);
            },
          ),
          body: cubit.screens[cubit.currentIndex],
        );
      },
    );
  }
}
