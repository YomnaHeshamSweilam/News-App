import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/cubit/states.dart';

import '../cubit/cubit.dart';
import '../shared/components.dart';

class ScienceScreen extends StatelessWidget {
  const ScienceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state){} ,
      builder: (context, state){
        var list =AppCubit.get(context).science;
        return articleBuilder(list);
      } ,
    );
  }
}
