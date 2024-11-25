import 'package:flutter/material.dart';

class FutureEx extends StatefulWidget {
  const FutureEx({super.key});

  @override
  State<FutureEx> createState() => _FutureExState();
}

class _FutureExState extends State<FutureEx> {
  Future<String> getString() async {
    await Future.delayed(const Duration(seconds: 5));
    throw Exception();
  }

  Future<int> getInt() async {
    await Future.delayed(const Duration(seconds: 5));
    return 6;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Future Builder Ex'),
      ),
      body: Center(
        child: FutureBuilder(
          future: getString(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data.toString());
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return const Text('Something went wrong !');
            } else {
              return const Text('Unknown error');
            }
          },
        ),
      ),
    );
  }
}
