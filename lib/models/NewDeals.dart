class NewDealsModel {
  String title;
  String discription;

  NewDealsModel({this.title, this.discription});

  NewDealsModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    discription = json['discription'];
  }
}
