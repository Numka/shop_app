import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/order_item_card.dart';
import '../providers/orders.dart';

class OrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ordersData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Order'),
      ),
      body: ListView.builder(
        itemCount: ordersData.orders.length,
        itemBuilder: (ctx, i) => OrderItemCard(
          ordersData.orders[i],
        ),
      ),
    );
  }
}
