import 'package:flutter/material.dart';
import 'package:kodilan_flutter/ui/pages/search/widgets/search_suggestions.dart';
import 'package:kodilan_flutter/ui/pages/search_result/search_result_view.dart';

import '../../shared/colors.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final queryController = TextEditingController();
  final locationController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    queryController.dispose();
    locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: queryController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Pozisyon adı, teknoloji adı...',
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: locationController,
            decoration: const InputDecoration(
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
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchResult(
                    query: queryController.text,
                    location: locationController.text,
                  ),
                ),
              );
            },
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
