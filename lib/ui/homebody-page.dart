import 'package:flutter/material.dart';

import '../constants.dart';

class HomeBodyPage extends StatefulWidget {
  const HomeBodyPage({super.key});

  @override
  State<HomeBodyPage> createState() => _HomeBodyPageState();
}

class _HomeBodyPageState extends State<HomeBodyPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
          children: [
            Container(
              color: kmainColor,
              height: width * 0.16,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Image.asset(
                      'lib/assets/icons/menu-home.png',
                      width: 30,
                      color: Colors.white,
                      // fit: BoxFit.fitWidth,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'lib/assets/icons/logo.png',
                        width: 35,
                        color: Colors.white,
                      ),
                      // Text(
                      //   '--NNN',
                      //   style: const TextStyle(
                      //     fontSize: 15,
                      //     color: Colors.white,
                      //   ),
                      // ),
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'lib/assets/icons/shopping-cart.png',
                        width: 35,
                        color: Colors.white,
                      ),
                      Image.asset(
                        'lib/assets/icons/message.png',
                        width: 35,
                        color: Colors.white,
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SearchAnchor(
                builder: (BuildContext context, SearchController controller) {
              return SearchBar(
                hintText: 'Nhập mẫu đồng hồ hoặc hãng bạn yêu thích',
//                 shape: MaterialStateProperty.resolveWith<OutlinedBorder?> (Set<MaterialState> state) {
// return OutlineInputBorder();
//               },
                hintStyle: MaterialStateProperty.resolveWith<TextStyle?>(
                  (Set<MaterialState> state) {
                    return TextStyle(
                      color: Colors.grey,
                      fontStyle: FontStyle.italic,
                    );
                  },
                ),
                controller: controller,
                padding: const MaterialStatePropertyAll<EdgeInsets>(
                    EdgeInsets.symmetric(horizontal: 16.0)),
                onTap: () {
                  controller.openView();
                },
                onChanged: (_) {
                  controller.openView();
                },
                leading: const Icon(Icons.search),
              );
            }, suggestionsBuilder:
                    (BuildContext context, SearchController controller) {
              return List<ListTile>.generate(5, (int index) {
                final String item = 'item $index';
                return ListTile(
                  title: Text(item),
                  onTap: () {
                    setState(() {
                      controller.closeView(item);
                    });
                  },
                );
              });
            }),
          ],
        )),
      ),
    );
  }
}
