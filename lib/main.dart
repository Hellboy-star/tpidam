import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tpidam/model/item.dart';
import 'package:tpidam/ajout_item.dart';
import 'package:http/http.dart' as http;

Future<Item> fetchItem() async {
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/item/1'));

  if (response.statusCode == 200) {
    return Item.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load item');
  }

}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'idam',
      theme: ThemeData(

        primarySwatch: Colors.lightBlue,
      ),
      home: const MyHomePage(title: 'Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var futureItem = fetchItem();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          ElevatedButton(onPressed: versPageAjout,
              child: Text('Ajouter', style: TextStyle(color: Colors.white),))
        ],
      ),
      body: Center(
        child: new ListView(
          children: [
             FutureBuilder<Item>(
              future: futureItem,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data!.firstname);
                } else {
                  return Text('${snapshot.error}');
                }
              },
            ),
          ],
        )
      )

    );
  }
void versPageAjout() {
    Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context) {
      return new Ajout();
    } ));
}

}
