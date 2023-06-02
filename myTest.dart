import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => Data()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: MyText(), //used the data here
        ),
        body: Level1(),
      ),
    );
  }
}

class Level1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Level2(),
    );
  }
}

class Level2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      MyTextField(),
      Level3(),
    ]);
  }
}

class Level3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(context.watch<Data>().data); //watch
  }
}

class MyText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //return Text(context.watch<Data>().data); //watch
    return Text(context.read<Data>().data); //read (no update)
  }
}

class MyTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (newText) {
        context.read<Data>().changeString(newText); //read
      },
    );
  }
}

//with
class Data with ChangeNotifier {
  String data = 'Some New Data';

  void changeString(String newString) {
    data = newString;
    notifyListeners();
  } // informs all the listeners
}
