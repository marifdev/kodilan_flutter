import 'package:flutter/material.dart';
import 'package:kodilan_flutter/ui/pages/search/widgets/search_suggestions.dart';

import '../../shared/colors.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Pozisyon adı, teknoloji adı...',
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Şehir Seçin',
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
              primary: AppColors.mainColor,
            ),
            onPressed: () {},
            child: Row(
              children: const [
                Padding(
                  padding: EdgeInsets.only(right: 8.0),
                  child: Icon(Icons.search),
                ),
                Text('Ilan Ara'),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SearchSuggestions(),
        ],
      ),
    );
  }
}
