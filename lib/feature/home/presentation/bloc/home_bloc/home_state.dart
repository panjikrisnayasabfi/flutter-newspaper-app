import 'package:equatable/equatable.dart';
import 'package:flutter_newspaper_app/feature/home/data/home_model.dart';

class HomeState extends Equatable {
  const HomeState();
  @override
  List<Object?> get props => [];
}

class Homestatenewsinitial extends HomeState {}

class Homestatenewsloading extends HomeState {}

class Homestatenewsloaded extends HomeState {
  final HomeModel homeModel;
  const Homestatenewsloaded(this.homeModel);
}

class Homestatenewserror extends HomeState {
  final String? message;
  const Homestatenewserror(this.message);
}
