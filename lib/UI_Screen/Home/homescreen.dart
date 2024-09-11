import 'package:coffeewithcoin/Bloc/TabsBloc/tabbloc.dart';
import 'package:coffeewithcoin/Bloc/TabsBloc/tabevent.dart';
import 'package:coffeewithcoin/UI_Screen/Home/WidgetItems/tab2.dart';
import 'package:coffeewithcoin/UI_Screen/Home/WidgetItems/tab3.dart';
import 'package:coffeewithcoin/UI_Screen/Home/WidgetItems/tab4.dart';
import 'package:coffeewithcoin/UI_Screen/Home/WidgetItems/tab5.dart';
import 'package:flutter/material.dart';
import 'package:coffeewithcoin/UI_Screen/Home/WidgetItems/tab1.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class Home extends StatefulWidget {
   const Home({super.key});

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> with SingleTickerProviderStateMixin {
late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 5, vsync: this);
    context.read<CoinBloc>().add(FetchCoinDataApi());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        
        leading: IconButton(icon:const Icon(Icons.notifications,color: Colors.white,) ,onPressed: (){},),
      
        title:const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.cookie),
            SizedBox(width: 8,),
            Text('Coffee With Coin',style: TextStyle(color: Colors.white),)
          ],
        ),
        centerTitle: true,
        actions:[
        IconButton(icon:const Icon(Icons.air,color: Colors.white) ,onPressed: (){}),
         IconButton(icon:const Icon(Icons.search,color: Colors.white) ,onPressed: (){}),

        ],

        
bottom: TabBar(
          controller: _controller,
          isScrollable: true,
          indicatorColor: Colors.orange,
          unselectedLabelStyle:const TextStyle(color: Colors.grey),
          labelStyle: const TextStyle(color: Colors.orange), 
          dividerColor: Colors.black,
          
  tabs: const [
            Tab(text: 'Cryptocurrency',),
            Tab(text: 'NFT',),
            Tab(text: 'Categories',),
            Tab(text: 'Exchanges',),
            Tab(text: 'Derivation',),
        
]),
        
      ),

      bottomNavigationBar:BottomNavigationBar(
        currentIndex: 1,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 10,
        unselectedFontSize: 7,
        backgroundColor: Colors.black,
        
        
        items: const [
          
        
        BottomNavigationBarItem(
          backgroundColor: Colors.black,icon: Icon(Icons.mark_email_read_outlined),
        label: 'Market'),
           BottomNavigationBarItem( backgroundColor: Colors.black,icon: Icon(Icons.mark_email_read_outlined),
        label: 'Portfolio'),
           BottomNavigationBarItem(backgroundColor: Colors.black,icon: Icon(Icons.mark_email_read_outlined),
        label: 'Search'),
           BottomNavigationBarItem(backgroundColor: Colors.black,icon: Icon(Icons.mark_email_read_outlined),
        label: 'Explor'),
           BottomNavigationBarItem(backgroundColor: Colors.black,icon: Icon(Icons.mark_email_read_outlined),
        label: 'More'),
        
      
      ],),

      body: DefaultTabController(
        length: 6,

        child: TabBarView(
             controller: _controller,
          children:const [
              Itemone(),
              ItemTwo(),
              ItemThree(),
              ItemFour(),
              ItemFive()
              
             
               
        ],),
      ),
     

   
     
    );
  }
}






