import 'package:data/database.dart';
import 'package:data/loading.dart';
import 'package:data/user.dart';
import 'package:flutter/material.dart';
import 'package:data/constant.dart';
import 'package:provider/provider.dart';

class UserSettings extends StatefulWidget {
  @override
  _UserSettingsState createState() => _UserSettingsState();
}

class _UserSettingsState extends State<UserSettings> {

  final _formkey = GlobalKey<FormState>();
  static const List<String> _list = ['Technical', 'Content', 'Design', 'Marketing', 'Management'];
  String _value = _list.first;


  String _currentName;
  String _currentCourse;
  String _currentMobile;
  String _currentCollege;
  String _currentDepartment;

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<MyUser>(context);

    return SingleChildScrollView(
      child: StreamBuilder<UserData>(
    stream: DatabaseService(uid: user.uid).userData,
    builder: (context, snapshot) {
      if(snapshot.hasData) {

        UserData userData = snapshot.data;
        return Form(
          key: _formkey,
          child: Column(
            children: <Widget>[
              Text(
                'Update your data',
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              SizedBox(height: 20.0),

              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Enter your name'),
                validator: (val) => val.isEmpty ? 'Please enter your name' : null,
                onChanged: (val) => setState(() => _currentName = val),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Enter your course'),
                validator: (val) => val.isEmpty ? 'Please enter your course' : null,
                onChanged: (val) => setState(() => _currentCourse = val),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Enter your phone number'),
                validator: (val) => val.isEmpty ? 'Please enter your phone number' : null,
                onChanged: (val) => setState(() => _currentMobile = val),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Enter your college'),
                validator: (val) => val.isEmpty ? 'Please enter your college' : null,
                onChanged: (val) => setState(() => _currentCollege = val),
              ),
              SizedBox(height: 20.0),

              DropdownButtonFormField(
                value: _value ?? 'Choose',
                icon: Icon(Icons.arrow_drop_down_outlined),
                iconSize: 24,
                elevation: 16,
                onChanged: (val) => setState(() => _value = val),
                items: [
                  for (String i in _list) DropdownMenuItem(
                    value: i,
                    child: Text('$i Department'),
                  )
                ],
              ),
              SizedBox(height: 20),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xff415A80),
                ),
                child: Text('Update', style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  if(_formkey.currentState.validate()) {
                    await DatabaseService(uid: user.uid).updateUserData(
                        _currentName ?? userData.name,
                        _currentCourse ?? userData.course,
                        _currentMobile ?? userData.mobile,
                        _currentCollege ?? userData.college,
                        _currentDepartment ?? userData.department,
                    );
                    Navigator.pop(context);
                  }
                },
              ),
            ],
          ),
        );
      } else {
        return Loading();
      }

      }
      ),);
  }
}

