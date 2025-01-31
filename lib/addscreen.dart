import 'package:firebasecrud/model.dart';
import 'package:firebasecrud/provider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class Addscreen extends StatelessWidget {
  const Addscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final name = TextEditingController();
    final age = TextEditingController();
    final division = TextEditingController();
    final schoolName = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<Studentprovider>(
          builder: (context, value, child) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: name,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: 'Name'),
              ),
              Gap(10),
              TextField(
                controller: age,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: 'Age'),
              ),
              Gap(10),
              TextField(
                controller: division,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: 'Class'),
              ),
              Gap(10),
              TextField(
                controller: schoolName,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: 'School name'),
              ),
              Gap(10),
              OutlinedButton(
                onPressed: () {
                  Provider.of<Studentprovider>(context, listen: false)
                      .addStudent(Model(
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
            ],
          ),
        ),
      ),
    );
  }
}
