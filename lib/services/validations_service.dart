import 'package:flutter/material.dart';

class ValidationService extends ChangeNotifier{

  GlobalKey<FormState> createCardKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController messajeController = TextEditingController();
  String? name;
  String? messaje;
  void setName (String value){
    name = value;
    if(value.isEmpty || value == '' || value == ' ' || value == '  '){
      name = 'Ingrese su nombre';
    }
    notifyListeners();
  }

  void setMessaje (String value){
    messaje = value;
    if(value.isEmpty || value == '' || value == ' ' || value == '  '){
      messaje = 'Por favor, Ingresá un mensaje';
    }
  }

}