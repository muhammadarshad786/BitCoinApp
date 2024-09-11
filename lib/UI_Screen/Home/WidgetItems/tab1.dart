import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:coffeewithcoin/Bloc/TabsBloc/tabbloc.dart';
import 'package:coffeewithcoin/Bloc/TabsBloc/tabstate.dart';
import 'package:coffeewithcoin/UI_Screen/DetailedScreen/detaileditem.dart';

class Itemone extends StatelessWidget {
  const Itemone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   double height=MediaQuery.of(context).size.height;
   double width=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocBuilder<CoinBloc, CoinListState>(
        builder: (context, state) {
          if (state is CoinListInitial) {
            return const Center(child: Text("Loading Initial"));
          } else if (state is CoinListLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CoinListLoaded) {
            final coins = state.coins;
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 14),
                  child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(width: width * 0.04),
                               Container(
                  height: height * 0.07,
                  width: width * 0.4,
                                 
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                   color:const Color(0xFF353839),
                  ),
                
                  child: Padding(
                    padding: const EdgeInsets.only(left:14),
                    child: Column(
                    
                     crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                     const Text("GLOBAL MAEKET CAP",style: TextStyle(color: Colors.grey,fontSize: 11),),
                      Text("\$ ${coins[1].marketCap.toString()}",style: TextStyle(color: Colors.white),)

                    ],),
                  ),
                                ),
                            
                              SizedBox(width: width * 0.04),
                              Container(
                                height: height * 0.07,
                                width: width * 0.3,
                             
                                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                      color:const Color(0xFF353839),
                  ),
                                // child: Center(child: Text(coins[1].marketCapChange24H.toString())),
                                   child: Padding(
                    padding: const EdgeInsets.only(left:14),
                    child: Column(
                    
                     crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                     const Text("24H VOLUME",style: TextStyle(color: Colors.grey,fontSize: 11),),
                      Text("\$ ${coins[1].marketCapChange24H.toStringAsFixed(3)}",style: const TextStyle(color: Colors.white),)

                    ],),
                  ),
                              ),
                            ],
                          ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 13),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.04,
                        width: MediaQuery.of(context).size.width * 0.15,
                       
                        decoration: BoxDecoration(borderRadius:BorderRadius.circular(15),  color:const Color(0xFF353839),),
                        child: InkWell(
                          onTap: () {},
                          child: const Center(child:Text("Usd/Btc",style: TextStyle(color: Colors.white),)),
                        ),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.04),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.04,
                        width: MediaQuery.of(context).size.width * 0.14,
                        decoration: BoxDecoration(borderRadius:BorderRadius.circular(15), color:const Color(0xFF353839),),
                        child: InkWell(
                          onTap: () {},
                          child: const Center(child: Text("All Coins",style: TextStyle(color: Colors.white),)),
                        ),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.04),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.04,
                        width: MediaQuery.of(context).size.width * 0.07,
                       decoration: BoxDecoration(borderRadius:BorderRadius.circular(15),  color:const Color(0xFF353839), ),
                        child: InkWell(
                          onTap: () {},
                          child: const Center(child: Text("1 H",style: TextStyle(color: Colors.white),)),
                        ),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.04),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.04,
                        width: MediaQuery.of(context).size.width * 0.17,
                        decoration: BoxDecoration(borderRadius:BorderRadius.circular(15), color:const Color(0xFF353839), ),
                        child: InkWell(
                          onTap: () {},
                          child: const Center(child:  Text("Market Cap",style: TextStyle(color: Colors.white),)),
                        ),
                      ),
                    ],
                  ),
                ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
               const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                     Text("#",style: TextStyle(color: Colors.white),),
                        Text("COIN",style: TextStyle(color: Colors.white),),
                         Text("PRICE",style: TextStyle(color: Colors.white),),
                        Text("1H",style: TextStyle(color: Colors.white),),
                            Text("MARKET CAP",style: TextStyle(color: Colors.white),),
                        

                    ]
                ),
                
                Expanded(
                  child: ListView.builder(
                    itemCount: coins.length,
                    itemBuilder: (context, index) {
                      final coin = coins[index];
                      return GestureDetector(
                        onTap: (){ Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailedItem(coin: coin),
                            ),
                          );},
                        child: Container(
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: Text(index.toString(),style: TextStyle(color: Colors.white),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 70),
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Image.network(coin.image,height: 30,width: 30,),
                                          Text(coin.symbol,style: TextStyle(color: Colors.white,fontSize: 13),),
                                    ],
                                  ),
                                ),
                              ),
                                 Padding(
                                   padding: const EdgeInsets.only(left: 40),
                                   child: Container(
                                    width: 57,
                                    child: Text(coin.currentPrice.toStringAsFixed(1),style: TextStyle(color: Colors.white,fontSize: 15),)),
                                 ),
                              //Text(coin.ath.toString(),style: TextStyle(color: Colors.white,fontSize: 7),),
                             Padding(
                                   padding: const EdgeInsets.only(left: 20),
                                   child: Container(
                                    width: 70,
                                    child: Text(coin.atl.toStringAsFixed(3),style: TextStyle(color: Colors.white,fontSize: 15),)),
                                 ),
                                  Padding(
                                   padding: const EdgeInsets.only(left: 30),
                                   child: Text(coin.marketCap.toString(),style: TextStyle(color: Colors.white,fontSize: 15),),
                                 ),
                            ],
                          )
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          }
          return Container(); // Return an empty container by default
        },
      ),
    );
  }
}



// ListTile(
//                         leading: Text(index.toString(),style: const TextStyle(color: Colors.white),),//Image.network(coin.image),
//                        // title: Container(height:20,width: 20,child:  Image.network(coin.image),),
//                         subtitle:  Image.network(coin.image,height:20,width: 20,),
//                         trailing: Text(coin.id,style: const TextStyle(color: Colors.white),),
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => DetailedItem(coin: coin),
//                             ),
//                           );
//                         },
//                       );