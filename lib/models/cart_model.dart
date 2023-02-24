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
  String? orderId;
  String? status;
  CartModel({this.id,required this.name,required this.image,this.brand,this.size,this.colorFamily,this.price,this.qty,this.selected,this.orderId,this.status});
}