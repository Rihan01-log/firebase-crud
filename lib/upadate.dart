import 'package:firebasecrud/model.dart';
import 'package:firebasecrud/provider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class Upadate extends StatefulWidget {
  String? id;
  String? name;
  String? age;
  String? division;
  String? schoolName;
  Upadate(
      {super.key,
      required this.name,
      required this.age,
      required this.division,
      required this.schoolName,
      required this.id});

  @override
  State<Upadate> createState() => _UpadateState();
}

class _UpadateState extends State<Upadate> {
  TextEditingController name = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController division = TextEditingController();
  TextEditingController schoolName = TextEditingController();
  @override
  void initState() {
    super.initState();
    name = TextEditingController(text: widget.name);
    age = TextEditingController(text: widget.age);
    division = TextEditingController(text: widget.division);
    schoolName = TextEditingController(text: widget.schoolName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: name,
            decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                labelText: 'Name'),
          ),
          Gap(10),
          TextField(
            controller: age,
            decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                labelText: 'Age'),
          ),
          Gap(10),
          TextField(
            controller: division,
            decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                labelText: 'Class'),
          ),
          Gap(10),
          TextField(
            controller: schoolName,
            decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                labelText: 'School name'),
          ),
          Gap(10),
          Consumer<Studentprovider>(
            builder: (context, value, child) => OutlinedButton(
              onPressed: () {
                value.upadate(
                    widget.id!,
                    Model(
                        age: age.text,
                        name: name.text,
                        division: division.text,
                        schoolName: schoolName.text));
                Navigator.pop(context);
              },
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.cyan,
                minimumSize: Size(double.infinity, 50),
                shape: LinearBorder(
                  bottom: LinearBorderEdge(),
                  top: LinearBorderEdge(alignment: Checkbox.width),
                ),
              ),
              child: Text(
                'Save',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
