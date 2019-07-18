import 'package:flutter/material.dart';

class UserFormInputModel {
  final String value;

  UserFormInputModel(this.value);
}

class FormInheritedWidget extends InheritedWidget {
  final UserFormInputModel userFormInputModel;

  final Function() setValue;

  FormInheritedWidget({
    Key key,
    @required this.userFormInputModel,
    @required this.setValue,
    @required Widget child,
  }) : super(key: key, child: child);

  static FormInheritedWidget of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(FormInheritedWidget);
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return userFormInputModel != userFormInputModel;
  }
}

class SetValueWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RaisedButton(
      textColor: Colors.black,
      child: Text('set'),
      onPressed: FormInheritedWidget.of(context).setValue,
    );
  }
}

class ShowValueWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text('${FormInheritedWidget.of(context).userFormInputModel.value}');
  }
}

class FormWidget extends StatefulWidget {
  @override
  _FormWidgetState createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  UserFormInputModel userFormInputModel;

  _setValue() {
    setState(() {
      userFormInputModel = new UserFormInputModel(userFormInputModel.value + 'ha');
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    userFormInputModel = UserFormInputModel('ha');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FormInheritedWidget(
      userFormInputModel: userFormInputModel,
      setValue: _setValue,
      child: Scaffold(
        appBar:  AppBar(title: Text('inherited demo'),),
        body: Column(
          children: <Widget>[
            ShowValueWidget(),
            SetValueWidget()
          ],
        ),
      ),
    );
  }
}
