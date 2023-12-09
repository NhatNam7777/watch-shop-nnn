import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../constants.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

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
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              ' Nam Store',
                              style: TextStyle(
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
                height: 15,
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
                        decoration: const BoxDecoration(color: Colors.amber),
                        child: Image.asset(
                          e,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              const SizedBox(
                height: 10,
              ),
              //indicator
              AnimatedSmoothIndicator(
                activeIndex: activeIndex,
                count: imgList.length,
                onDotClicked: (index) {
                  // index = activeIndex;
                  activeIndex = index;
                },
                // effect: ScaleEffect(
                //   scale: 1.0,
                //   dotColor: Colors.grey.shade400,
                //   activeD otColor: Colors.brown,
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
              const SizedBox(
                height: 40,
              ), //male and female
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
                        padding: EdgeInsets.all(10.0),
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
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      'CẶP ĐÔI',
                      style: kCateHomeText.copyWith(fontSize: 25),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              //bts male
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset('lib/assets/images/bs-male.jpg'),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: width * 0.1 - 20),
                child: const Text(
                  'BST ĐỒNG HỒ NAM HOT',
                  style: kBSTText,
                ),
              ),
              //bst female
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset('lib/assets/images/bs-female.jpg'),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: width * 0.1 - 20),
                child: const Text(
                  'BST ĐỒNG HỒ NỮ HOT',
                  style: kBSTText,
                ),
              ),
              //new arrival
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset('lib/assets/images/new-watch-arrival.jpg'),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: width * 0.1 - 20),
                child: const Text(
                  'CÁC MẪU ĐỒNG HỒ MỚI VỀ',
                  style: kBSTText,
                ),
              ),
              const Divider(
                height: 1,
                color: Color(0xffbebebe),
                indent: 50,
                endIndent: 50,
              ),
              //top selling male
              const SizedBox(
                height: 30,
              ),
              const Text(
                'ĐỒNG HỒ NAM BÁN CHẠY',
                style: ktopSellingText,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  ProductView(width: width),
                  SizedBox(
                    width: width * 0.1 - 20,
                  ),
                  ProductView(width: width),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  ProductView(width: width),
                  SizedBox(
                    width: width * 0.1 - 20,
                  ),
                  ProductView(width: width),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  ProductView(width: width),
                  SizedBox(
                    width: width * 0.1 - 20,
                  ),
                  ProductView(width: width),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  ProductView(width: width),
                  SizedBox(
                    width: width * 0.1 - 20,
                  ),
                  ProductView(width: width),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              // top selling female
              const Text(
                'ĐỒNG HỒ NỮ BÁN CHẠY',
                style: ktopSellingText,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  ProductView(width: width),
                  SizedBox(
                    width: width * 0.1 - 20,
                  ),
                  ProductView(width: width),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  ProductView(width: width),
                  SizedBox(
                    width: width * 0.1 - 20,
                  ),
                  ProductView(width: width),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  ProductView(width: width),
                  SizedBox(
                    width: width * 0.1 - 20,
                  ),
                  ProductView(width: width),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  ProductView(width: width),
                  SizedBox(
                    width: width * 0.1 - 20,
                  ),
                  ProductView(width: width),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductView extends StatelessWidget {
  const ProductView({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width * 0.45,
        child: Column(
          children: [
            Image.asset(
              'lib/assets/images/dong-ho-chinh-hang-TB8218-19-1875841603.jpg',
              width: width * 0.45,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Đồng hồ Tsar Bomba TB8218-19 Carbon',
                    style: knameProduct,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '1.020.000',
                        style: kdiscountedPrice,
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      Text(
                        'đ',
                        style: ksmallUnitVND,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        '1.200.000',
                        style: kregularPrice,
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      Text(
                        'đ',
                        style: ksmallUnitVND.copyWith(
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Container(
                        padding: EdgeInsets.all(3),
                        margin: EdgeInsets.only(bottom: 5),
                        color: Color(0xffF9E9E2),
                        child: Text(
                          '-20%',
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      RatingBar.builder(
                        itemSize: 20,
                        initialRating: 3,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        '49',
                        style: knumOfRating,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
