import 'package:flutter/material.dart';

class Three extends StatefulWidget {
  const Three({super.key});

  @override
  State<Three> createState() => _ThreeState();
}

class _ThreeState extends State<Three> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('Three'),
      ),
    );
  }
}
