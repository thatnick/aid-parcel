import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/autocomplete/autocomplete_bloc.dart';
import '../../blocs/place/place_bloc.dart';

class LocationSearchBox extends StatelessWidget {
  const LocationSearchBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 40,
      left: 20,
      right: 20,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Enter location',
                suffixIcon: const Icon(Icons.search),
                contentPadding: const EdgeInsets.only(
                  left: 20,
                  bottom: 5,
                  right: 5,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.white,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.white,
                  ),
                ),
              ),
              onChanged: (value) {
                context
                    .read<AutocompleteBloc>()
                    .add(LoadAutocompleteEvent(searchInput: value));
              },
            ),
          ),
          BlocBuilder<AutocompleteBloc, AutocompleteState>(
            builder: (context, state) {
              if (state is AutocompleteLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is AutocompleteLoaded) {
                return Container(
                  margin: const EdgeInsets.all(8),
                  height: 300,
                  color: state.autocomplete.isNotEmpty
                      ? Colors.black.withOpacity(0.6)
                      : Colors.transparent,
                  child: ListView.builder(
                    itemCount: state.autocomplete.length,
                    itemBuilder: ((context, index) => ListTile(
                          title: Text(
                            state.autocomplete[index].description,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          onTap: () {
                            print('Tap regd');
                            context.read<PlaceBloc>().add(LoadPlace(
                                placeId: state.autocomplete[index].placeId));
                          },
                        )),
                  ),
                );
              } else {
                return const Text('Something went wrong');
              }
            },
          ),
        ],
      ),
    );
  }
}
