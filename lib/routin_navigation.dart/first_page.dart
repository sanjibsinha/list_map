import 'package:flutter/material.dart';
import 'package:list_map/routin_navigation.dart/dunny.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Routing test',
      debugShowCheckedModeBanner: false,
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
        children: DUMMY.map(
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

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    title = arguments['title'];
    color = arguments['color'];
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        alignment: Alignment.center,
        height: 300.0,
        width: 300.0,
        margin: const EdgeInsets.all(20.0),
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: color,
          border: Border.all(
            color: Colors.black26,
            width: 10.0,
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
            color: Colors.black38,
          ),
        ),
      ),
    );
  }
}
