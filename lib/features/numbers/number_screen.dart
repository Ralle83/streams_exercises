// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:streams_exercises/features/numbers/number_repository.dart';
import 'package:your_app/repositories/number_repository.dart'; // Importiere das NumberRepository

class NumberScreen extends StatelessWidget {
  final NumberRepository numberRepository;

  const NumberScreen({required this.numberRepository});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       const Titlecolor: null,: Text('Number Screen'),
      ),
      body: StreamBuilder<List<int>>(
        stream: numberRepository.getNumberStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No numbers available'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data![index].toString()),
                );
              },
            );
          }
        },
      ),
    );
  }
}

class Titlecolor {
  const Titlecolor();
}
