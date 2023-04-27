
import 'package:flutter/widgets.dart';
import 'package:shoping_app_with_provider/Screen/Model/Product_Model.dart';

class ProductProvider extends ChangeNotifier
{
  List<Product> LogoList = [
    Product(img: "assets/images/l1.jpg",name: "Bluetooth"),
    Product(img: "assets/images/l2.jpg",name: "smart watch"),
    Product(img: "assets/images/l3.jpg",name: "mobile"),
    Product(img: "assets/images/l4.jpg",name: "Air pods"),
    Product(img: "assets/images/l5.jpg",name: "Speaker"),
  ];

  List<ProductModel> ProductList = [
    ProductModel(name: 'Lenovo IdeaPad',img:'assets/images/p1.jpg',qa: 1,price: 28490, data: 'Lenovo IdeaPad Slim 3 Intel Celeron N4020 4th Gen 15.6" (39.62cm) HD',datal: 'Lenovo IdeaPad Slim 3 Intel Celeron N4020 4th Gen 15.6" (39.62cm) HD Thin & Light Laptop (8GB/256GB SSD/Windows 11/Office 2021/2Yr Warranty/3months Game Pass/Platinum Grey/1.7Kg), 81WQ00MQIN'),
    ProductModel(name: 'vivo V23e 5G',img:'assets/images/p2.jpg',price: 24999,qa: 1,data: 'Indulge In Unlimited Entertainment With The Vivo V23e Smartphone.',datal: 'Indulge In Unlimited Entertainment With The Vivo V23e Smartphone. Furthermore, This Mobile Phone Is Powered By Mediatek Dimensity 810 Processor That Allows You To Enjoy A ...'),
    ProductModel(name: 'Alexa Speaker',img:'assets/images/p3.jpg',price: 4500,qa: 1,data: 'Our Most Popular Smart Speaker - Comes in a refreshed design and delivers loud',datal: 'Our Most Popular Smart Speaker - Comes in a refreshed design and delivers loud, crisp sound with powerful bass. Stream Millions of Songs - From apps like Amazon Prime Music ...'),
    ProductModel(name: 'call Smart watch',img :'assets/images/p4.jpg',price: 1799,qa: 1,data: 'Wave Call comes with a premium built-in speaker and bluetooth calling',datal: 'Wave Call comes with a premium built-in speaker and bluetooth calling which you can stay connected to your friends, family, and colleagues Its dial pad is super responsive and ...'),
    ProductModel(name: 'Curved Monitor',img: 'assets/images/p5.jpg',price: 68190,qa: 1,data: 'Immersion is everything. Become immersed in the game with this huge ',datal: 'Immersion is everything. Become immersed in the game with this huge 49" DFHD 1800R curved monitor. Take your gaming to new horizons and beyond with AMD Radeon FreeSync 2 and a ...'),
    ProductModel(name: 'Remote Lite',img: 'assets/images/p6.jpg',price: 2999,qa: 1,data: 'Our most affordable Fire TV stick - Enjoy fast streaming in Full HD',datal: 'Our most affordable Fire TV stick - Enjoy fast streaming in Full HD. Access to more than a million movies and TV show episodes from Prime Video, Netflix, Disney+ Hotstar, ZEE5 ...'),
    ProductModel(name: 'Gaming Earbuds',img: 'assets/images/i1.jpg',price: 799,qa: 1,data: 'GAMING MODE Dedicated Gaming mode that offers Lowest ever latency of 65ms',datal: 'GAMING MODE Dedicated Gaming mode that offers Lowest ever latency of 65ms for lag-free gaming experience. LED POWER LEVEL INDICATOR Phantom Case features LED lights that ..'),
    ProductModel(name: 'headphones',img: 'assets/images/i2.jpg',price: 2499,qa: 1,data: 'Colour:Buoyant Black boAt Rockerz 370 is a wireless headset that has',datal: 'Colour:Buoyant Black boAt Rockerz 370 is a wireless headset that has been ergonomically designed to meet the needs of music lovers. The headphones come equipped with latest ...'),
    ProductModel(name: 'Mouse',img: 'assets/images/i3.jpg',price: 999,qa: 1,data: 'Make your working experience hitherto unforeseen with the Toad One',datal: 'Make your working experience hitherto unforeseen with the Toad One wireless optical mouse. Its multiple connectivity options - Bluetooth connectivity feature and USB nano ...'),
    ProductModel(name: 'Gamepad',img: 'assets/images/i4.jpg',price: 1599,qa: 1,data: 'Lithium Polymer 600mAh battery for playing up to 12 hours in a row.',datal: 'Lithium Polymer 600mAh battery for playing up to 12 hours in a row. Wireless 2.4GHz technology with a range of up to 8 meters. Find electronics, fashion, accessories, grocery ..'),
    ProductModel(name: 'MPC Studio',img:'assets/images/i5.jpg',price: 12999,qa: 1,data: 'The Akai Professional MPC Studio MIDI Controller is the ultimate music',datal: 'The Akai Professional MPC Studio MIDI Controller is the ultimate music production hub for your computer, fitted with 16 ultra-responsive MPC pads with a built-in colour LCD ..'),
    ProductModel(name: 'One plus',img:'assets/images/i6.jpg',price: 19999,qa: 1,data: 'Touchscreen Is Yes. In The Box Is Phone,sim Tray Ejector, Adapter, Phone',datal: 'Touchscreen Is Yes. In The Box Is Phone,sim Tray Ejector, Adapter, Phone Case, Usb Cable. Otg Compatible Is Yes. Model Name Is Nord Ce 2 Lite 5g. Browse Type Is Smartphones ..' ),
  ];
  List<ProductModel> ProductList1 = [
  ];

