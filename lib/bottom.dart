import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';


void main() => runApp(const MyApp());
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Myhome(),
    );
  }
}
class CardItem{
  final IconData iconimage;
  final String title;
  const  CardItem({required this.iconimage,required this.title,});
}
class CardScreen{
  final String Url;
  final String Label;
  final String Smalllabel;
  CardScreen({required this.Url,required this.Label,required this.Smalllabel});
}
class Myhome extends StatefulWidget {
  const Myhome({Key? key}) : super(key: key);

  @override
  _MyhomeState createState() => _MyhomeState();
}

class _MyhomeState extends State<Myhome> {
  List<CardScreen>  cardscreen =[
    CardScreen(Url: 'https://uk.hape.com/media/e4/7f/78/1634833701/E3154_1.jpg',
        Label: 'Cooking Essentials\n',
        Smalllabel: 'Salt, Fresh Sugar, Rice, Knife, Blender, etc.'),
    CardScreen(Url: 'https://cdn.wallpapersafari.com/17/33/qidA1E.jpg',
        Label: 'Fruits and Vegetables Mix\n',
        Smalllabel: 'Mango, Banana, Litchi, Grape, Potato'),
    CardScreen(Url: 'https://uk.hape.com/media/e4/7f/78/1634833701/E3154_1.jpg',
        Label: 'Cooking Essentials\n',
        Smalllabel: 'Salt, Fresh Sugar, Rice, Knife, Blender, etc.'),
  ];
  List<CardItem> carditem = [
    CardItem(iconimage: Icons.food_bank, title: 'Food'),
    CardItem(iconimage: Icons.masks, title: 'Covid-19'),
    CardItem(iconimage: Icons.child_care, title: 'Baby Care'),
    CardItem(iconimage: Icons.electrical_services_outlined, title: 'Appliances'),
    CardItem(iconimage: Icons.food_bank_outlined, title: 'Fruits'),
    CardItem(iconimage: Icons.male, title: 'Men'),
    CardItem(iconimage: Icons.female, title: 'Women'),
  ];

  String Dropdownvalue = 'Allama Iqbal Town, Vehari';
  var items = ['Allama Iqbal Town, Vehari','College Town, Vehari'];

  List<DropdownMenuItem<String>> dropDownMenuItems() {
    List<DropdownMenuItem<String>> dropdownitem = [];
    for(String item in items)
    {
      var newitem = DropdownMenuItem (child: Text(item),value: item,);
      dropdownitem.add(newitem);
    }
    return dropdownitem;
  }
  @override
  Widget build(BuildContext context) {
    final Size size= MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Row(
                children: [
                  Icon(Icons.grid_view,
                    size: 40.0,),
                  Text('Deliver to',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Expanded(
                    child: DropdownButton<String>(
                      value: Dropdownvalue,
                      items: dropDownMenuItems(), onChanged: (String? newValue) {
                      setState(() {
                        Dropdownvalue = newValue!;
                      });
                    },
                    ),
                  ),
                  Icon(Icons.search,
                    size: 40.0,),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text.rich(
                    TextSpan(
                      text: 'Get your',
                      style: TextStyle(fontSize: 25.0,), // default text style
                      children: <TextSpan>[
                        TextSpan(text: ' groceries\n', style: TextStyle(fontWeight: FontWeight.bold,)),
                        TextSpan(text: 'delivered quickly',),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 140,
                child: ListView.separated(
                  padding: EdgeInsets.all(10.0),
                  scrollDirection: Axis.horizontal,
                  itemCount: 7,
                  separatorBuilder: (context,index)=> SizedBox(width: 10.0,),
                  itemBuilder: (context,index)=> buildcard(carditem: carditem[index]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text('Bundle Offer',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,),)),
                    Align(
                        alignment: Alignment.topRight,
                        child: Text('View all',style: TextStyle(fontSize: 15,color: Colors.red),)),
                  ],
                ),
              ),
              Container(
                height: 250,
                child: ListView.separated(
                    padding: EdgeInsets.all(10.0),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => buildcardscreen(cardscreen: cardscreen[index]),
                    separatorBuilder: (context, index)=> SizedBox(width: 10.0,),
                    itemCount: 3),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text('Popular',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),)),
                    Align(
                        alignment: Alignment.topRight,
                        child: Text('View all',style: TextStyle(fontSize: 15,color: Colors.red),)),
                  ],
                ),
              ),
              Container(
                height: 200,
                child: ListView.separated(
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) => flowcardview(),
                    separatorBuilder: (context,index) =>SizedBox(width: 3,),
                    itemCount: 4),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.large(
        backgroundColor: Colors.red.shade800,
        onPressed: (){},
        child: Icon(Icons.shopping_bag),),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        elevation: 50.0,
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 100.0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.home,size: 40.0,),
                Icon(Icons.search,size: 40.0,),
                SizedBox.shrink(),
                Icon(Icons.history,size: 40.0,),
                Icon(Icons.person,size: 40.0,),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildcardscreen({required CardScreen cardscreen}) => Container(
    width: 200.0,
    child: SizedBox(
      width: 200,
      height: 200,
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 4/3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.network(cardscreen.Url,
                color: Colors.grey,
                colorBlendMode: BlendMode.multiply,),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text.rich(TextSpan(
              children: [
                TextSpan(text: cardscreen.Label,style: TextStyle(fontSize: 12.0,fontWeight: FontWeight.bold),),
                TextSpan(text: cardscreen.Smalllabel,style: TextStyle(fontSize: 12.0)),
              ],
            )),
          ),
          SizedBox(height: 5.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Rs:256',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),),
              Icon(Icons.add,color: Colors.red,),
            ],
          ),
        ],
      ),
    ),
  );
  Widget buildcard({required CardItem carditem}) => Container(
    width: 100.0,
    child: Column(
      children: [
        CircleAvatar(
          radius: 50.0,
          backgroundColor: Colors.grey,
          child: Icon(
            carditem.iconimage,size: 100,),),
        Text(carditem.title,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w800),),
      ],
    ),
  );
}

class flowcardview extends StatelessWidget {
  const flowcardview({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,

      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        textBaseline: TextBaseline.alphabetic,
        children: [
          SizedBox(
            height: 80,
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
                    Icon(Icons.add,color: Colors.red,),
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

