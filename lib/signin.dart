import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class SignInButton extends StatelessWidget {
  SignInButton({@required this.onPressed});

  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return new RawMaterialButton(
      constraints: BoxConstraints(minHeight: 60, minWidth: 200),
      fillColor: Colors.white70,
      splashColor: Colors.white30,
      hoverColor: Colors.white60,
      child: Text('Sign in', style: TextStyle(fontFamily: 'Spartan')),
      onPressed: null, 
      shape: StadiumBorder(),
      );
      
  }
}

class SignUpButton extends StatelessWidget {
  SignUpButton({@required this.onPressed});

  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return new RawMaterialButton(
      constraints: BoxConstraints(minHeight: 30, minWidth: 120),
      fillColor: Colors.white70,
      splashColor: Colors.white30,
      hoverColor: Colors.white60,
      child: Text('Sign up', style: TextStyle(fontFamily: 'Spartan')),
      onPressed: null, 
      shape: StadiumBorder(),
      );
      
  }
}