class CartModel {
  int? id;
  String? name;

  int? price;

  String? img;
  bool? isExited;
  String? time;
  int? quantity;



  CartModel(
      {this.id,
        this.name,
        this.price,
        this.img,
        this.quantity,
        this.isExited,
        this.time
    });

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    img = json['img'];
    time= json['time'];
    isExited= json['is'];
    quantity = json['quantity'];
  }


}