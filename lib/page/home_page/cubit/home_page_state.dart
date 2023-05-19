part of 'home_page_cubit.dart';

@immutable
abstract class HomePageState {}

class HomePageInitial extends HomePageState {}

class HomePageFetchDataLoading extends HomePageState {}

class HomePageFetchDataLoaded extends HomePageState {}
