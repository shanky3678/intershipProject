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
}
