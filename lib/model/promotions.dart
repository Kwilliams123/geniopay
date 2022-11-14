class Promotions {
  late String title;
  late String description;
  late String svg;

  Promotions({required this.title,
    required this.description, this.svg = 'message' });

  Promotions.fromJson(Map<String, dynamic> data){
    title  = data['title'];
    description = data['description'];
    svg = data['svg'];
  }

  Map<String, dynamic> toJson(){
    return {
      'title' : title,
      'description': description,
      'svg': svg,
    };
  }
}