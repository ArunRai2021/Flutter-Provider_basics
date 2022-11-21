import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/favorite_provider.dart';

class MyFavorite extends StatefulWidget {
  const MyFavorite({Key? key}) : super(key: key);

  @override
  State<MyFavorite> createState() => _MyFavoriteState();
}

class _MyFavoriteState extends State<MyFavorite> {
  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavouriteItemProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("My favorite"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: favoriteProvider.selectedItem.length,
                itemBuilder: (context, index) {
                  return Consumer<FavouriteItemProvider>(
                      builder: (context, value, child) {
                    return ListTile(
                      onTap: () {
                        if (favoriteProvider.selectedItem.contains(index)) {
                          favoriteProvider.removeItem(index);
                        } else {
                          favoriteProvider.addItem(index);
                        }
                      },
                      title: Text("title ${index}"),
                      trailing: favoriteProvider.selectedItem.contains(index)
                          ? const Icon(Icons.favorite)
                          : const Icon(
                              Icons.favorite_border_outlined,
                            ),
                    );
                  });
                }),
          )
        ],
      ),
    );
  }
}
