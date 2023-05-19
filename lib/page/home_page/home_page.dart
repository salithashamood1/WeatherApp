import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/page/home_page/cubit/home_page_cubit.dart';
import 'package:weather_app/page/home_page/widget/weather_details.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomePageCubit homePageCubit = context.read<HomePageCubit>();
    return Scaffold(
      appBar: AppBar(title: const Text('Weather')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Form(
                key: homePageCubit.formKey,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 200,
                      child: TextFormField(
                        validator: (value) {
                          return value!.isEmpty
                              ? 'Please provide Location'
                              : null;
                        },
                        decoration: InputDecoration(hintText: 'Location'),
                        controller: homePageCubit.searchController,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        await homePageCubit.getWeather();
                      },
                      child: const Text('Search'),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              BlocBuilder<HomePageCubit, HomePageState>(
                builder: (context, state) {
                  if (state is HomePageFetchDataLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is HomePageFetchDataLoaded) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        WeatherDetails(
                            leftSideString: 'Location',
                            rightSideString: homePageCubit.weatherModel.name),
                        SizedBox(
                          height: 5,
                        ),
                        WeatherDetails(
                            leftSideString: 'Temperature',
                            rightSideString: homePageCubit
                                .weatherModel.main.temp
                                .toString()),
                        SizedBox(
                          height: 5,
                        ),
                        WeatherDetails(
                            leftSideString: 'Wind Speed',
                            rightSideString: homePageCubit
                                .weatherModel.wind.speed
                                .toString()),
                      ],
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
