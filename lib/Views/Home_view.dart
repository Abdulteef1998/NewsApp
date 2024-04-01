import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/widgets/Categories_List_View.dart';
import '../widgets/news_list_view_builder.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: const Color(0xfff2C3638),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        //backgroundColor: const Color(0xfff2C3638),
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'News',
              style: TextStyle(color: Colors.white),
            ),
            Text(
              'Cloud',
              style: TextStyle(color: Colors.orange),
            )
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const HomeView()),
              );
            },
          ),
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: CategoriesListView(),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 32,
              ),
            ),
            NewsListViewbulider(
              category: 'general',
            ),
          ],
        ),
      ),
    );
  }
}
