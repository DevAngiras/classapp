// ignore_for_file: file_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  void displayTask()async{
    var sharedPref=await SharedPreferences.getInstance();
    String taskList = sharedPref.getString("taskList")??"[]";
    print(taskList);
    List finalList=jsonDecode(taskList);
    print("-----------");
    print(finalList);
    //print(finalList[1]);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    displayTask();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("To-Do List"),
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
