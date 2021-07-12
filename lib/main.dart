import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'main.gr.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
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

final lastItemProvider = StateProvider<String>((ref) => '');

class HomePage extends ConsumerWidget {
  final myList = List<String>.generate(30, (index) => 'Item $index');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lastItem = ref.watch(lastItemProvider).state;
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
}

class SecondPage extends ConsumerWidget {
  final String item;

  const SecondPage({Key? key, required this.item}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
        child: TextButton(
          child: Text('Pop and change last item to $item'),
          onPressed: () {
            ref.read(lastItemProvider).state = item;
            context.router.pop();
          },
        ),
      ),
    );
  }
}
