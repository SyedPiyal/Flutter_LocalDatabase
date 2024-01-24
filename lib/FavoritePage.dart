
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavoritePage extends StatefulWidget{
  const FavoritePage({super.key, required this.title});
  final String title;
  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage>{

  final List _selectedIndexs=[];

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
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Shopping",style: TextStyle(fontSize: 30)),
                  Text("Cart",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold)),
                ],),
              Icon(Icons.delete)
            ],),
            Container(margin: const EdgeInsets.symmetric(vertical: 20),
              height: 300,
              child: ListView.builder(
                itemCount: 8,
                itemBuilder: (BuildContext context, int index){
                  final _isSelected=_selectedIndexs.contains(index);
                  return Ink(
                    child: InkWell(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Container(
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Colors.white,
                          ),
                          child:  const Column(
                            children: [
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
                                Image(image: AssetImage("assets/images/shoes.png"), width: 100, height: 100),
                                Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text("Nike Air Max 200",style: TextStyle(fontWeight: FontWeight.bold),),
                                    Padding(
                                      padding: EdgeInsets.only(top: 5,bottom: 15),
                                      child: Row(children: [
                                        Text('\$',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 10,color: Colors.deepOrange),),
                                        Text("240.00",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 23),),
                                      ],),
                                    ),

                                  ],
                                ),
                                Icon(Icons.one_x_mobiledata),

                              ]),

                            ],
                          ),
                        ),
                      ),
                      onTap: (){
                        setState(() {
                          if(_isSelected){
                            //_selectedIndexs.remove(index);

                          }else{
                            //_selectedIndexs.add(index);

                          }
                          //_containerColor = Colors.redAccent;
                        });
                      },
                    ),
                  );
                },
                // This next line does the trick.
                scrollDirection: Axis.vertical,

              ),),

            Container(
              height: 2,color: const Color(0xFFf3f3f2),
            ),
            const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("3 items"),
                Text("\$ 350",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
              ],
            ),
            ElevatedButton(
              onPressed: () {
              },
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        10,
                      )),
                  minimumSize: const Size(216, 40),
                  foregroundColor: Colors.white,
                  // Text Color (Foreground color)
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  backgroundColor: Colors.deepOrangeAccent),
              child: const Text("Next",style: TextStyle(fontSize: 15)),
            ),

          ],
        ),
      ),
    );


  }
}