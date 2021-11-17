

class Component {
  String? img;
  String? title;
  int? available;
  int? total;

  Component({this.img, this.title, this.available, this.total});

  Component.fromJson(Map<String, dynamic> json) {
    img = json['img'];
    title = json['title'];
    available = json['available'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['img'] = this.img;
    data['title'] = this.title;
    data['available'] = this.available;
    data['total'] = this.total;
    return data;
  }
}