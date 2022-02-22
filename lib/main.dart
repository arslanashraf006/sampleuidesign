import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Cart(),
    );
  }
}
class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    final Size size= MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Icon(Icons.arrow_back_ios),
                SizedBox(width: 5.0,),
                Expanded(child: Text('Cart',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25.0),)),
                Text('4 items',style: TextStyle(color: Colors.red,fontSize: 20.0),),
              ],),
          ),
          Container(
            height: 450.0,
            child: ListView.separated(
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) => scrollcard(),
                separatorBuilder: (context,index) => SizedBox(width: 5,),
                itemCount: 4),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Icon(Icons.money),
                SizedBox(width: 5.0,),
                Text('Apply discount code',style: TextStyle(color: Colors.red),),
              ],
            ),
          ),
          ElevatedButton(
              onPressed: (){},
              child: Text('Proceed to checkout',),
              style: ButtonStyle(),
          ),
        ],
      ),
      ),
    );
  }
}

class scrollcard extends StatelessWidget {
  const scrollcard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.0,

      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 100,
            child: Row(
              children: [
                Card(
                  margin: EdgeInsets.symmetric(vertical: 20.0,horizontal: 20.0),
                  child: Image.network('https://www.nestle-cereals.com/my/sites/g/files/fawtmp381/files/styles/scale_992/public/d7/koko-crunch_1.png?itok=oaUQvETS'),
                ),
                Expanded(child: Text('Nestle Coco Krunch Duo\n(Kids Pack)')),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  textBaseline: TextBaseline.ideographic,
                  children: [
                    Text('Rs:550'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.minimize,color: Colors.red,),
                        Text('5'),
                        Icon(Icons.add,color: Colors.red,),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
