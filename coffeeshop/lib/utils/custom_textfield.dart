// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class CustomSearchField extends StatelessWidget {
//   final SearchController controller = Get.put(SearchController());
//   final VoidCallback onFilterTap;

//   CustomSearchField({super.key, required this.onFilterTap});

//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       onChanged: controller.updateSearch,
//       style: const TextStyle(color: Colors.white),
//       decoration: InputDecoration(
//         filled: true,
//         fillColor: Colors.grey[850],
//         hintText: "Search...",
//         hintStyle: TextStyle(color: Colors.grey[400]),
//         prefixIcon: const Icon(Icons.search, color: Colors.white),
//         suffixIcon: IconButton(
//           icon: const Icon(Icons.filter_list, color: Colors.white),
//           onPressed: onFilterTap,
//         ),
//         contentPadding: const EdgeInsets.symmetric(vertical: 14),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(50),
//           borderSide: BorderSide(color: Colors.grey[600]!),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(50),
//           borderSide: const BorderSide(color: Colors.white),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSearchField extends StatelessWidget {
  final SearchController controller = Get.put(SearchController());
  final VoidCallback onFilterTap;
  final double width;
  final double height;

  CustomSearchField({
    super.key,
    required this.onFilterTap,
    this.width = double.infinity,
    this.height = 50,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: Colors.grey[600]!),
      ),
      child: Row(
        children: [
          const SizedBox(width: 10),
          const Icon(Icons.search, color: Colors.white),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              onChanged: controller.updateSearch,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Search...",
                hintStyle: TextStyle(color: Colors.grey[400]),
                border: InputBorder.none,
              ),
            ),
          ),
          TextButton.icon(
            onPressed: onFilterTap,
            icon: const Icon(Icons.filter_list, color: Colors.white),
            label: const Text("Filter", style: TextStyle(color: Colors.white)),
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}

class SearchController extends GetxController {
  var searchText = ''.obs;

  void updateSearch(String value) {
    searchText.value = value;
  }
}
