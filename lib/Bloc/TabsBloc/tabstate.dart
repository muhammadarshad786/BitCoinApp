import 'package:coffeewithcoin/Models/datamodel.dart';

abstract class CoinListState {}

class CoinListInitial extends CoinListState {}

class CoinListLoading extends CoinListState {}

class CoinListLoaded extends CoinListState {
  final List<DataModel> coins;

  CoinListLoaded(this.coins);
}

class CoinListError extends CoinListState {
  final String error;

  CoinListError(this.error);
}
