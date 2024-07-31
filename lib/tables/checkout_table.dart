import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cart Table',
      home: TableExample(),
    );
  }
}

class TableExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart Table'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Table(
          border: TableBorder.all(),
          children: [
            const TableRow(
              children: [
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        'Product',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(
                        child: Text(
                            'Image',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                    ),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(
                        child: Text(
                          'Product',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                    ),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(
                        child: Text(
                          'Price',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                    ),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(
                        child: Text(
                          'Quantity',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                    ),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(
                        child: Text(
                          'Subtoal',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                    ),
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                TableCell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                      icon: const Icon(Icons.cancel_outlined, color: Colors.red,),
                      onPressed: () {
                        // Implement remove item functionality
                      },
                    ),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/images/heritage11.png',
                      width: 100,
                      height: 100,
                    ),
                  ),
                ),
                const TableCell(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('U-shopper Basket'),
                  ),
                ),
                const TableCell(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('₵1,377.13'),
                  ),
                ),
                QuantityTableCell(),
                // TableCell(
                //   child: Padding(
                //     padding: const EdgeInsets.all(8.0),
                //     child: Text('1'),
                //   ),
                // ),
                const TableCell(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('₵1,377.13'),
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                TableCell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                      icon: const Icon(Icons.cancel_outlined, color: Colors.red,),
                      onPressed: () {
                        // Implement remove item functionality
                      },
                    ),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/images/heritage11.png',
                      width: 100,
                      height: 100,
                    ),
                  ),
                ),
                const TableCell(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('U-shopper Basket'),
                  ),
                ),
                const TableCell(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('₵1,377.13'),
                  ),
                ),
                QuantityTableCell(),
                const TableCell(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('₵1,377.13'),
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                TableCell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(''),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(''),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(''),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(''),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(''),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.brown,
                      child: ElevatedButton(
                        onPressed: () {
                          // Implement apply coupon functionality
                        },
                        child: Text('Update Cart', style: TextStyle(color: Colors.white),),
                        style: ElevatedButton.styleFrom(
                          //fixedSize: const Size(395, 55),
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class QuantityTableCell extends StatefulWidget {
  @override
  _QuantityTableCellState createState() => _QuantityTableCellState();
}

class _QuantityTableCellState extends State<QuantityTableCell> {
  int _quantity = 1;

  void _incrementQuantity() {
    setState(() {
      _quantity++;
    });
  }

  void _decrementQuantity() {
    setState(() {
      if (_quantity > 1) {
        _quantity--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return TableCell(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.remove),
              onPressed: _decrementQuantity,
            ),
            Text('$_quantity'),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: _incrementQuantity,
            ),
          ],
        ),
      ),
    );
  }
}
