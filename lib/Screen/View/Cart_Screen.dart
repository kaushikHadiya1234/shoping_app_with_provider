import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoping_app_with_provider/Screen/Provider/Product_provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  ProductProvider? pt;
  ProductProvider? pf;
  @override
  Widget build(BuildContext context) {
    pt = Provider.of(context, listen: true);
    pf = Provider.of(context, listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "My Cart",
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
          centerTitle: true,
          leading: IconButton(onPressed: () {
            Navigator.pop(context);
          }, icon: Icon(Icons.arrow_back_ios_rounded,color: Colors.black,),),
          actions: [
            IconButton(onPressed: () {

            }, icon: Icon(Icons.more_horiz,color: Colors.black,))
          ],
          backgroundColor: Colors.white,
          elevation: 0.2,
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                height: 250,
                width: double.infinity,
                color: Colors.white,
                child: ListView.builder(itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      Container(
                        height: 120,
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: ListTile(
                          leading: Container(
                            height: 120,
                            width: 70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.grey),
                              color: Colors.red
                            ),
                            child: ClipRRect(borderRadius: BorderRadius.circular(15),child: Image.asset("${pf!.CartList[index].img}",fit: BoxFit.fill,)),
                          ),
                          title: Text("${pt!.CartList[index].name}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 70,
                                width: 200,
                                child:  Text("${pt!.CartList[index].data}",style: TextStyle(color: Colors.grey),),
                              ),
                              Text("₹${pf!.CartList[index].price!*pf!.CartList[index].qa!}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18
                              ),),
                            ],
                          ),
                          trailing: IconButton(onPressed: () {
                            pf!.delete(index);
                            }, icon: Icon(Icons.delete,color: Colors.red,)),
                        ),
                      ),
                      SizedBox(
                        height: 120,
                        child: Align(
                          alignment: Alignment(0.9,0.9),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              InkWell(
                                onTap: () {
                                 pf!.decrement(index);
                                },
                                child: Container(
                                    height: 30,
                                    width: 30,
                                    alignment: Alignment(0,-3.5),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.teal),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child:  Icon(Icons.minimize,color: Colors.teal,)
                                ),
                              ),
                              SizedBox(width: 18),
                              Text("${pf!.CartList[index].qa}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                              SizedBox(width: 18),
                              InkWell(
                                onTap: () {
                                  pf!.increment(index);
                                },
                                child: Container(
                                    height: 30,
                                    width: 30,
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
                        ),
                      )
                    ],
                  );
                },itemCount:pt!.CartList.length,),
              ),
            ),
            Expanded(
              child: Container(
                height: 250,
                width: double.infinity,
                color: Colors.white,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 5),
                      Container(margin: EdgeInsets.only(left: 10),alignment: Alignment.centerLeft,child: Text("Have a coupon code ? Enter here 👇 ",style: TextStyle(fontSize: 16),)),
                      SizedBox(height: 5),
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
                      SizedBox(height: 5),
                      Container(
                        margin: EdgeInsets.all(10),
                        height: 120,
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Subtotal",style: TextStyle(fontSize: 18,color: Colors.grey,fontWeight: FontWeight.bold),),
                                Text("₹${pf!.total}.00",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),)
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Delivery Fee",style: TextStyle(fontSize: 18,color: Colors.grey,fontWeight: FontWeight.bold),),
                                Text("₹100.00",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),)
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("DisCount",style: TextStyle(fontSize: 18,color: Colors.grey,fontWeight: FontWeight.bold),),
                                Text("₹${pf!.dp}",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),)
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Text("-----------------------------------------------",style: TextStyle(fontSize: 30,color: Colors.grey),),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10,right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Total",style: TextStyle(fontSize: 20,color: Colors.grey,fontWeight: FontWeight.bold),),
                            Text("₹${pf!.fp}.00",style: TextStyle(fontSize: 22,color: Colors.teal,fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        height:50,
                        margin: EdgeInsets.only(left: 25,right: 25),
                        width: double.infinity,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.teal
                        ),
                        child: Text("Go to Pay",style: TextStyle(fontSize: 20,color: Colors.white),),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
