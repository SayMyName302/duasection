import 'package:duasection/dbhelper.dart';
import 'package:duasection/test1detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class duasection extends StatefulWidget {
  const duasection({super.key});

  @override
  State<duasection> createState() => _duasectionState();
}

class _duasectionState extends State<duasection> {
  late Future<List<Dua>> _duas;
  @override
  void initState() {
    super.initState();
    _duas = getDataFromDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text(
          "Prayer Duas",
        )),
        body: FutureBuilder<List<Dua>>(
          future: _duas,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final dua = snapshot.data![index];
                  return ListTile(
                    leading: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.grey[300],
                      child: Container(
                        width: 24,
                        height: 24,
                        alignment: Alignment.center,
                        child: Text(
                          "Dua \n${index + 1}",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 11),
                        ),
                      ),
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          snapshot.data![index].duaTitle,
                          style: const TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          snapshot.data![index].duaRef,
                          style: const TextStyle(
                            fontSize: 17,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DuaDetailsScreen(dua: dua),
                        ),
                      );
                    },
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            return const CircularProgressIndicator();
          },
        ));
  }
}
