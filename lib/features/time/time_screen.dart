import 'package:flutter/material.dart';
import 'package:streams_exercises/features/time/time_repository.dart';
import 'lib.g.dart';

class TimeScreen extends StatelessWidget {
  final TimeRepository timeRepository;

  const TimeScreen({required this.timeRepository});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Time Screen'),
      ),
      body: StreamBuilder<DateTime>(
        stream: timeRepository.dateTimeStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('No time data available'));
          } else {
            return Center(
              child: Text(
                'Current Time: ${snapshot.data}',
                style: const TextStyle(fontSize: 24),
              ),
            );
          }
        },
      ),
    );
  }
}
