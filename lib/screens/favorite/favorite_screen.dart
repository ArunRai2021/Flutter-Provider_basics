import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_tutorial/provider/favorite_provider.dart';
import 'package:provider_tutorial/screens/favorite/my_favorite.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavouriteItemProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorite App"),
        actions: [
          GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyFavorite()));
              },
              child: const Icon(Icons.favorite)),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: 100,
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
