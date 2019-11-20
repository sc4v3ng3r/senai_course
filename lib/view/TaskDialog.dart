import 'package:flutter/material.dart';

class TaskDialog extends StatefulWidget {

  final ValueChanged<String> onConfirm;

  const TaskDialog({Key key, this.onConfirm}) : super(key: key);

  @override
  _TaskDialogState createState() => _TaskDialogState();
}

class _TaskDialogState extends State<TaskDialog> {
  final TextEditingController controller = TextEditingController();

  final GlobalKey<FormState> key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Nova Tarefa'),
      content: Form(
        key: key,
        child: TextFormField(
          maxLength: 25,
          autovalidate: false,
          controller: controller,
          validator: (data){
            if (controller.text.isEmpty)
              return 'Defina uma tarefa.';

            return null;
          },
        ),
      ),

      actions: <Widget>[

        FlatButton.icon(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.close, color: Colors.red,),
          label: Text('Cancelar', style: TextStyle(
              color: Colors.black
          ),),
        ),

        FlatButton.icon(
            onPressed: (){
              if (key.currentState.validate()){
                if (widget.onConfirm != null)
                  widget.onConfirm(controller.text);

                Navigator.pop(context);
              }
            },
            icon: Icon(Icons.done, color: Colors.green,),
            label: Text('Ok', style: TextStyle(
              color: Colors.black
            ),
          ),
        ),

      ],
    );
  }
}
