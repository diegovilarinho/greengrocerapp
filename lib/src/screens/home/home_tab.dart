import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:greengrocer/src/config/custom_colors.dart';
import 'package:greengrocer/src/screens/home/components/category_tile.dart';
import 'package:greengrocer/src/data/mock_api.dart' as mockApi;
import 'package:greengrocer/src/screens/home/components/item_tile.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  String selectedCategory = 'Frutas';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar + CartIcon
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text.rich(
          TextSpan(
            style: const TextStyle(fontSize: 30),
            children: [
              TextSpan(
                text: 'Green',
                style: TextStyle(
                  color: CustomColors.customSwatchColor,
                ),
              ),
              TextSpan(
                text: 'grocer',
                style: TextStyle(
                  color: CustomColors.customContrastColor,
                ),
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              top: 15,
              right: 17,
            ),
            child: GestureDetector(
              onTap: () {
                print('GO TO CART');
              },
              child: Badge(
                badgeColor: CustomColors.customContrastColor,
                badgeContent: const Text('10'),
                child: Icon(
                  Icons.shopping_cart,
                  color: CustomColors.customSwatchColor,
                ),
              ),
            ),
          )
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            // Search Bar
            TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                isDense: true,
                hintText: 'Pesquise aqui...',
                hintStyle: TextStyle(
                  color: Colors.grey.shade400,
                  fontSize: 14,
                ),
                suffixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(60),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    )),
              ),
            ),

            // Categories tiles
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: SizedBox(
                height: 40,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    return CategoryTile(
                      categoryName: mockApi.categories[index],
                      isSelected: mockApi.categories[index] == selectedCategory,
                      onPressed: () => setState(
                          () => selectedCategory = mockApi.categories[index]),
                    );
                  },
                  separatorBuilder: (_, index) => const SizedBox(width: 10),
                  itemCount: mockApi.categories.length,
                ),
              ),
            ),

            // Products Grid
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 9 / 11.5,
                ),
                itemCount: mockApi.items.length,
                itemBuilder: (_, index) {
                  return ItemTile(item: mockApi.items[index]);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
