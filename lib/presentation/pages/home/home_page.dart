import 'package:flutter/material.dart';
import 'package:flutter_starter_kit/presentation/base/base_stateful_widget_page.dart';
import 'package:flutter_starter_kit/presentation/pages/home/home_page_store.dart';

class HomePage extends BaseStatefulWidgetPage<HomePageStore> {
  const HomePage({super.key});

  @override
  BasePageState<HomePageStore> createState() => _HomePageState();
}

class _HomePageState extends BasePageState<HomePageStore> {
  @override
  HomePageStore createStore() => HomePageStore();

  @override
  Widget buildBody(BuildContext context, HomePageStore store) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Home Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${store.counter}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => store.incrementCounter(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
