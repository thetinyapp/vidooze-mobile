import 'package:flutter/material.dart';
import 'package:flutter_starter_kit/presentation/base/base_stateful_page_widget.dart';
import 'package:flutter_starter_kit/presentation/pages/home/sample_page_store.dart';

class SamplePage extends BaseStatefulPageWidget<SamplePageStore> {
  const SamplePage({super.key});

  @override
  BasePageState<SamplePageStore> createState() => _HomePageState();
}

class _HomePageState extends BasePageState<SamplePageStore> {
  @override
  SamplePageStore createStore() => SamplePageStore(initialCount: 1);

  @override
  Widget buildBody(BuildContext context, SamplePageStore store) {
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
