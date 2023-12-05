import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:futuratask/Usermodel.dart';
import 'package:http/http.dart' as http;

class Userprovider extends ChangeNotifier {
 static const apiurl = 'https://jsonplaceholder.typicode.com/users';

 List<Usermodel> userlist = [];

  bool get isLoading => userlist.isEmpty;

 Future<void>getDataFromAPI() async {
  try {
   final response = await http.get(Uri.parse(apiurl));
   if (response.statusCode == 200) {
    List<dynamic>data = json.decode(response.body);
    userlist = data.map((userJson) => Usermodel.fromJson(userJson)).toList();
    notifyListeners();
   }

   else {
    throw Exception('failed to load');
   }
  }
  catch (error) {
   throw 'failed to load data';
  }
 }
}
