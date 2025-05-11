import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:dio/dio.dart';
import 'package:funfacts_provider/screens/settings_screen.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<dynamic> facts = [];
  bool isLoading = true;

  void getData() async {
    try {
      Response response = await Dio().get(
        "https://raw.githubusercontent.com/sinch-billava935/flutter_dummy_api/refs/heads/main/facts.json",
      );

      facts = jsonDecode(response.data);
      isLoading = false;
      setState(() {});
    } catch (e) {
      isLoading = false;
      setState(() {});
      print(e);
    }
  }

  @override
  void initState() {
    getData();
    // TODO: implement initState
    super.initState();
  }

  //api url
  //https://raw.githubusercontent.com/sinch-billava935/flutter_dummy_api/refs/heads/main/facts.json

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Fun Facts"),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SettingsScreen();
                  },
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.settings),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child:
                isLoading
                    ? Center(child: CircularProgressIndicator())
                    : PageView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: facts.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                facts[index],
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 35),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Swipe left for more"),
            ),
          ),
        ],
      ),
    );
  }
}