  List<ProductModel> CartList = [];
  int i = 0;
  int dp=0;
  int total=0;
  int fp=0;


  void increment(int index)
  {
    ProductModel f = CartList[index];

    ProductModel update =ProductModel(name: f.name,img: f.img,data: f.data,datal: f.datal,price: f.price,qa: f.qa!+1);

    CartList[index]= update;
    totalprice();

    notifyListeners();
  }

  void like(int index)
  {
      if (ProductList[index].like == true) {
        ProductModel s = ProductList[index];
        ProductModel update = ProductModel(
            img: s.img,
            // type: s.type,
            price: s.price,
            qa: s.qa,
            like: ProductList[index].like = false,
            name: s.name,
            data: s.data,
            datal: s.datal
        );
        ProductList[index] = update;
        // like.removeAt(index);
        notifyListeners();
        // productlist[index].like=false;
      } else {
        ProductModel s = ProductList[index];
        ProductModel update = ProductModel(
            img: s.img,
            // type: s.type,
            price: s.price,
            qa: s.qa,
            like: ProductList[index].like = true,
            name: s.name,
            data: s.data,
            datal: s.datal
        );
        ProductList[index] = update;
        // like.removeAt(index);
        notifyListeners();
        // productlist[index].like=false;
      }
  }

  void incrementv(int index)
  {
    ProductModel f = ProductList[index];

    ProductModel update =ProductModel(name: f.name,img: f.img,data: f.data,datal: f.datal,price: f.price,qa: f.qa!+1);

    ProductList[index]= update;
    totalprice();

    notifyListeners();
  }


  void decrement(int index)
  {
    ProductModel f = CartList[index];

    if(f.qa==1)
    {
      delete(index);
    }
    else
    {
      ProductModel update =ProductModel(name: f.name,img: f.img,data: f.data,datal: f.datal,price: f.price,qa: f.qa!-1);

      CartList[index]= update;
      totalprice();

    }

    notifyListeners();
  }
  void decrementv(int index)
  {
    ProductModel f = ProductList[index];
    if(f.qa!>=2)
    {
      ProductModel update =ProductModel(name: f.name,img: f.img,data: f.data,datal: f.datal,price: f.price,qa: f.qa!-1);

      ProductList[index]= update;
      totalprice();
    }
    notifyListeners();
  }

  void delete(int index)
  {
    CartList.removeAt(index);
    totalprice();
    notifyListeners();
  }

  void totalprice()
  {
    total=0;
    for(int i=0; i<CartList.length;i++)
    {
      total += CartList[i].price! * CartList[i].qa!;
    }
    dp = total * 10~/100;

    fp = total + 100 -dp;

    notifyListeners();
  }
  void ChangeValue(int value)
  {
    i=value;
    notifyListeners();
  }

  void add(int index)
  {
    ProductList1.add(ProductList[index]);
    notifyListeners();
  }

}