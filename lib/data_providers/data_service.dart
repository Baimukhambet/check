class MenuProvider {
  Future<Map<String, dynamic>> fetchMenu() async {
    await Future.delayed(Duration(milliseconds: 200));

    return {
      "1": {
        "name": "Burger",
        "image":
            "https://www.shutterstock.com/image-photo/classic-hamburger-stock-photo-isolated-600nw-2282033179.jpg",
        "category": "Hot",
        "price": 5,
      },
      "2": {
        "name": "Oreo Bubble Tea",
        "image":
            "https://myveganminimalist.com/wp-content/uploads/2022/05/Oreo-Bubble-Milk-Tea-Boba-12.jpg",
        "category": "Drinks",
        "price": 20,
      },
      "3": {
        "name": "Steak",
        "image":
            "https://natashaskitchen.com/wp-content/uploads/2020/03/Pan-Seared-Steak-4.jpg",
        "category": "Hot",
        "price": 100,
      },
      "4": {
        "name": "Bal Tort",
        "image":
            "https://dariasaveleva.com/wp-content/uploads/2018/08/Medovy-j-tort-819x1024.jpg",
        "category": "Snacks",
        "price": 8,
      },
    };
  }
}
