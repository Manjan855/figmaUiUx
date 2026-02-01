class CombinedModel {
  final Map<String, dynamic> data;

  CombinedModel({required this.data});

  factory CombinedModel.fromJson(Map<String, dynamic> json) {
    return CombinedModel(data: json);
  }
}
//  class CombineModel {
//   final Map<String, dynamic> data;
//   CombineModel({required this.data});
//   factory CombineModel.fromJson(Map<String, dynamic>json){return CombineModel(data: json);}
//  }
