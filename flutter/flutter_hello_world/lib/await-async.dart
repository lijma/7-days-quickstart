// This example shows how *not* to write asynchronous Dart code.

Future<String> createOrderMessage() async {
  var order = await fetchUserOrder();
  return 'Your order is: $order';
}

Future<String> createOrderMessage2() async {
  var order = fetchUserOrder();
  return order.then((value) => 'Your order is: $order');
}

Future<String> fetchUserOrder() async =>
    // Imagine that this function is more complex and slow.
Future.delayed(
  const Duration(seconds: 2),
      () => 'Large Latte',
);

void main() async {
  print(await createOrderMessage());
}