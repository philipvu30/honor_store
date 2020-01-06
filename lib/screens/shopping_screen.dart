import 'package:flutter/material.dart';

class ShoppingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Shopping Cart',
        ),
      ),
      body: ShoppingBody(),
    );
  }
}

class ShoppingBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ItemWidget(),
          ItemWidget(),
          ItemWidget(),
          addressWidget(),
        ],
      ),
    );
  }

  Widget addressWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(
          'Địa chỉ',
          textAlign: TextAlign.left,
        ),
        Card(
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
                'Nguyen Van Qua, P. Dong Hung Thuan, Q.12, TPHCM\nNguyen Van Qua, P. Dong Hung Thuan, Q.12, TPHCM\nNguyen Van Qua, P. Dong Hung Thuan, Q.12, TPHCM'),
          ),
          color: Colors.white70,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 5,
        ),
        SizedBox(
          height: 8.0,
        ),
        checkOutWidget(),
      ],
    );
  }

  Widget checkOutWidget() {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Text(
            'Tổng: 150.000VND',
            textAlign: TextAlign.left,
          ),
        ),
        Expanded(
          flex: 1,
          child: RaisedButton(
            onPressed: () {},
            child: Text('Thanh toán'),
          ),
        ),
      ],
    );
  }
}

class ItemWidget extends StatefulWidget {
  @override
  _ItemWidgetState createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      child: Row(
        textBaseline: TextBaseline.alphabetic,
        children: <Widget>[
          Flexible(
            flex: 1,
            child: Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Image.asset(
                'assets/graphics/gung_ha_tho_2.jpg',
                fit: BoxFit.fill,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 5,
            ),
          ),
          Flexible(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  'Rượu gừng nghệ hạ thổ',
                  textAlign: TextAlign.start,
                ),
                Text(
                  '100 ml',
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
          Flexible(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Align(
                  alignment: Alignment.centerRight,
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.add),
                      ),
                      Text('1'),
                      IconButton(
                        icon: Icon(Icons.remove),
                      ),
                    ],
                  ),
                ),
                Text(
                  '100.000 VND',
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
