class CombinedModel {
  final Map<String, dynamic> data;

  CombinedModel({required this.data});

  factory CombinedModel.fromJson(Map<String, dynamic> json) {
    return CombinedModel(data: json);
  }
}

