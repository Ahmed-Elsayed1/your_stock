import 'package:yourstock/shared/componentes/components.dart';
import 'package:yourstock/shared/cubit/cubit.dart';
import 'package:yourstock/shared/cubit/states.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchSecreen extends StatefulWidget {

  const SearchSecreen({super.key});

  @override
  State<SearchSecreen> createState() => _SearchSecreenState();
}

class _SearchSecreenState extends State<SearchSecreen> {
  Dio dio = Dio();

  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: Scaffold(
        appBar: AppBar(),
        body: BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = AppCubit.get(context);
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: defaultFormField(
                    controller: searchController,
                    type: TextInputType.text,
                    onChange: (value) {},
                    lable: 'Search',
                    validate: (String value) {
                      if (value.isEmpty) {
                        return 'Search must not be empty';
                      }
                      return null;
                    },
                    prefix: Icons.search,
                    underLineText: 'Search must not be empty',
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      cubit.searchData(symbol: searchController.text);
                    },
                    child: const Icon(Icons.search)),
                Expanded(
                  child: state is SearchState
                      ? ListView.builder(
                          itemCount:
                              state.searchSymbol?.bestMatches?.length ?? 0,
                          itemBuilder: (BuildContext context, int index) {
                            var bestMatch =
                                state.searchSymbol!.bestMatches![index];
                            return ListTile(
                              title: Text(bestMatch.name ?? "No Name"),
                              subtitle: Text(bestMatch.symbol ?? "No Symbol"),
                              trailing: Text(bestMatch.region ?? "No Region"),
                            );
                          },
                        )
                      : const Center(child: Text('Waiting for you..')),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
