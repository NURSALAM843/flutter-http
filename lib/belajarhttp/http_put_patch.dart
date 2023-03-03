import 'dart:convert';

import 'package:dasar_flutter_section_3/state_util.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as myhttp;

class HttpPutPatch extends StatefulWidget {
  const HttpPutPatch({super.key});

  @override
  State<HttpPutPatch> createState() => _HttpPutPatchState();
}

class _HttpPutPatchState extends State<HttpPutPatch> {
  TextEditingController nameC = TextEditingController();
  TextEditingController jobC = TextEditingController();

  String hasilResponse = "Belum Ada Data";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HTTP PUT/PATCH"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          TextField(
            controller: nameC,
            autocorrect: false,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              labelText: "Name",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          TextField(
            controller: jobC,
            autocorrect: false,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              labelText: "Job",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          ElevatedButton(
            onPressed: () async {
              var myResponse = await myhttp.patch(
                //put
                Uri.parse("https://reqres.in/api/users/4"),
                body: {
                  "name": nameC.text,
                  "job": jobC.text,
                },
              );

              Map<String, dynamic> data =
                  jsonDecode(myResponse.body) as Map<String, dynamic>;

              setState(() {
                hasilResponse = "${data['name']} - ${data['job']}";
              });
            },
            child: const Text(
              "Submit",
            ),
          ),
          const SizedBox(
            height: 50.0,
          ),
          const Divider(color: Colors.black),
          const SizedBox(
            height: 20.0,
          ),
          Text(
            hasilResponse,
          ),
        ],
      ),
    );
  }
}
