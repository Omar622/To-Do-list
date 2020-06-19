import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'task_data.dart';

class ListContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color : Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
      ),
      child: Consumer<Data>(
        builder: (context, data, child) {
          return ListView.builder(
          itemBuilder: (context, int i) => Column(
              children: <Widget>[
                ListTile(
                leading: Text(
                  data.taskName[i],
                   style: TextStyle(decoration: data.getIsDone(i) ?
                    TextDecoration.lineThrough : TextDecoration.none),
                    ),
                trailing:Checkbox(
                  value: data.getIsDone(i),
                  activeColor: Colors.lightBlueAccent,
                  onChanged: (bool val){
                    data.isDone(i);
                  },
                ),
                onTap: ()=> data.isDone(i),
                onLongPress: ()=> data.delete(i),
               ),
               SizedBox(
                 child: Container(child: Text('')),
                 width: double.infinity,
                  height: i == data.taskName.length - 1 ? 100.0 : 1.0,
              ),
              ],
          ),
          itemCount: data.taskName.length,
        );
        },
      ),
    ),
      );
  }
}
