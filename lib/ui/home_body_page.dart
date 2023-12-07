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
              const SizedBox(
                height: 20,
              ),
              //Todo: Create a search by hand
              SearchAnchor(
                  builder: (BuildContext context, SearchController controller) {
                return SearchBar(
                  hintText: 'Nhập mẫu đồng hồ hoặc hãng bạn yêu thích',
//                 shape: MaterialStateProperty.resolveWith<OutlinedBorder?> (Set<MaterialState> state) {
// return OutlineInputBorder();
//               },
                  hintStyle: MaterialStateProperty.resolveWith<TextStyle?>(
                    (Set<MaterialState> state) {
                      return const TextStyle(
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
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      left: 10,
                    ),
                    width: width * 0.45,
                    height: width * 0.7,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                        image: AssetImage('lib/assets/images/male-watch.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: const Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          'NAM',
                          style: kCateHomeText,
                        ),
                      ),
                    ),
                  ),
                  // const SizedBox(
                  //   width: 10,
                  // ),
                  Container(
                    height: width * 0.7,
                    width: width * 0.45,
                    margin: const EdgeInsets.only(
                      right: 10,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                        image:
                            AssetImage('lib/assets/images/female-watch.jpeg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: const Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          'NỮ',
                          style: kCateHomeText,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              //this height equal to the distance between male and female
              SizedBox(
                height: width * 0.1 - 20,
              ),
              Container(
                width: width - 20,
                height: width * 0.7,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    image: AssetImage('lib/assets/images/couple-watch.jpeg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      'CẶP ĐÔI',
                      style: kCateHomeText.copyWith(fontSize: 25),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
