import 'package:flutter/material.dart';
import 'package:todo_app/model/Task.dart';
import 'package:todo_app/view/EmptyWidget.dart';
import 'package:todo_app/view/TaskDialog.dart';

void main() => runApp( MyApp() );

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),

    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<Task> taskList = [];

  @override
  Widget build(BuildContext context) {

    final defaultPadding = 8.0;

    return Scaffold(
      appBar: AppBar(
        title: Text('Todo list'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              setState(() {
                taskList.clear();
              });
            },
            icon: Icon(
              Icons.clear
            ),
          ),
        ],
      ),

      body: taskList.isEmpty ? Center(child: EmptyWidget()) :

          ListView.builder(
            shrinkWrap: true,
              padding: EdgeInsets.symmetric(
                  horizontal: defaultPadding,
                  vertical: defaultPadding
              ),

              itemBuilder: (context, index){
                if (index >= taskList.length)
                  return Container(
                    height: 64.0,
                  );

                var task = taskList[index];

                return Dismissible(
                  key: Key('${task.name}$index'),
                  onDismissed: (direction){
                    setState(() {
                      taskList.removeAt(index);
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: defaultPadding),
                    child: Material(
                      type: MaterialType.card,
                      elevation: 4.0,

                      child: ListTile(
                        onTap: (){},
                        leading: Icon(
                          Icons.work
                        ),

                        title: Text(task.name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 18,
                            decoration: (task.isDone)
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                          ),
                        ),

                        trailing: Checkbox(
                            value: task.isDone,
                            onChanged: (flag){
                              setState(() {
                                task.isDone = flag;
                              });
                            }
                        ),
                      ),
                    ),
                  ),
                );
              },
            itemCount: taskList.length + 1,
          ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.edit),
        onPressed: (){

          showDialog(
              context: context,
            builder: (context) => TaskDialog(
              onConfirm: (taskName){
                setState(() {
                  var task = Task(name: taskName);
                  taskList.add(task);
                });

              },
            )
          );
        },
      ),
    );
  }
}
