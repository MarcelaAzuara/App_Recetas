class Meal {
  final String nombre;
  final String descripcion;
  final List<String> ingredientes;

  Meal({
    required this.nombre,
    required this.descripcion,
    required this.ingredientes,
  });

  // Convertir un Map a un objeto Meal
  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      nombre: json['strMeal'],
      descripcion: json['strInstructions'] ?? 'No hay descripción',
      ingredientes: _obtenerIngredientes(json),
    );
  }

  // Método para obtener los ingredientes de la receta
  static List<String> _obtenerIngredientes(Map<String, dynamic> meal) {
    List<String> ingredientes = [];
    for (int i = 1; i <= 20; i++) {
      String ingrediente = meal['strIngredient$i'];
      if (ingrediente != null && ingrediente.isNotEmpty) {
        ingredientes.add(ingrediente);
      }
    }
    return ingredientes;
  }
}
