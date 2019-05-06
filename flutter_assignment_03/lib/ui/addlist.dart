import 'package:flutter/material.dart';
import '../firestore.dart';

class NewList extends StatefulWidget {
  @override
  _NewListState createState() => _NewListState();
}

class _NewListState extends State<NewList> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController subjectController = TextEditingController();

    TextFormField todoTextField = TextFormField(
      controller: subjectController,
      decoration: InputDecoration(
        labelText: "Subject",
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter some text...';
        }
      },
    );

    RaisedButton submitButton = RaisedButton(
      child: const Text('Save'),
      onPressed: () {
        if (_formKey.currentState.validate()) {
          FirestoreUtils.addTask(subjectController.text.trim());
          Navigator.pop(context, '/');
        }
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('New Subject'),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.all(12.0),
          child: ListView(
            children: <Widget>[
              todoTextField,
              submitButton,
            ],
          ),
        ),
      ),
    );
  }
}