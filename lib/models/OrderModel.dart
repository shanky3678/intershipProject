class OrderModel {
  String name;
  int productId;
  int orderId;
  int userId;

  OrderModel({this.name, this.orderId, this.productId, this.userId});

  OrderModel.formJson(Map<String, dynamic> json) {
    name = json['name'];
    orderId = json['orderId'];
    productId = json['productId'];
    userId = json['userId'];
  }
}
