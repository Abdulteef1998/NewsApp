import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/models/article_model.dart';

import '../services/news_service.dart';
import 'News_List_View.dart';

class NewsListViewbulider extends StatefulWidget {
  const NewsListViewbulider({super.key, required this.category});

  final String category;
  @override
  State<NewsListViewbulider> createState() => _NewsListViewbuliderState();
}

class _NewsListViewbuliderState extends State<NewsListViewbulider> {
  var future;
  @override
  @override
  void initState() {
    super.initState();
    future = NewsService(Dio()).getTopHeadlines(category: widget.category);
  }

  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return NewsListView(
              articles: snapshot.data!,
            );
          } else if (snapshot.hasError) {
            return const SliverToBoxAdapter(
              child: ErrorMessage(),
            );
          } else {
            return const SliverToBoxAdapter(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}

class ErrorMessage extends StatelessWidget {
  const ErrorMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('oops there was an error , please try later.');
  }
}
