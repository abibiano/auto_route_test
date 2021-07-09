import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'main.gr.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'AutoRoute Demo',
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}

@MaterialAutoRouter(
  routes: [
    MaterialRoute(page: HomePage, initial: true),
    MaterialRoute(page: SecondPage),
  ],
)
class $AppRouter {}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final myList = List<String>.generate(30, (index) => 'Item $index');
  String lastItem = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: ListView.builder(
        itemCount: myList.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            context.router.push(
              SecondPageRoute(
                item: myList[index],
                onButtonPressed: itemPressed,
              ),
            );
          },
          child: Card(
            child: ListTile(
              title: Text(
                myList[index],
                style: TextStyle(
                  color: myList[index] == lastItem ? Colors.red : Colors.black,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void itemPressed(String item) {
    setState(() {
      lastItem = item;
    });
  }
}

class SecondPage extends StatelessWidget {
  final String item;
  final void Function(String item) onButtonPressed;

  const SecondPage(
      {Key? key, required this.item, required this.onButtonPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
        child: TextButton(
          child: Text('Pop and change last item to $item'),
          onPressed: () {
            onButtonPressed(item);
            context.router.pop();
          },
        ),
      ),
    );
  }
}
