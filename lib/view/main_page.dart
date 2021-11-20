import 'package:articles_app/config/config.dart';
import 'package:articles_app/cubit/articles_cubit.dart';
import 'package:articles_app/model/articles_response.dart';
import 'package:articles_app/view/detail_page.dart';
import 'package:articles_app/widget/articles_row_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late ArticlesCubit _cubit;

  @override
  void initState() {
    super.initState();

    _cubit = BlocProvider.of<ArticlesCubit>(context);
    _cubit.loadArticles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.7,
          backgroundColor: Colors.white,
          title: Image.asset(
            'assets/images/logo.png',
            alignment: Alignment.center,
            width: 200,
            height: 100,
            fit: BoxFit.contain,
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 1,
                    color: Colors.black26,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      'LATEST NEWS',
                      style: AppTheme.headlineText,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 1,
                    color: Colors.black26,
                  ),
                ],
              ),
            ),
            bloc(),
          ],
        ));
  }

  bloc() {
    return BlocBuilder<ArticlesCubit, ArticlesState>(builder: (context, state) {
      if (state is ArticlesLoaded) {
        return body(state.response);
      } else if (state is ArticlesFail) {
        return Text(state.error);
      }

      return const Center(child: CircularProgressIndicator());
    });
  }

  body(List<ArticlesResponse> data) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.68,
      child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailPage(
                              article: data[index],
                            )));
              },
              child: ArticlesRowWidget(
                  imageUrl: data[index].contentThumbnail,
                  title: data[index].title,
                  subtitle: data[index].contributorName,
                  created: data[index].createdAt),
            );
          }),
    );
  }
}
