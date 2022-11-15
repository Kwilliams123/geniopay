class Promotions {
  late int id;
  late String title;
  late String description;
  late String srcImage;

  Promotions({required this.id, required this.title,
    required this.description, this.srcImage = 'promotion_image' });

  Promotions.fromJson(Map<String, dynamic> data){
    id   = data['id'];
    title  = data['title'];
    description = data['description'];
    srcImage = data['src_image'] ?? 'promotion_image';
  }

  Map<String, dynamic> toJson(){
    return {
      'id': id,
      'title' : title,
      'description': description,
      'src_image': srcImage,
    };
  }
}