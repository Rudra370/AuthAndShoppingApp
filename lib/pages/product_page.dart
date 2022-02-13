import 'package:aara_assignment/components/app_components.dart';
import 'package:aara_assignment/model/product_model.dart';
import 'package:aara_assignment/service/app_services.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:easy_widgets/easy_widget.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> with EasyMixin {
  int currentIndex = 0;
  int currentIndex2 = 0;
  List<ProductModel> productList = [];
  bool isLoading = true;
  bool isError = false;
  @override
  void initState() {
    initialize();
    super.initState();
  }

  void initialize() async {
    final List<ProductModel> data = await easyFuture<List<ProductModel>>(
      future: () async => AppService.instance.getProducts(),
      indicatorWhileFuture: false,
      returnOnError: () {
        setState(() {
          isError = true;
        });
        return [];
      },
      showSnackBarOnError: true,
      snackBarMessage: (e) {
        return e.toString();
      },
    );
    // final data = await AppService.instance.getProducts();
    setState(() {
      productList = data;
      isLoading = false;
      isError = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: Icon(
          Icons.dehaze_outlined,
          color: Colors.blue,
          size: 18.hWise,
        ),
        title: Text(
          'Home',
          style: TextStyle(
            fontSize: 18.hWise,
            color: Colors.blue,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Icon(
            Icons.business_center_rounded,
            color: Colors.blue,
            size: 18.hWise,
          ),
          15.wGap,
        ],
      ),
      body: isLoading
          ? const CircularProgressIndicator().alignC
          : EasyScrollList(
              isScrollable: true,
              children: [
                10.hGap,
                SizedBox(
                  height: 130.hWise,
                  child: Swiper(
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage('images/grocery.jpg'),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: 8.cBorderRadius),
                        margin: EdgeInsets.symmetric(horizontal: 10.wWise),
                      );
                    },
                    indicatorLayout: PageIndicatorLayout.COLOR,
                    itemCount: 3,
                    viewportFraction: 0.85,
                    onIndexChanged: (value) => setState(() {
                      currentIndex = value;
                    }),
                  ),
                ),
                10.hGap,
                EasyScrollList(
                  scrollDirection: Axis.horizontal,
                  mainAxisAlignment: MainAxisAlignment.center,
                  separator: 10.wGap,
                  children: [
                    for (var i = 0; i < 3; i++)
                      Container(
                        height: 6.hWise,
                        width: 6.wWise,
                        decoration: BoxDecoration(
                          color: currentIndex == i ? Colors.blue : Colors.grey,
                          shape: BoxShape.circle,
                        ),
                      ),
                  ],
                ),
                10.hGap,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomChip(
                      text: 'Fruits and Vegetables',
                      color: currentIndex2 == 0 ? Colors.blue : Colors.grey,
                      onPressed: () {
                        setState(() {
                          currentIndex2 = 0;
                        });
                      },
                    ),
                    CustomChip(
                      text: 'Daily needs',
                      color: currentIndex2 == 1 ? Colors.blue : Colors.grey,
                      onPressed: () {
                        setState(() {
                          currentIndex2 = 1;
                        });
                      },
                    ),
                  ],
                ),
                10.hGap,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomChip(
                      text: 'Personal care',
                      color: currentIndex2 == 2 ? Colors.blue : Colors.grey,
                      onPressed: () {
                        setState(() {
                          currentIndex2 = 2;
                        });
                      },
                    ),
                    CustomChip(
                      text: 'Cleaning and households',
                      color: currentIndex2 == 3 ? Colors.blue : Colors.grey,
                      onPressed: () {
                        setState(() {
                          currentIndex2 = 3;
                        });
                      },
                    ),
                  ],
                ),
                15.hGap,
                AppButton(
                  text: 'show more',
                  onPressed: () {},
                  color: Colors.grey[350],
                  textColor: Colors.blue,
                  width: context.w * 0.9,
                  elevation: false,
                ).alignC,
                10.hGap,
                Text('Our Products',
                        style: TextStyle(
                            fontSize: 18.hWise, fontWeight: FontWeight.bold))
                    .paddS(horizontal: 16.wWise),
                Wrap(
                  runSpacing: 5,
                  spacing: context.w * 0.02,
                  children: List.generate(productList.length,
                      (index) => ProductCard(product: productList[index])),
                ),
                10.hGap,
              ],
            ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedIconTheme: const IconThemeData(color: Colors.orange),
        currentIndex: 0,
        fixedColor: Colors.black,
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 24.hWise,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.store,
              size: 24.hWise,
            ),
            label: 'Store',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
              size: 24.hWise,
            ),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              size: 24.hWise,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final ProductModel product;
  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.w * 0.49,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: 4.cBorderRadius),
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              product.image!,
              height: 100.hWise,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            5.hGap,
            Row(
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.topCategoryName ?? 'Apple',
                      ).paddS(horizontal: 4.wWise),
                      4.hGap,
                      const Text('Short description')
                          .paddS(horizontal: 4.wWise),
                      4.hGap,
                      Row(
                        children: [
                          Text(
                            '\$ 100',
                            style: TextStyle(
                              fontSize: 16.hWise,
                            ),
                          ),
                          4.wGap,
                          Text(
                            '\$100',
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 14.hWise,
                                decoration: TextDecoration.lineThrough),
                          ),
                        ],
                      ).paddS(horizontal: 4.wWise),
                    ],
                  ),
                ),
                Column(
                  children: [
                    CircleAvatar(
                      maxRadius: 12,
                      backgroundColor: Colors.orange,
                      child: Icon(
                        Icons.favorite_outline,
                        size: 12.hWise,
                        color: Colors.white,
                      ),
                    ),
                    4.hGap,
                    CircleAvatar(
                      maxRadius: 12,
                      backgroundColor: Colors.orange,
                      child: Icon(
                        Icons.business_center_outlined,
                        size: 12.hWise,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                4.wGap,
              ],
            ),
            10.hGap
          ],
        ),
      ),
    );
  }
}
