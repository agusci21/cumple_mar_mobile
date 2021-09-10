import 'dart:io';
import 'dart:ui';

import 'package:cumple_mar_mobile/models/cards_model.dart';
import 'package:cumple_mar_mobile/services/cards_services.dart';
import 'package:cumple_mar_mobile/services/validations_service.dart';
import 'package:cumple_mar_mobile/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class CreateCardPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final validationService = Provider.of<ValidationService>(context);
    final double sh = MediaQuery.of(context).size.height;
    final double sw = MediaQuery.of(context).size.width;

    return Form(
      key: validationService.createCardKey,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient:LinearGradient(
            colors: MyTheme.gradientColors,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter
          )
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _DemoCard(),
              _Inputs(),
              _SendButtom(),
            ],
          ),
        ),
      )
    );
  }
}

class _DemoCard extends StatelessWidget {
  const _DemoCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double sh = MediaQuery.of(context).size.height;
    final double sw = MediaQuery.of(context).size.width;
    final validationService = Provider.of<ValidationService>(context);
    final cardsService = Provider.of<CardsService>(context);

    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(top: sh * .1),
      height: sw * 0.7,
      width: sw * 0.7,
      decoration: BoxDecoration(
        color: Color.fromRGBO(62, 66, 107, 0.7),
        borderRadius: BorderRadius.circular(25)
      ),

      child: Column(
        children: [

          GestureDetector(
             onTap: ()async{
              final cardsService = Provider.of<CardsService>(context,listen: false);
              final picker = ImagePicker();
              final XFile? pickedFile = await picker.pickImage(source: ImageSource.camera);
              // ignore: unnecessary_null_comparison
              if(pickedFile == null){

              }else{
                cardsService.cardsImage(pickedFile.path);
              }
              

              

            //   //TODO tomar fotos 
            //   if(pickedFile!.path != null) {
            //     cardsService.selectedCardsImage(pickedFile.path);
            //   }
              
            },
            child: (cardsService.pictureFile == null) 
            ? _NoImageWidget()
            : _ImagePickedFile(),
          ),

          Container(height: sw * 0.05,),

          Text(
            validationService.name ?? 'Su nombre',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25
            )
          ),
        ],
      ),
    );
  }

  Widget getImage (String? picture){
    if(picture == null){
      return _NoImageWidget();
    }
    return Image.file(
      File(picture),
      fit: BoxFit.cover,
    );
    // else if(picture.startsWith('http')){
    //   return FadeInImage(
    //     placeholder: AssetImage('assets/img/placeholderGif.gif'),
    //     image: NetworkImage()
    //   );
    // }
  }
}

class _ImagePickedFile extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final cardsService = Provider.of<CardsService>(context);
    return Image.file(cardsService.pictureFile as File);
  }
}

class _NoImageWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    double sh = MediaQuery.of(context).size.height;
    double sw = MediaQuery.of(context).size.width;
    return Container(
      height: sw * 0.45,
      width: sw * 0.45,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.pink,
            Colors.purple
          ]
        ),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Column(
        children: [
          Container(height: sh * 0.03,),
          Icon(Icons.camera_alt, color: Colors.white70,size: 50,),
          Container(height: sh * 0.02,),
          Text('Ingresá tu foto',style: TextStyle(fontSize: 22, color: Colors.white), )
        ],
      ),
    );
  }
}

class _Inputs extends StatelessWidget {
  const _Inputs({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final validationService = Provider.of<ValidationService>(context);
    final double sh = MediaQuery.of(context).size.height;
    final double sw = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(top: sh * 0.05),
      width: sw * 0.85,
      child: Column(
        children: [

          _NameInput(),

          SizedBox(height: sh * 0.05),

          _EditableText(validationService: validationService)
        ],
      ),
    );
  }
}

class _EditableText extends StatelessWidget {
  const _EditableText({
    Key? key,
    required this.validationService,
  }) : super(key: key);

  final ValidationService validationService;

