import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shop_app/models/http_exception.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;

  Product({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.imageUrl,
    this.isFavorite = false,
  });

  Future<void> toggleFavoriteStatus(String prodId, String token) async {
    final url =
        'https://flutter-shop-5e8cd.firebaseio.com/products/$id.json?auth=$token';
    final oldStatus = isFavorite;
    isFavorite = !isFavorite;
    notifyListeners();
    try {
      final response = await http.patch(
        url,
        body: json.encode(
          {'isFavorite': isFavorite},
        ),
      );
      if (response.statusCode >= 400) {
        isFavorite = oldStatus;
        notifyListeners();
        throw HttpException('Could not update favorite status');
      }
    } catch (error) {
      print(error);
      throw error;
    }
  }
}
