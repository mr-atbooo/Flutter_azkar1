class CategoryDetailModel {
  int? id;
  int? categoryId;
  String? count;
  String? description;
  String? reference;
  String? content;

  CategoryDetailModel(this.id,this.categoryId, this.count, this.description, this.content,
      this.reference);

  CategoryDetailModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    categoryId = json["category_id"];
    count = json["count"];
    description = json["description"];
    reference = json["reference"];
    content = json["content"];
  }
}