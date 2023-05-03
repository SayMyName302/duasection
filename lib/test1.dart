import 'package:duasection/dbhelper.dart';
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
                return ListTile(
                  title: Text(
                    snapshot.data![index].duaText,
                    style: const TextStyle(fontSize: 19),
                    textDirection: TextDirection.rtl,
                  ),
                  subtitle: Text(
                    snapshot.data![index].translationUrdu,
                    style:
                        const TextStyle(fontSize: 19, color: Colors.redAccent),
                    textDirection: TextDirection.rtl,
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
