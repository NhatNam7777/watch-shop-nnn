import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../constants.dart';

class HomeBodyPage extends StatefulWidget {
  const HomeBodyPage({super.key});

  @override
  State<HomeBodyPage> createState() => _HomeBodyPageState();
}

class _HomeBodyPageState extends State<HomeBodyPage> {
  final List<String> imgList = [
    'lib/assets/images/slider-banner-home-1.jpg',
    'lib/assets/images/slider-banner-home-2.png',
    'lib/assets/images/slider-banner-home-3.jpg',
  ];
  CarouselController buttonCarouselController = CarouselController();
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //header
              Container(
                color: kmainColor,
                height: width * 0.16,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Image.asset(
                        'lib/assets/icons/option.png',
                        width: 28,
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
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              ' Nam Store',
                              style: const TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Image.asset(
                        'lib/assets/icons/shopping-cart.png',
                        width: 28,
                        color: Colors.white,
                      ),
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
              CarouselSlider(
                carouselController: buttonCarouselController,
                options: CarouselOptions(
                  height: width * 0.5,
                  aspectRatio: 16 / 9,
                  viewportFraction: 1,
                  initialPage: 1,
                  enableInfiniteScroll: false,
                  // autoPlay: true,
                  // autoPlayInterval: Duration(seconds: 4),
                  // autoPlayAnimationDuration: Duration(milliseconds: 800),
                  // autoPlayCurve: Curves.fastOutSlowIn,
                  // enlargeCenterPage: false,
                  // enlargeFactor: 0.3,
                  onPageChanged: (index, reason) {
                    setState(() {
                      activeIndex = index;
                    });
                  },
                  scrollDirection: Axis.horizontal,
                ),
                items: imgList.map((e) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        // margin: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(color: Colors.amber),
                        child: Image.asset(
                          e,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              //indicator
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 30),
                child: AnimatedSmoothIndicator(
                  activeIndex: activeIndex,
                  count: imgList.length,
                  onDotClicked: (index) {
                    // index = activeIndex;
                    activeIndex = index;
                  },
                  // effect: ScaleEffect(
                  //   scale: 1.0,
                  //   dotColor: Colors.grey.shade400,
                  //   activeDotColor: Colors.brown,
                  //   strokeWidth: 2,
                  //   // fixedCenter: true,
                  //   dotHeight: 15,
                  //   dotWidth: 15,
                  //   paintStyle: PaintingStyle.fill,
                  // ),
                  effect: WormEffect(
                    type: WormType.normal,
                    dotColor: Colors.grey.shade400,
                    activeDotColor: Colors.brown,
                  ),
                ),
              ),
              //male and female
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      left: 10,
                    ),
                    width: width * 0.45,
                    height: width * 0.55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
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
                    height: width * 0.55,
                    width: width * 0.45,
                    margin: const EdgeInsets.only(
                      right: 10,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
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
              //couple
              Container(
                width: width - 20,
                height: width * 0.55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
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
              ),
              SizedBox(
                height: width * 0.1 - 20,
              ),
              //bts male
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ClipRRect(
                  child: Image.asset('lib/assets/images/bs-male.jpg'),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              SizedBox(
                height: width * 0.1 - 20,
              ),
              //bst female
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ClipRRect(
                  child: Image.asset('lib/assets/images/bs-female.jpg'),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              SizedBox(
                height: width * 0.1 - 20,
              ),
              //bst couple
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ClipRRect(
                  child: Image.asset('lib/assets/images/new-watch-arrival.jpg'),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              const SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
