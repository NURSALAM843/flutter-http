import 'dart:convert';

import 'package:dasar_flutter_section_3/state_util.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as myhttp;

class HttpDelete extends StatefulWidget {
  const HttpDelete({super.key});

  @override
  State<HttpDelete> createState() => _HttpDeleteState();
}

class _HttpDeleteState extends State<HttpDelete> {
  String data = "Belum Ada Data";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "HTTP DELETE",
        ),
        actions: [
          IconButton(
            onPressed: () async {
              var response = await myhttp.get(
                Uri.parse("https://reqres.in/api/users/2"),
              );
              Map<String, dynamic> mybody = jsonDecode(response.body);
              setState(() {
                data =
                    "Akun : ${mybody['data']['first_name']}  ${mybody['data']['last_name']}";
              });
              // Map obj = jsonDecode(response.body);
            },
            icon: Icon(Icons.get_app),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Text(
            data,
          ),
          const SizedBox(
            height: 35.0,
          ),
          ElevatedButton(
            onPressed: () async {
              var response = await myhttp.delete(
                Uri.parse("https://reqres.in/api/users/2"),
              );
              if (response.statusCode == 204) {
                setState(() {
                  data = "Berhasil Hapus Data";
                });
              }
              // Map<String, dynamic> mybody = jsonDecode(response.body);
              // setState(() {
              //   data =
              //       "Akun : ${mybody['data']['first_name']}  ${mybody['data']['last_name']}";
              // });
              // Map obj = jsonDecode(response.body);
            },
            child: Text(
              "delete",
            ),
          )
        ],
      ),
    );
  }
}
