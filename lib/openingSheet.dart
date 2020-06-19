import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'task_data.dart';
import 'package:fluttertoast/fluttertoast.dart';

class OpenSheet extends StatefulWidget {
  @override
  _OpenSheetState createState() => _OpenSheetState();
}

class _OpenSheetState extends State<OpenSheet> {
  String taskName = '';
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          TextField(
            autofocus: true,
            textAlign: TextAlign.center,
            onChanged: (String val) {
              taskName = val;
            },
          ),
          FlatButton(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(40.0))),
            color: Colors.lightBlueAccent,
            child: Text(
              'Add',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              if (taskName != '')
                Provider.of<Data>(context, listen: false).add(taskName);
              else
                Fluttertoast.showToast(
                  msg: 'Task is empty!',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  fontSize: 16.0,
                );
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
