import 'package:cumple_mar_mobile/pages/initial_page.dart';
import 'package:flutter/material.dart';


class PreCreatePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(62, 66, 107, 0.7),
      body: _Body(),
   );
  }
}

class _Body extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final String texto = '''MUCHISIMAS GRACIAS POR TOMARTE EL TIEMPO PARA PONER TU PARTE EN ESTE REGALO

LA MARTI VA A RECIBIR LAS CARTAS EL DIA DE SU CUMPLEAÑOS''';
    final TextStyle textStyle = TextStyle(
      color: Colors.white,
      fontSize: 14
    );
    final double sh = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(height: sh * .05,),
              Text('TODO LISTO', style: textStyle.copyWith(fontSize: 30),),
              BoxWhiteBorder(
                child: Text(texto,style: textStyle,),
              ),
              Spacer(),
              GradientButtom(
                onPressed: (){
                  Navigator.pushReplacementNamed(context, 'home');
                },
                text: 'Crear la Carta',
              )
            ],
          ),
        )
      ),
    );
  }
}