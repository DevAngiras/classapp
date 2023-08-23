import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  late TextEditingController namecontroller, bodycontroller, deadlinecontroller;
  List priority = ["High", "Medium", "Low"];
  List category = ["Daily", "Weekly", "Monthly"];

  @override
  void initState() {
    super.initState();
    namecontroller = TextEditingController();
    bodycontroller = TextEditingController();
    deadlinecontroller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Task"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Fields(
              fieldname: "Name",
              controller: namecontroller,
              multiLine: false,
            ),
            Fields(
              fieldname: "Body",
              controller: bodycontroller,
              multiLine: true,
            ),
            Fields(
              fieldname: "Deadline",
              controller: deadlinecontroller,
              multiLine: false,
            ),
            InkWell(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "Submit",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              onTap: () {
                if (kDebugMode) {
                  print(namecontroller.text);
                  print(bodycontroller.text);
                  print(deadlinecontroller.text);
                }
              },
            )
          ],
        ),
      ),
    );
  }
}

class Fields extends StatelessWidget {
  const Fields({
    super.key,
    required this.fieldname,
    required this.controller,
    required this.multiLine,
  });
  final String fieldname;
  final TextEditingController controller;
  final bool multiLine;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: fieldname,
          border: const OutlineInputBorder(),
          labelStyle: const TextStyle(
            color: Colors.blue,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        maxLines: multiLine ? null : 1,
      ),
    );
  }
}
