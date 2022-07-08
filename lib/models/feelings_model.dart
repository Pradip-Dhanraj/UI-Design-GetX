class Feelings {
  double? percentage;
  String? label;
  String? icon;

  Feelings({this.percentage, this.label, this.icon});

  Feelings.fromJson(Map<String, dynamic> json) {
    percentage = json['percentage'];
    label = json['label'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['percentage'] = this.percentage;
    data['label'] = this.label;
    data['icon'] = this.icon;
    return data;
  }
}
