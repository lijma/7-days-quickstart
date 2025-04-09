import 'package:flutter/material.dart';
import 'pig/MyPlugin.dart';

import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Form Validation Demo';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: HelloWorldWidget(),
      ),
    );
  }
}


class HelloWorldWidget extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HelloWorldState();
  }

}

class HelloWorldState extends State<HelloWorldWidget> {
  final _formKey = GlobalKey<HelloWorldState>();
  late MyClass myClass;
  late List<String> texts = [];

  @override
  void initState() {
    super.initState();
    myClass = MyClass();
    myClass.clear();
    myClass.addListener(() async {
      List<String> names = await myClass.names();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(names.toString())),
      );
      setState(() {
        texts = names;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController();

    return Center(
      key: _formKey,
      child: Column(
        children: [
          TextField(
            controller: nameController,
          ),
          ElevatedButton(
            onPressed: () {
              print(nameController.value.text);
              // Validate returns true if the form is valid, or false otherwise.
              myClass.add(nameController.value.text);
            },
            child: const Text('Submit'),
          ),
          Container(
            width: 800,
            height: 400,
            child: NameWidget(names: texts),
          )
        ],
      ),
    );
  }

}

class NameWidget extends StatelessWidget {

  final List names;

  NameWidget({required this.names});

  @override
  Widget build(BuildContext context) {
    print("rendering"+names.toString());
    names.reversed;
    return ListView.builder(
      itemCount: names.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(names[index]),
        );
      },
    );
  }
}

class MyClass extends ChangeNotifier {

  clear() async {

  }

  add(name) async {
    SearchRequest request = SearchRequest(query: name);
    Api api = Api();
    SearchReply reply = await api.search(request);
    print('reply from Plugin: ${reply.result}');

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(reply.result, name);

    notifyListeners();
  }

  names() async{
    final instance = await SharedPreferences.getInstance();
    return instance.getKeys().toList();
  }

}




