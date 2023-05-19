import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/services/api_client.dart';

part 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit() : super(HomePageInitial());

  final formKey = GlobalKey<FormState>();
  TextEditingController searchController = TextEditingController();
  late WeatherModel weatherModel;

  getWeather() async {
    emit(HomePageFetchDataLoading());
    if (formKey.currentState!.validate()) {
      Response response =
          await ApiClient().getWeather(searchController.value.text);
      weatherModel = WeatherModel.fromJson(response.data);
      emit(HomePageFetchDataLoaded());
    }
  }
}
