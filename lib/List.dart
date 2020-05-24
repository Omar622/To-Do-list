import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'task_data.dart';

class ListContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Expanded(
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
        ),
        child: Consumer<Data>(
          builder: (context, data, child) => ListView.builder(
            itemBuilder: (context, int i) => ListTile(
              leading: Text(data.tasks[i].name, style: TextStyle(decoration: data.tasks[i].isDone ? TextDecoration.lineThrough : TextDecoration.none),),
              trailing:Checkbox(
                value: data.tasks[i].isDone,
                activeColor: Colors.lightBlueAccent,
                onChanged: (bool val){
                  data.isDone(i);
                },
              ),
              onTap: (){
                data.isDone(i);
              },
              onLongPress: (){
                data.delete(i);
              },
            ),
            itemCount: data.tasks.length,
          ),
        ),
      ),
    );
}
