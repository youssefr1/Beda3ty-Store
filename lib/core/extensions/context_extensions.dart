import 'package:flutter/cupertino.dart';

extension ContextExtensions on BuildContext{
  Future<dynamic> pushNamed(String routeName){
    return Navigator.pushNamed(this, routeName);
  }

  void pop()=>Navigator.pop(this);


  Future<dynamic> pushReplacementNamed(String routeName){
    return Navigator.pushReplacementNamed(this, routeName);
  }


  Future<dynamic> pushAndRemoveUntil(String routeName,Object? arguments){
    return Navigator.pushNamedAndRemoveUntil(this, routeName,(route)=>false);
  }


}