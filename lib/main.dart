import 'package:flutter/material.dart';
import 'List.dart';
import 'openingSheet.dart';
import 'package:provider/provider.dart';
import 'task_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(Z0());

class Z0 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Data(),
      child: MaterialApp(
        color: Colors.black,
        debugShowCheckedModeBanner: false,
        title: 'To Do',
        home: Z1(),
      ),
    );
  }
}

class Z1 extends StatelessWidget {

  void getData(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    Provider.of<Data>(context, listen: false).taskName =
        prefs.getStringList('tasksName') ?? [];
    Provider.of<Data>(context, listen: false).taskIsDone =
        prefs.getStringList('tasksIsDone') ?? [];
    Provider.of<Data>(context, listen: false).notify();
  }

  @override
  Widget build(BuildContext context) {
    getData(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        tooltip: 'add new task',
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          showModalBottomSheet<void>(
            context: context,
            builder: (context) => OpenSheet(),
            backgroundColor: Colors.transparent,
          );
        },
      ),
      backgroundColor: Colors.lightBlueAccent,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                top: 16.0,
                left: 16.0,
                bottom: 10.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CircleAvatar(
                    child: Icon(
                      Icons.list,
                      size: 50.0,
                      color: Colors.lightBlueAccent,
                    ),
                    backgroundColor: Colors.white,
                    radius: 40.0,
                  ),
                  Text(
                    'To Do',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    '${Provider.of<Data>(context).taskName.length} ${Provider.of<Data>(context).taskName.length > 1 ? 'Tasks' : 'Task'}',
                    style: TextStyle(color: Colors.white, fontSize: 18.0),
                  )
                ],
              ),
            ),
            ListContainer(),
          ],
        ),
      ),
    );
  }
}
