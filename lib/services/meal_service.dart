
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/meal.dart';

class MealService {
  final String _url = 'https://www.themealdb.com/api/json/v1/1/search.php?f=a';

  // Método para obtener las recetas desde la API
  Future<List<Meal>> obtenerRecetas() async {
    final response = await http.get(Uri.parse(_url));

    if (response.statusCode == 200) {
      // Si la solicitud es exitosa, parseamos los datos JSON
      final data = json.decode(response.body);
      
      // Comprobamos si se obtuvieron las recetas
      if (data['meals'] != null) {
        // Convertimos los datos de la respuesta en una lista de objetos Meal
        return (data['meals'] as List).map((meal) {
          return Meal.fromJson(meal);
        }).toList();
      } else {
        return [];
      }
    } else {
      // Si la respuesta es incorrecta, lanzamos un error
      throw Exception('Error al cargar las recetas');
    }
  }
}
