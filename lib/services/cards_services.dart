import 'dart:convert';
import 'dart:io';

import 'package:cumple_mar_mobile/models/cards_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CardsService extends ChangeNotifier{

  final String _baseUrl = 'cumple-mar-d195a-default-rtdb.firebaseio.com';
  final List<Cards>cards = [];
  bool isLoading = true;

  late String finalName;
  late String finalMenssaje;
  File? pictureFile;


  CardsService(){
    this.loadCards();
  }

  Future<List<Cards>> loadCards()async{

    this.isLoading = true;
    notifyListeners();

    final url = Uri.https(_baseUrl, 'cards.json');
    final resp = await http.get(url);

    final Map<String, dynamic> cardsMap = json.decode(resp.body);

    cardsMap.forEach((key, value) {
      final tempCards = Cards.fromMap(value);
      tempCards.id = key;
      this.cards.add(tempCards);
    });

    this.isLoading = false;
    notifyListeners();

    return this.cards;

  }

  Future createCard (Cards cards)async{
    final url = Uri.https(_baseUrl, 'cards.json');
    final resp = await http.post(url, body: cards.toJson());
    final decodedData = resp.body;
    print(decodedData);
  }
  
  void cardsImage(String path){
    this.pictureFile = File.fromUri(Uri(path: path));
    notifyListeners();
  }

  void deleteImage(){
    this.pictureFile = null;
    notifyListeners();
  }

  Future<String?>uploadImage()async{

    if(this.pictureFile == null) return null;

    final url = Uri.parse('https://api.cloudinary.com/v1_1/dvdig5du5/image/upload?upload_preset=mwgtista');
    final imageUploadRequest = http.MultipartRequest('POST', url);
    final file = await http.MultipartFile.fromPath('file', pictureFile!.path);
    imageUploadRequest.files.add(file);
    final streamResponse = await imageUploadRequest.send();
    final resp = await http.Response.fromStream(streamResponse);
    if(resp.statusCode != 200 && resp.statusCode != 201) {
      print('Algo salio mal');
      return null;
    }
    
    final decodedData = jsonDecode(resp.body);
    return decodedData['secure_url'];
  }
 
}