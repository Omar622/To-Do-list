import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'task_data.dart';

class OpenSheet extends StatefulWidget {
  @override
  _OpenSheetState createState() => _OpenSheetState();
}

class _OpenSheetState extends State<OpenSheet> {
  String taskName = '';
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            'Add Task',
            style: TextStyle(
              color: Colors.lightBlueAccent,
              fontWeight: FontWeight.w700,
              fontSize: 30.0,
            ),
            textAlign: TextAlign.center,
          ),
          TextField(
            autofocus: true,
            textAlign: TextAlign.center,
            onChanged: (String val){
              taskName = val;
            },
          ),
          FlatButton(
            color: Colors.lightBlueAccent,
            child: Text(
              'Add',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              if(taskName != '')
                Provider.of<Data>(context).add(taskName);
              else
                print('The task you add is empty!');
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
