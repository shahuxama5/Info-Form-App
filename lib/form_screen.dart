import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {

  String _name;
  String _email;
  String _password;
  String _url;
  String _phoneNumber;
  String _calories;
  bool _male = false;
  bool _female = false;

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  Widget _buildName (){
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Name'
      ),
      maxLength: 20,
      validator: (String value){
        if(value.isEmpty){
          return 'Name is Required';
        }
        return null;
      },
      onSaved: (String value){
        _name = value;
      },
    );
  }

  Widget _buildEmail (){
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Email'
      ),
      validator: (String value){
        if(value.isEmpty){
          return 'Email is Required';
        }
        if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)){
          return 'Please enter a valid email address';
        }
        return null;
      },
      onSaved: (String value){
        _email = value;
      },
    );
  }

  Widget _buildPassword (){
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Password'
      ),
      keyboardType: TextInputType.visiblePassword,
      validator: (String value){
        if(value.isEmpty){
          return 'Password is Required';
        }
        return null;
      },
      onSaved: (String value){
        _password = value;
      },
    );
  }

  Widget _buildURL (){
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'URL'
      ),
      keyboardType: TextInputType.url,
      validator: (String value){
        if(value.isEmpty){
          return 'URL is Required';
        }
        return null;
      },
      onSaved: (String value){
        this._url = value;
      },
    );
  }
  Widget _buildGender (){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0,5,0,0),
          child: Text('Gender : '),
        ),
        Row(
          children: <Widget>[

            Text('Male : '),
            Checkbox(
              checkColor: Colors.grey,
              value: this._male,
              onChanged: (bool value) {
                setState(() {
                  this._male = value;
                });
              },
            ),
            Text('Female : '),
            Checkbox(
              checkColor: Colors.grey,
              value: this._female,
              onChanged: (bool value) {
                setState(() {
                  this._female = value;
                });
              },
            ),
          ],
        ),
      ],
    );
    // return TextFormField(
    //   decoration: InputDecoration(
    //     labelText: 'Gender',
    //   ),
    //   keyboardType: TextInputType.phone,
    //   validator: (String value){
    //     if(value.isEmpty){
    //       return 'Phone Number is Required';
    //     }
    //     return null;
    //   },
    //   onSaved: (String value){
    //     _phoneNumber = value;
    //   },
   // );;
  }
  Widget _buildPhoneNumber (){
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Phone Number',
      ),
      maxLength: 11,
      keyboardType: TextInputType.phone,
      validator: (String value){
        if(value.isEmpty){
          return 'Phone Number is Required';
        }
        return null;
      },
      onSaved: (String value){
        _phoneNumber = value;
      },
    );
  }

  Widget _buildCalories (){
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Calories'
      ),
      keyboardType: TextInputType.number,
      validator: (String value){
        int calories = int.tryParse(value);
        if( calories == null || calories <= 0)
          {
          return 'Calories must be greater than 0';
        }
        return null;
      },
      onSaved: (String value){
        _calories = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Submit Your Information',
        style: TextStyle(
          color: Colors.amber,
          letterSpacing: 1.5,
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
        ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.fromLTRB(20.0,10.0,20.0,10.0),
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                _buildName(),
                _buildEmail(),
                _buildPassword(),
                _buildURL(),
                _buildGender(),
                _buildPhoneNumber(),
                _buildCalories(),
                SizedBox(height: 20.0,),
                ElevatedButton(
                  onPressed: () {
                    if(!_formkey.currentState.validate()){
                      return;
                    }
                    _formkey.currentState.save();
                    print(_name);
                    print(_email);
                    print(_password);
                    print(_url);
                    print(_phoneNumber);
                    print(_calories);
                  },
                  child: Text(
                    'Submit',
                    style: TextStyle(
                      color: Colors.blueAccent,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
