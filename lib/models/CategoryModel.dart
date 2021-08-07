class CategoryModel {
  String name;
  String slug;
  String imageUrl;
  String discription;
  String price;
  int productId;

  CategoryModel({this.name, this.slug, this.imageUrl, this.productId});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    slug = json['slug'];
    productId = json['productId'];
    imageUrl = json['productImages'];
    discription = json['productDiscription'];
    price = json['productPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['productImages'] = this.imageUrl;
    data['productDiscription'] = this.discription;
    data['productPrice'] = this.price;
    data['productId'] = this.productId;
    return data;
  }
}
