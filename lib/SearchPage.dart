import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget{
  const SearchPage({super.key, required this.title});
  final String title;
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.account_circle_rounded),
            onPressed: () {
              setState(() {
              });
            },
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 20,left: 10,right: 10,bottom: 20),
        child: Column(
          children: <Widget>[
            Container(
              width: 330,
              height: 50,
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    hintText: 'Search Products',
                    filled: true,
                    fillColor: const Color(0xFFf3f3f2),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color(0xFFf3f3f2), width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    //labelText: "01266",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(),
                    )),
                keyboardType: TextInputType.text,
              ),

            ),
            const Padding(
              padding: EdgeInsets.only(top: 20),
              child: Card(
                child: ListTile(
                  leading: Icon(Icons.shopify),
                  title: Text('Search Item'),
                  subtitle: Text('Available'),
                ),
              ),
            ),

          ],
        ),
      ),
    );


  }
}