import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutterando_clean_arch/modules/search/presenter/result_provider.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  // final bloc = Modular.get<SearchBloc>();

  @override
  void dispose() {
    super.dispose();
    // bloc.close();
  }

  @override
  Widget build(BuildContext context) {

    final provider = Provider.of<ResultSearchProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Github Search"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onSubmitted: (value) {
                log("message");
                provider.search(value);
                // bloc.add(GetSearch(value));
              },
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Search..."
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: provider.list.length,
              itemBuilder: (context, index) {
                final item = provider.list[index];
                return ListTile(
                  title: Text(item.title),
                );
              }
            )
          )
        ],
      ),
    );
  }
}