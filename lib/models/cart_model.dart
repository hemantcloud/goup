class CartModel{
  int? id;
  String? name;
  String? image;
  String? brand;
  String? size;
  String? colorFamily;
  String? price;
  int? qty;
  bool? selected;
  CartModel({required this.id,required this.name,required this.image,this.brand,this.size,this.colorFamily,required this.price,required this.qty,required this.selected});
}