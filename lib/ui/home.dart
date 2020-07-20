import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:hellowebb/util/constants.dart';

class Home extends StatefulWidget {
  final String title;
  Home({Key key, this.title}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _loading;
  Map response;
  Movies movies;

  getMovies() async {
    setState(() {
      _loading = true;
    });
    var res = await http.get("${Constants.popularUrl}${Constants.apiKey}");
    var decodedJson = jsonDecode(res.body);
    print(decodedJson);

    if (res.statusCode == 200 && decodedJson != null) {
      if (mounted) {
        setState(() {
          movies = Movies.fromJson(decodedJson);
          _loading = false;
        });
      }
    } else {
      print("Something went Wrong");
      if (mounted) {
        setState(() {
          _loading = false;
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    getMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Padding(
          child: new Text("${widget.title}"),
          padding: EdgeInsets.only(left: 12.0),
        ),
      ),
    );
  }
}
