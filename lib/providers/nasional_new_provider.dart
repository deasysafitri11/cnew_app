import 'dart:convert';

import 'package:cnew_app/models/nasional_news_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NasionalNewProvider with ChangeNotifier {
  List<NasionalNewsModel> _nasionalList = [];
  bool _isLoading = false;

  List<NasionalNewsModel> get nasionalList => _nasionalList;
  bool get isLoading => _isLoading;

  Future<void> fetchNasionalNews() async {
    _isLoading = true;
    notifyListeners();

    final url =
        Uri.parse('https://api-berita-indonesia.vercel.app/cnn/ekonomi/');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body)['data'];
        _nasionalList = [NasionalNewsModel.fromJson(data)];
      }
    } catch (error) {
      rethrow;
    }

    _isLoading = false;
    notifyListeners();
  }
}
