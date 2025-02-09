import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Inherited widget',
      home: MyHomePage(),
    );
  }
}

// Counter app with InheritedWidget

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CounterWidget(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Age counter"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Builder(builder: (context) {
                final inherited = context
                        .dependOnInheritedWidgetOfExactType<_InheritedCount>()
                    as _InheritedCount;
                return Text(
                  inherited.state.count <= 1
                      ? 'I am ${inherited.state.count} year old'
                      : 'I am ${inherited.state.count} years old',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              }),
              Builder(builder: (context) {
                final ancestor =
                    context.findAncestorWidgetOfExactType<_InheritedCount>()
                        as _InheritedCount;
                return ElevatedButton(
                  onPressed: () => ancestor.state.incrementCount(),
                  child: const Text("Increase Age"),
                );
              }),
              Builder(builder: (context) {
                final ancestor =
                    context.findAncestorWidgetOfExactType<_InheritedCount>()
                        as _InheritedCount;
                return ElevatedButton(
                  onPressed: () => ancestor.state.decrementCount(),
                  child: const Text("Reduce age"),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key, required this.child});

  final Widget child;

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<CounterWidget> {
  late int count;

  void incrementCount() {
    setState(() {
      ++count;
    });
  }

  void decrementCount() {
    setState(() {
      --count;
    });
  }

  @override
  void initState() {
    super.initState();
    count = 0;
  }

  @override
  Widget build(BuildContext context) {
    return _InheritedCount(
      state: this,
      child: widget.child,
    );
  }
}

class _InheritedCount extends InheritedWidget {
  const _InheritedCount({super.key, required this.state, required super.child});

  final _CounterState state;

  @override
  bool updateShouldNotify(_InheritedCount old) => true;
}
