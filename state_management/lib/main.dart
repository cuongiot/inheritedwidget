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
    return Scaffold(
        appBar: AppBar(
          title: const Text("Age counter"),
        ),
        body: const OngBa(
          child: BoMe(
            child: Column(
              children: [Con1(), Con2()],
            ),
          ),
        ));
  }
}

class OngBa extends StatelessWidget {
  const OngBa({super.key, required this.child});
  final Widget child;

  static OngBa? of(BuildContext context) {
    return context.findAncestorWidgetOfExactType<OngBa>();
  }

  layThongTinOngBa() {
    print("Thông tin ông bà");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
    );
  }
}

class BoMe extends StatelessWidget {
  const BoMe({super.key, required this.child});
  final Widget child;
  static BoMe? of(BuildContext context) {
    return context.findAncestorWidgetOfExactType<BoMe>();
  }

  layThongTinBoMe() {
    print("Thông tin bố mẹ");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
    );
  }
}

class Con1 extends StatelessWidget {
  const Con1({super.key});

  @override
  Widget build(BuildContext context) {
    OngBa? ongba = OngBa.of(context);
    ongba?.layThongTinOngBa();

    BoMe? boMe = BoMe.of(context);
    boMe?.layThongTinBoMe();
    return const Text("Con 1");
  }
}

class Con2 extends StatelessWidget {
  const Con2({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("Con 2");
  }
}
