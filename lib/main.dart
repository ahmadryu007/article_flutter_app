import 'package:articles_app/cubit/articles_cubit.dart';
import 'package:articles_app/repository/articles_repository.dart';
import 'package:articles_app/view/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<ArticlesCubit>(
        create: (context) => ArticlesCubit(repository: ArticlesRepository()),
        child: const MainPage(),
      ),
    );
  }
}
