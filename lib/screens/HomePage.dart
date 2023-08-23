import 'package:flutter/material.dart';
import 'package:testapp/screens/AddTask.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;

  void addTask() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AddTask(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("To-Do List "),
      ),
      body: Text(
        '$count',
        style: Theme.of(context).textTheme.headlineMedium,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addTask,
        tooltip: 'Add Task',
        child: const Icon(Icons.add),
      ),
    );
  }
}
