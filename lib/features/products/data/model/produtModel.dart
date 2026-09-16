class ProductModel {
  final int id;
  final String title;
  final String description;
  final String category;
  final String image;
  final Rating rating;
  final num price;

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.rating,
    required this.category,
    required this.price,
    required  this.image,
  });

  factory ProductModel.fromJson(Map<String,dynamic> json)=>ProductModel(
    title: json['title'],
    category: json['category'],
    id: json['id'],
    description: json['description'],
    image: json['image'],
    price: json['price'],
    rating: Rating.fromJson(json['rating']),
  );

  Map<String,dynamic> toJson()=>{
    "id":id,
    "rating":rating,
    "price":price,
    "image":image,
    "description":description,
    "category":category,
    "title":title,
  };
}


class Rating{
  final num count;
  final num rate;
  Rating({required this.count,required this.rate});

  factory Rating.fromJson(Map<String,dynamic> json)=>Rating(
      rate: json['rate'],
      count: json['count'],
  );

  Map<String,dynamic> toJson()=>{
    "count":count,
    "rate":rate,
  };

}