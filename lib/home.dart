import 'dart:developer';

import 'package:firebasecrud/addscreen.dart';
import 'package:firebasecrud/provider.dart';
import 'package:firebasecrud/upadate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<Studentprovider>(context, listen: false).getAll();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Addscreen(),
              ));
        },
        child: Icon(Icons.add),
      ),
      body: Consumer<Studentprovider>(
        builder: (context, value, child) => ListView.builder(
          itemCount: value.student.length,
          itemBuilder: (context, index) {
            final data = value.student[index];
            final id = data.id;
            log(data.name ?? '');
            return Card(
              elevation: 3,
              child: ListTile(
                title: Text(data.name ?? 'no'),
                subtitle: Text(data.schoolName!),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Upadate(
                                  id: id,
                                  name: data.name ?? 'no',
                                  age: data.age ?? 'no',
                                  division: data.division ?? 'no',
                                  schoolName: data.schoolName ?? 'no',
                                ),
                              ));
                        },
                        icon: Icon(Icons.edit)),
                    IconButton( 
                        onPressed: () {
                          Provider.of<Studentprovider>(context, listen: false)
                              .deleteS(data.id!);
                        },
                        icon: Icon(Icons.delete))
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
