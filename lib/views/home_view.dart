// lib/views/home_view.dart
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../viewmodels/meal_viewmodel.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Obtener MealViewModel
    final mealViewModel = Provider.of<MealViewModel>(context);

    // Cargar las recetas si no se han cargado aún
    if (!mealViewModel.cargando && mealViewModel.meals.isEmpty) {
      mealViewModel.cargarRecetas();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Receta App'),
      ),
      body: mealViewModel.cargando
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: mealViewModel.meals.length,
              itemBuilder: (context, index) {
                final meal = mealViewModel.meals[index];
                return ListTile(
                  title: Text(meal.nombre),
                  subtitle: Text(meal.descripcion),                  onTap: () {
                    // Mostrar los ingredientes al tocar la receta
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: Text(meal.nombre),
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Ingredientes:'),
                            for (var ingrediente in meal.ingredientes)
                              Text('• $ingrediente'),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}