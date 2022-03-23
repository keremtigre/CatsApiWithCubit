import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_cats_app/view/cats_repository.dart';
import 'package:random_cats_app/view/cubit/cats_cubit.dart';
import 'package:random_cats_app/view/show_cats_body.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CatsCubit(SampleCatsRepository()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ShowCatsBody(),
      ),
    );
  }
}
