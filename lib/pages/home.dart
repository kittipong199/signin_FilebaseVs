import 'dart:developer';

import 'package:chat/pages/cons.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  String roomId = "";

  @override
  Widget build(BuildContext context) {
    // firestore.collection('users').snapshots();

    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: [SignOutButton()],
      ),
      body: Container(child: Text("ยินดีต้อนรับ"),)
    );
  }
}
