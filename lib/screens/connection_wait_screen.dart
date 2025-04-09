import 'package:flutter/material.dart';

class ConnectionWaitScreen extends StatelessWidget {
  const ConnectionWaitScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FlutterChat'),
      ),
      body: const Center(child: CircularProgressIndicator(),)
    );
  }
}