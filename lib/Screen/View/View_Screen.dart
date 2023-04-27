import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoping_app_with_provider/Screen/Provider/Product_provider.dart';

class ViewScreen extends StatefulWidget {
  const ViewScreen({Key? key}) : super(key: key);

  @override
  State<ViewScreen> createState() => _ViewScreenState();
}

class _ViewScreenState extends State<ViewScreen> {

  ProductProvider? pt;
  ProductProvider? pf;

  @override
  Widget build(BuildContext context) {
    pt = Provider.of(context, listen: true);
    pf = Provider.of(context, listen: false);
    int index = ModalRoute.of(context)!.settings.arguments as int ;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height:330,
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          IconButton(onPressed: () {
                            Navigator.pop(context);
                          }, icon: Icon(Icons.arrow_back_ios_rounded,color: Colors.black,))
                        ],
                      ),
                    ),
                    Container(
                      height: 200,
                      width: 200,
                      child: Image.asset("${pf!.ProductList[index].img}",fit: BoxFit.fill,),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.circle,color: Colors.grey,size: 10,),
                        SizedBox(width: 5),
                        Icon(Icons.circle,color: Colors.grey,size: 10,),
                        SizedBox(width: 5),
                        Icon(Icons.circle,color: Colors.grey,size: 10,),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                height: 500,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40)),
                  color: Colors.grey[200]
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0,right: 12,top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 30,
                            width: 120,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.teal
                            ),
                            child: Text("Free Shopping",style: TextStyle(color: Colors.white,fontSize: 15),),
                          ),
                          Container(height:40,width: 40,decoration: BoxDecoration(
                            shape: BoxShape.circle,border: Border.all(color: Colors.grey)
                          ),
                            child:IconButton(
                                onPressed: () {
                                  pf!.like(index);
                                },
                                icon: Icon(
                                    pf!.ProductList[index].like == true
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: pf!.ProductList[index].like == true
                                        ? Colors.red.shade400
                                        : Colors.black))
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(margin: EdgeInsets.only(left: 10),alignment: Alignment.centerLeft,child: Text("${pf!.ProductList[index].name}",style: TextStyle(fontSize: 30,color: Colors.black,fontWeight: FontWeight.bold),)),
                    Container(
                      margin: EdgeInsets.all(10),
                      height: 80,
                      width: double.infinity,
                      child: Text("${pf!.ProductList[index].datal}",style: TextStyle(fontSize: 15),),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("₹${pf!.ProductList[index].price!*pf!.ProductList[index].qa!}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                height: 38,
                                width: 38,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.black)
                                ),
                                child: Icon(Icons.circle,size: 35,color: Colors.black,),
                              ),
                              SizedBox(width: 5),
                              Icon(Icons.circle,size: 35,color: Colors.grey,),
                              SizedBox(width: 5),
                              Icon(Icons.circle,size: 35,color: Colors.grey,),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(margin: EdgeInsets.only(left: 10),alignment: Alignment.centerLeft,child: Text("Have a coupon code ? Enter here 👇 ",style: TextStyle(fontSize: 16),)),
                    Container(
                      height: 50,
                      width: double.infinity,
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("AXDSFR",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("Available",style: TextStyle(fontSize: 18,color: Colors.teal),),
                                SizedBox(width: 5),
                                Icon(Icons.cloud_done_rounded,color: Colors.teal,)
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0,top: 40,right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              InkWell(
                                onTap: () {
                                  pf!.decrementv(index);
                                },
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  alignment: Alignment.topCenter,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.teal),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Icon(Icons.minimize,color: Colors.teal,)
                                ),
                              ),
                              SizedBox(width: 18),
                              Text("${pf!.ProductList[index].qa}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                              SizedBox(width: 18),
                              InkWell(
                                onTap: () {
                                  pf!.incrementv(index);
                                },
                                child: Container(
                                    height: 40,
                                    width: 40,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.teal),
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.teal
                                    ),
                                    child: Icon(Icons.add,color: Colors.white,)
                                ),
                              )
                            ],
                          ),
                          FloatingActionButton.extended(onPressed: () {
                            pf!.CartList.add(pf!.ProductList[index]);
                            ScaffoldMessenger.of(context)!.showSnackBar(SnackBar(content: Text("Add to Sucessfully"),backgroundColor: Colors.teal[200],behavior: SnackBarBehavior.floating,));
                          },label: Text("Add to cart"),backgroundColor: Colors.teal,)
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
