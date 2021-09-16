import 'package:flutter/material.dart';


class InitialPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(62, 66, 107, 0.7),
      body: _Body()
   );
  }
}

class _Body extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final double sh = MediaQuery.of(context).size.height;
    final double sw = MediaQuery.of(context).size.width;
    final String texto2 = '''EL PROPOSITO DE ESTE MENSAJE ES HACERTE SABER DE FORMA BREVE DE QUE SE TRATA TODO ESTO.
      BASICAMENTE, ESTO SE TRATA DE UNA PAGINA WEB EN LA CUAL VAN A APARECER LAS CARTAS DE QUIENES QUIERAN ESCRIBIRLE A LA MARTI POR SU CUMPLEAÑOS.''';
    final String texto3 = ''' RECOMENDACIONES A LA HORA DE ESCRIBIR LA CARTA:
•	AL ELEGIR TU FOTO, ELEGI LA QUE VOS QUIERAS, QUE LA MARTI RECONOZCA COMO TUYA (EJEMPLO: FOTO DE PERFIL DE WPP)

•	ESTAR ATENTO A LO QUE ESCRIBIS Y LO QUE PONES EN LA CARTA, QUE AL TERMINARLA Y ENVIARLA, NO SE PUEDE MODIFICAR

•	SEPARAR POR PARRAFOS Y ESCRIBIR DE TAL MANERA QUE SEA FACIL DE LEER 

•	LA IDEA ES QUE SEAN CARTAS, DENTRO DE LO POSIBLE, EXTENSAS Y SIGNIFICATIVAS PARA LA MARTI

•	LAS CARTAS SOLO VAN A PODER SER LEIDAS POR LA MARTI''';
    final String texto4 = '''MUCHISIMAS GRACIAS POR TOMARTE EL TIEMPO PARA PONER TU PARTE EN ESTE REGALO

LA MARTI VA A RECIBIR LAS CARTAS EL DIA DE SU CUMPLEAÑOS''';
    final TextStyle textStyle = TextStyle(
      color: Colors.white,
      fontSize: 14
    );
    return SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Text('REGALO MARTI', style: textStyle.copyWith(fontSize: 30)),

                BoxWhiteBorder(
                  width: sw * 0.65,
                  child: Text('BIENVENIDOS AL REGALO DE LA MARTI POR SU CUMPLEAÑOS N 20',
                    textAlign: TextAlign.center,
                    style: textStyle
                  ),
                ),

                BoxWhiteBorder(
                  child: Text(
                    texto2,
                    style: textStyle,
                  )
                ),

                BoxWhiteBorder(
                  child: Text(texto3, style: textStyle,)
                ),

                GradientButtom(
                  text: 'Siguiente',
                  onPressed: (){
                     Navigator.pushNamed(context, 'preCreate');
                  },
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BoxWhiteBorder extends StatelessWidget {

  final Widget child;
  final double? width;
  final double? height;

  const BoxWhiteBorder({
    this.width,
    this.height,
    required this.child
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 7),
      margin: EdgeInsets.only(top: 20),
      height: height,
      width: width,
      decoration: BoxDecoration(
        border: Border.all(
          width: 3,
          color: Colors.white
        )
      ),
      child: child
    );
  }
}

class GradientButtom extends StatelessWidget {

  final String text;
  final onPressed;

  const GradientButtom({
    required this.text,
    required this.onPressed
  }); 

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Container(
            padding: EdgeInsets.symmetric(horizontal: 50),
            margin: EdgeInsets.only(top: 10, bottom: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              gradient: LinearGradient(
                colors: [
                  Colors.pink,
                  Colors.purple
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight
              )
            ),
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 55,
                fontFamily: 'Allison'
              ),
            ),
          ),
    );
  }
}