import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/cubit/cubit.dart';
import 'package:news/cubit/states.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..getBusinessData(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text('News'),
              actions: [
                IconButton(onPressed: () {},
                  icon: const Icon(Icons.search,),),
                IconButton(onPressed:()
                {
                 // AppCubit.get(context).changeThemeMode();
                },
                  icon: const Icon(Icons.brightness_4_outlined,),)
              ],
            ),
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeIndex(index);
              },
              elevation: 0,
              type: BottomNavigationBarType.fixed,
              items: cubit.bottomItems,
            ),
          );
        },

      ),
    );
  }
}
