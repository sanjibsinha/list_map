import 'package:flutter/material.dart';
import 'package:list_map/routin_navigation.dart/dummy_books.dart';
import 'package:list_map/routin_navigation.dart/dummy_categories.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Routing test',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      initialRoute: '/',
      routes: {
        '/': (context) => FirstPageBody(),
        '/categories': (context) => SecondPage(),
      },
    );
  }
}

class FirstPageBody extends StatelessWidget {
  const FirstPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Page'),
      ),
      body: GridView(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          crossAxisSpacing: 20.0,
          mainAxisSpacing: 20.0,
        ),
        children: DUMMY_CATEGORIES.map(
          (e) {
            return AllCategories(
              id: e.id,
              title: e.title,
              color: e.color,
            );
          },
        ).toList(),
      ),
    );
  }
}

class AllCategories extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  const AllCategories({
    Key? key,
    required this.id,
    required this.title,
    required this.color,
  }) : super(key: key);

  void selectCategory(BuildContext context) {
    Navigator.pushNamed(
      context,
      '/categories',
      arguments: {
        'id': id,
        'title': title,
        'color': color,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        selectCategory(context);
      },
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(
          10.0,
        ),
        margin: const EdgeInsets.all(
          10.0,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.1),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  SecondPage({Key? key}) : super(key: key);

  var title;
  var color;
  var id;

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    final id = arguments['id'];
    final title = arguments['title'];
    final color = arguments['color'];
    final categoryBooks = DUMMY_BOOKS.where((book) {
      return book.categories.contains(id);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: color,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                margin: const EdgeInsets.all(5.0),
                padding: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      color.withOpacity(0.1),
                      color,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Text(
                  categoryBooks[index].title,
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Container(
                margin: const EdgeInsets.all(5.0),
                padding: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      color.withOpacity(0.3),
                      Colors.yellowAccent,
                    ],
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft,
                  ),
                ),
                child: Text(
                  categoryBooks[index].detail,
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
            ],
          );
        },
        itemCount: categoryBooks.length,
      ),
    );
  }
}
