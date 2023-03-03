import 'package:flutter/material.dart';
import 'package:http/http.dart' as myhttp;
import 'dart:convert';

class HttpGet extends StatefulWidget {
  const HttpGet({super.key});

  @override
  State<HttpGet> createState() => _HttpGetState();
}

class _HttpGetState extends State<HttpGet> {
  late String id;
  late String email;
  late String name;
  @override
  void initState() {
    id = "";
    email = "";
    name = "";
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HTTP GET"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "ID : $id",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              "Email : $email",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              "Name : $name",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            ElevatedButton(
              onPressed: () async {
                var myResponse = await myhttp.get(
                  Uri.parse(
                    "https://reqres.in/api/users/10",
                  ),
                );

                if (myResponse.statusCode == 200) {
                  //berhasil get
                  print("Berhasil Get Data");
                  Map<String, dynamic> data =
                      jsonDecode(myResponse.body) as Map<String, dynamic>;
                  setState(() {
                    id = data['data']['id'].toString();
                    email = data['data']['email'].toString();
                    name =
                        "${data["data"]["first_name"]} ${data["data"]["last_name"]}";
                  });
                } else {
                  //tidak berhasil get
                  print("ERROR ${myResponse.statusCode}");
                }
              },
              child: const Text("Get Data"),
            ),
          ],
        ),
      ),
    );
  }
}
