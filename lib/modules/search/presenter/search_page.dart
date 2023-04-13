import 'package:flutter/material.dart';
import 'package:flutterando_clean_arch/modules/search/presenter/result_provider.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final provider = Provider.of<ResultSearchProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Github Search"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              onSubmitted: (value) => provider.search(value),
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Search..."
              ),
            ),
          ),
          if(provider.list.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text(
                "Resultados encontrados: ${provider.list.length}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          if(provider.estadoInicial)
            const Expanded(
              child:  Center(
                child: Text("Faça uma pesquisa."),
              ),
            )
          else if(!provider.estadoInicial && provider.list.isEmpty)
            const Expanded(
              child: Center(
                child: Text("Usuário não encontrado."),
              ),
            )
          else 
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: provider.list.length,
                itemBuilder: (context, index) {
                  final item = provider.list[index];
                  return Card(
                    margin: EdgeInsets.only(
                      left: 8,
                      right: 8,
                      top: 8,
                      bottom: index + 1 == provider.list.length
                        ? 8
                        : 0
                    ),
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(1000),
                        child: Image.network(item.img)),
                      title: Text(item.title),
                      subtitle: Text(item.content),
                    ),
                  );
                }
              )
            )
        ],
      ),
    );
  }
}