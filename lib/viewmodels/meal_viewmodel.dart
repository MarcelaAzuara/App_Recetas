// lib/viewmodels/meal_viewmodel.dart

import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../services/meal_service.dart';

class MealViewModel extends ChangeNotifier {
  final MealService _mealService = MealService();
  List<Meal> _meals = [];
  bool _cargando = false;

  List<Meal> get meals => _meals;
  bool get cargando => _cargando;

  // Cargar las recetas desde la API
  Future<void> cargarRecetas() async {
    _cargando = true;
    notifyListeners(); // Notificamos que estamos cargando

    try {
      _meals = await _mealService.obtenerRecetas();
    } catch (e) {
      _meals = [];
    }

    _cargando = false;
    notifyListeners(); // Notificamos que la carga ha terminado
  }
}