  @override
  Widget build(BuildContext context) {
    final validationService = Provider.of<ValidationService>(context);
    final double sh = MediaQuery.of(context).size.height;
    final double sw = MediaQuery.of(context).size.width;
    return Container(
      height: sh * 0.3,
      width: sw * 0.9,
      decoration: BoxDecoration(
        color: Color.fromRGBO(62, 66, 107, 0.7),
        borderRadius: BorderRadius.circular(25)
      ),
      child: TextFormField(
        onChanged: (value){
          validationService.setMessaje(value);
        },
        controller: validationService.messajeController,
        maxLines: 10,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        cursorColor: Colors.white,
        style: TextStyle(
          color: Colors.white,
          fontSize: 17
        ),
        decoration: InputDecoration(

          contentPadding: EdgeInsets.all(10),

          focusedErrorBorder:OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
           borderSide: BorderSide(
              width: 2,
              color: Colors.red.shade900
          )
        ), 

          errorStyle: TextStyle(
            color: Colors.red.shade600,
            fontSize: 20,
          ),

          errorBorder:OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
           borderSide: BorderSide(
              width: 2,
              color: Colors.red.shade900
          )
        ), 

          alignLabelWithHint: true,
          labelText: 'Tu Mensaje',
          hintStyle: TextStyle(
            color: Colors.white,
            fontSize: 19
          ),
          labelStyle: TextStyle(
            color: Colors.white,
            fontSize: 20
          ),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
           borderSide: BorderSide(
              width: 2,
              color: Colors.white
          )
        ),

        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: Colors.white
          )
         ),
        ),
        validator: (value){
          if(value != null && value.length > 10)
            return null;
          if(value == null || value.isEmpty)
            return '  Por favor, dejale un mensaje ';
          if(value.length < 9)
            return '  Deja un mensaje mas largo';
        }
      )
    );
  }
}

class Buttoms extends StatelessWidget {
  const Buttoms({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //TODO: implementar botones
    );
  }
}

class _NameInput extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final validationService = Provider.of<ValidationService>(context);
    return TextFormField(
      maxLines: 1,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      cursorColor: Colors.white,
      style: TextStyle(color: Colors.white),
      controller: validationService.nameController,
      keyboardType: TextInputType.name,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
        errorStyle: TextStyle(fontSize: 17),
        contentPadding: EdgeInsets.symmetric(horizontal: 16),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: BorderSide(
            width: 2,
            color: Colors.white
          )
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: Colors.white
          )
        ),
        labelText: 'Ingresa tu Nombre',
        labelStyle: TextStyle(color: Colors.white, fontSize: 20),
        hintStyle: TextStyle(color: Colors.white),
        fillColor: Colors.white,
        hoverColor: Colors.white
      ),
      onChanged: (value){
        validationService.setName(value);
      },
      validator: (value){
        if (value != null && value.length > 3 && value.length < 13)
          return null;
        if( value == null || value.isEmpty || value == ' ' || value == '  ' || value == '   ')
          return 'Por favor, Completa con tu nombre';
        if(value.length < 3)
          return 'Tu nombre es muy corto';
        if(value.length > 14 )
          return 'Tu nombre es muy Largo';
      },
    );
  }
}

class _SendButtom extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final cardsService = Provider.of<CardsService>(context);
    final validationService = Provider.of<ValidationService>(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: MaterialButton(
        
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
          margin: EdgeInsets.only(top: 20, bottom: 10),
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
            'Enviar Carta',
            style: TextStyle(
              color: Colors.white,
              fontSize: 55,
              fontFamily: 'Allison'
            ),
          ),
        ),
        onPressed: (){
          if(validationService.createCardKey.currentState!.validate()){
            cardsService.finalName = validationService.name as String;
            cardsService.finalMenssaje = validationService.messaje as String;
            Cards cards = new Cards(
             message: cardsService.finalMenssaje,
             name: cardsService.finalName
          );
           cardsService.createCard(cards);
           ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Todo salio bien')));
        } else{
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Hay errores')));
        }
         
          //TODO quitar en navigator
          //Navigator.pushNamed(context, '/home');
        },
      ),
    );
  }
}