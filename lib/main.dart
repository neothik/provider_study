import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //String data = 'Hello There';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SharedData>(
      create: (context) => SharedData(),
      lazy: false,
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: Level0()),
          body: Level1(),
        ),
      ),
    );
  }
}

class Level0 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String title = Provider.of<SharedData>(context, listen: false).data;
    return Text(title);
  }
}

class Level1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Level2(),
        Level3(),
      ],
    );
  }
}

class Level2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (newText) {
        //Provider.of<SharedData>(context).updateData(newText);
        context.read<SharedData>().updateData(newText);
        //print(newText);
      },
    );
  }
}

class Level3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(context.watch<SharedData>().data),
      //child: Text(Provider.of<SharedData>(context, listen: true).data),
    );
  }
}

class SharedData extends ChangeNotifier {
  String data = 'Hello World';

  void updateData(String newData) {
    data = newData;
    notifyListeners();
  }
}
