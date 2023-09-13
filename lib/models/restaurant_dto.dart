class Restaurant {
  int id;
  String name;
  String address;
  Restaurant({required this.id, required this.name, required this.address});

  factory Restaurant.loadJson(Map<String, dynamic> data) {
    int idValue = data["id"];
    String nameValue = data["name"];
    String addressValue = data["address"];
    return Restaurant(id: idValue, name: nameValue, address: addressValue);
  }
}