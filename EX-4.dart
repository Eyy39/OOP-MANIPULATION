enum Delivery {delivered, pickUp}

class Products{
  String id;
  String name;
  double price;

  Products(this.id, {required this.name, required this.price});
}

class Customer{
  String id;
  String name;
  String? address;
  
  Customer({required this.id, required this.name, this.address});
  Customer.guest({required this.id}): name = 'User', address  = null;
}
class OrderItem{
  Products product;
  int? qty;

  OrderItem({required this.product, this.qty = 1});

  double get subTotal => product.price * (qty ?? 1);
}

class Orders{
  String id;
  Customer customer;
  List<OrderItem> items;
  Delivery delivery;

  Orders({required this.id, required this.customer, required this.items, required this.delivery});

  double calculateTotal(){
    double total = 0.0;
    for(var item in items){
      total += item.subTotal;
    }
    if(delivery == Delivery.delivered){
      total += 2;
    }
    return total;
  }
}

void main(){
  Products p1 = Products('p001', name: 'Coca', price: 1.5);
  Products p2 = Products('p002', name: 'Soda', price: 2.5);
  Products p3 = Products('p003', name: 'Sting', price: 1.5);

  Customer c1 = Customer(id: 'C001', name: 'Thida');
  Orders order =Orders(id: 'P001', customer: c1, items: [OrderItem(product: p1), OrderItem(product: p2, qty: 2)], delivery: Delivery.pickUp);
  for(var item in order.items){
    print('${item.product.name}: \$${item.product.price} x ${item.qty} = \$${item.subTotal}');
  }
  print('Total Amount: \$${order.calculateTotal()}');

}