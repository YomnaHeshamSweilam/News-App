import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/cubit/cubit.dart';
import 'package:news/cubit/states.dart';
import 'package:news/network/local/cache_helper.dart';
import 'package:news/network/local/themes.dart';
import 'package:news/network/remote/dio_helper.dart';

import 'bloc_observer.dart';
import 'home_layout/news_layout.dart';


Future<void> main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context , state){},
        builder: (context , state){
          return  MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightMode,
            darkTheme :AppTheme.darkMode,
            themeMode: ThemeMode.light,
            home:  NewsLayout(),
          );
        } ,
      ),
    );
  }
}

