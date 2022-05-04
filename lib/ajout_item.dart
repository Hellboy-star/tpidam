import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:tpidam/main.dart';

import 'package:tpidam/model/item.dart';

class Ajout extends StatefulWidget {


  @override
  _AjoutState createState() => _AjoutState();

}

class _AjoutState extends State<Ajout> {

  String? gender = 'Masculin';

  var items = [
    'Masculin',
    'Feminin'
  ];

  late DateTime date;

  late String image;
  late Future<Item> futureItem;

  @override
  void initState() {
    super.initState();
    futureItem = fetchItem();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Scaffold(
      appBar:  AppBar(
        title: Text('Ajouter individus'),
        actions: [
          ElevatedButton(onPressed: initState,
              child: Text('Ajouter', style: TextStyle(color: Colors.white),))
        ],
      ),
      body:  SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child:  Column(
          children: [
            Text('Individu à ajouter', textScaleFactor: 1.4, style: TextStyle(color: Colors.red),),
            Card(
              elevation: 10.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  (image == null)
                      ? Image.asset("image/720236.png")
                      : Image.file( File(image)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(onPressed: (() => getImage(ImageSource.camera)), icon: new Icon(Icons.camera_enhance)),
                      IconButton(onPressed: (() => getImage(ImageSource.gallery)), icon: new Icon(Icons.photo_library)),
                    ],
                  ),
                  textField(TypeTextField.firstname, "Prénom de l'individu"),
                  textField(TypeTextField.lastname, "Nom de l'individu"),

                  ElevatedButton(
                    onPressed: montrerDate,
                    child: Text((date == null)? 'Date d\'anniverssaire' : date.toString()),
                  ),

                  textField(TypeTextField.adress, "Adresse de l'individu"),
                  textField(TypeTextField.phone, "Numéro de téléphone"),
                  textField(TypeTextField.mail, "Mail de l'individu"),
                  DropdownButton(
                    value: gender,
                    icon: Icon(Icons.keyboard_arrow_down),
                    items: items.map((items) {
                      return DropdownMenuItem(value: items, child: Text(items));
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        gender = newValue;
                      });
                    },
                  ),
                  textField(TypeTextField.citation, "Citation favorite"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<Null> montrerDate() async {
    DateTime? birthday = await showDatePicker(
        context: context,
        initialDate: DateTime(2012),
        firstDate: DateTime(1900),
        lastDate: DateTime(2012));

    if (birthday != null) {

    }

  }

  TextField textField(TypeTextField type, String label) {
    return TextField(
      decoration: InputDecoration(labelText: label),
      onChanged: (String string) {
        switch (type) {
          case TypeTextField.firstname:

            break;
          case TypeTextField.lastname:

            break;

          case TypeTextField.adress:

            break;
          case TypeTextField.phone:

            break;
          case TypeTextField.mail:

            break;

          case TypeTextField.citation:

            break;
        }
      },
    );
  }




  Future getImage(ImageSource source) async {
    var nouvelleIMage = await ImagePicker.platform;
    setState(() {
      image = nouvelleIMage as String;
    });
  }

}

enum TypeTextField { firstname, lastname, adress, phone, mail, citation }

