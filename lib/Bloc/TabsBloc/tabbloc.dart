import 'package:bloc/bloc.dart';
import 'package:coffeewithcoin/Config/Api_config.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:coffeewithcoin/Bloc/TabsBloc/tabevent.dart';
import 'package:coffeewithcoin/Bloc/TabsBloc/tabstate.dart';
import 'package:coffeewithcoin/Models/datamodel.dart';

class CoinBloc extends Bloc<CoinList, CoinListState> {
  CoinBloc() : super(CoinListInitial()) {
    on<FetchCoinDataApi>(_fetchCoinData);
  }

  Future<void> _fetchCoinData(FetchCoinDataApi event,Emitter<CoinListState> emit,) async {
    emit(CoinListLoading());
    try {
      final url = ApiUtils.getUri();
        final header = ApiUtils.getHeaders();

        final response = await http.get(url, headers: header);
     // print("ok Api Work");

     // print(response);
      if (response.statusCode == 200) {
      //  print("ok Api Work");
        final jsonResponse = convert.jsonDecode(response.body);
        final coins = List<DataModel>.from(
            jsonResponse.map((data) => DataModel.fromJson(data)));
        emit(CoinListLoaded(coins));
      } else {
        emit(CoinListError("Failed to fetch data"));
      }
    } catch (e) {
      emit(CoinListError("Error fetching data: $e"));
    }
  }
}