import 'package:flutter/material.dart';
import 'package:my_duka/constants/theme.dart';
import 'package:provider/provider.dart';
import 'package:my_duka/provider/app_provider.dart';
import '../../constants/routes.dart';

import '../../models/product_model/product_model.dart';

import '../../widgets/top_titles/top_titles.dart';
import '../product_details/product_details.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // List<CategoryModel> categoriesList = [];

  bool isLoading = false;
  @override
  void initState() {
    AppProvider appProvider = Provider.of<AppProvider>(context, listen: false);
    appProvider.getUserInfoFirebase();
    super.initState();
  }

  void getCategoryList() async {
    setState(() {
      isLoading = true;
    });

    if (mounted) {
      setState(() {
        isLoading = false;
      });
    }
  }

  List<ProductModel> productModelList = bestProducts;
  TextEditingController search = TextEditingController();
  List<ProductModel> searchList = [];
  void searchProducts(String value) {
    searchList = productModelList
        .where((element) =>
            element.name.toLowerCase().contains(value.toLowerCase()))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(
              child: Container(
                height: 100,
                width: 100,
                alignment: Alignment.center,
                child: const CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TopTitles(subtitle: "", title: "iHub: Your Ultimate Apple Oasis!"),
                        TextFormField(
                          controller: search,
                          onChanged: (String value) {
                            searchProducts(value);
                          },
                          decoration: const InputDecoration(
                            hintText: "Search....",
                            prefixIcon: Icon(
                              Icons.search_outlined,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 24.0,
                        ),
                        const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text(
                            "Categories",
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        categoriesList.isEmpty
                            ? const Center(
                                child: Text("Categories is empty"),
                              )
                            : SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: categoriesList
                                      .map(
                                        (e) => Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8.0),
                                          child: Card(
                                            color: Colors.white,
                                            elevation: 3.0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                            ),
                                            child: SizedBox(
                                              height: 120,
                                              width: 120,
                                              child: Image.asset(e),
                                            ),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                ),
                              ),
                        const SizedBox(
                          height: 12.0,
                        ),
                        !isSearched()
                            ? const Padding(
                                padding: EdgeInsets.only(top: 12.0, left: 12.0),
                                child: Text(
                                  "Best Products",
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                            : SizedBox.fromSize(),
                        const SizedBox(
                          height: 12.0,
                        ),
                        search.text.isNotEmpty && searchList.isEmpty
                            ? const Center(
                                child: Text("No Product Found"),
                              )
                            : searchList.isNotEmpty
                                ? Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: GridView.builder(
                                        padding:
                                            const EdgeInsets.only(bottom: 50),
                                        shrinkWrap: true,
                                        primary: false,
                                        itemCount: searchList.length,
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                                mainAxisSpacing: 20,
                                                crossAxisSpacing: 20,
                                                childAspectRatio: 0.9,
                                                crossAxisCount: 2),
                                        itemBuilder: (ctx, index) {
                                          ProductModel singleProduct =
                                              searchList[index];
                                          return Container(
                                            decoration: BoxDecoration(
                                              color: kLightBackground,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: Column(
                                              children: [
                                                // const SizedBox(
                                                //   height: 12.0,
                                                // ),
                                                Image.asset(
                                                  singleProduct.image,
                                                  height: 60,
                                                  width: 60,
                                                ),
                                                const SizedBox(
                                                  height: 10.0,
                                                ),
                                                Text(
                                                  singleProduct.name,
                                                  style: const TextStyle(
                                                    fontSize: 18.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Text(
                                                  "Price: \$${singleProduct.price}",
                                                  style: const TextStyle(
                                                    fontSize: 18.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 10.0,
                                                ),
                                                SizedBox(
                                                  height: 35,
                                                  width: 120,
                                                  child: OutlinedButton(
                                                    onPressed: () {
                                                      Routes.instance.push(
                                                          widget: ProductDetails(
                                                              singleProduct:
                                                                  singleProduct),
                                                          context: context);
                                                    },
                                                    child: const Text(
                                                      "Buy",
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        }),
                                  )
                                : productModelList.isEmpty
                                    ? const Center(
                                        child: Text("Best Product is empty"),
                                      )
                                    : Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: GridView.builder(
                                            padding: const EdgeInsets.only(
                                                bottom: 50.0),
                                            shrinkWrap: true,
                                            primary: false,
                                            itemCount: bestProducts.length,
                                            gridDelegate:
                                                const SliverGridDelegateWithFixedCrossAxisCount(
                                                    mainAxisSpacing: 20,
                                                    crossAxisSpacing: 20,
                                                    childAspectRatio: 0.9,
                                                    crossAxisCount: 2),
                                            itemBuilder: (ctx, index) {
                                              ProductModel singleProduct =
                                                  bestProducts[index];
                                              return Container(
                                                decoration: BoxDecoration(
                                                    color:  kLightBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0)),
                                                child: Column(children: [
                                                  Image.asset(
                                                    singleProduct.image,
                                                    height: 60,
                                                    width: 60,
                                                  ),
                                                  const SizedBox(
                                                    height: 10.0,
                                                  ),
                                                  Text(
                                                    singleProduct.name,
                                                    style: const TextStyle(
                                                      fontSize: 18.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  Text(
                                                    "Price: \$${singleProduct.price}",
                                                    style: const TextStyle(
                                                      fontSize: 18.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 10.0,
                                                  ),
                                                  SizedBox(
                                                      height: 35,
                                                      width: 120,
                                                      child: OutlinedButton(
                                                          onPressed: () {
                                                            Routes.instance.push(
                                                                widget: ProductDetails(
                                                                    singleProduct:
                                                                        singleProduct),
                                                                context:
                                                                    context);
                                                          },
                                                          style: OutlinedButton
                                                              .styleFrom(),
                                                          child: const Text(
                                                            "Buy",
                                                          )))
                                                ]),
                                              );
                                            }),
                                      ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  bool isSearched() {
    if (search.text.isNotEmpty && searchList.isEmpty) {
      return true;
    } else if (search.text.isEmpty && searchList.isNotEmpty) {
      return false;
    } else if (searchList.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }
}

List<String> categoriesList = [
  'assets/products/iphone.jpg',
  'assets/products/macbook.jpg',
  'assets/products/watch.jpg',
  'assets/products/ipad.jpg',
  'assets/products/airpods.jpg'
  // "https://clipart-library.com/images/BTaEz6eGc.png",
  // "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYIY3MNpXnipeeDaVZ9iZgWJ_NhjD8YlZ29Q&usqp=CAU",
  // "https://purepng.com/public/uploads/large/purepng.com-pc-mousepc-mousepcmouselaptop-mouse-1701528347560gfkk4.png",
  // "https://i.pinimg.com/originals/dd/dd/80/dddd80cf357d50bd81fb8385d2d7ef90.png",
  // "https://www.fingers.co.in/secure/api/uploads/products/1689657356_3.png"
];

List<ProductModel> bestProducts = [
  ProductModel(
    // image:"https://cdn.shopify.com/s/files/1/1228/3460/files/logiix_phantomGlassHD_AntiGlare_0000s_0000_Vector-Smart-Object.png?v=1694028384&width=1000",
    image: 'assets/products/airpods.jpg',
    id: "1",
    name: "AirPods Max",
    price: 599,
    description:
        "Winning beats sound. Apple-designed dynamic driver provides high-fidelity audio.Note : If the size of the earbud tips does not match the size of your ear canals or the headset is not worn properly in your ears, you may not obtain the correct sound qualities or call performance. Change the earbud tips to ones that fit more snugly in your ear.",
    status: "pedding",
    isFavourite: false,
  ),
  ProductModel(
    image: "assets/products/macbook.jpg",
    // "https://images.freeimages.com/vhq/images/previews/ae7/computer-mouse-top-down-view-46004.png",
    id: "2",
    name: "MacBook Pro",
    price: 3415,
    description:
        "SUPERCHARGED BY M2 PRO OR M2 MAX — Take on demanding projects with the M2 Pro or M2 Max chip. M2 Pro has up to 12 CPU cores, up to 19 GPU cores and up to 32GB unified memory. M2 Max has 12 CPU cores, up to 38 GPU cores and up to 96GB unified memory. All your pro apps run lightning-fast — including Adobe Creative Cloud, Xcode, Affinity Designer, Microsoft 365, and many of your favourite iPhone and iPad apps.",
    status: "pedding",
    isFavourite: false,
  ),
  ProductModel(
    image: "assets/products/magic.jpg",
    // "https://freepngimg.com/download/macbook/70211-apple-mockup-pro-drive-air-laptops-disc.png",
    id: "3",
    name: "Magic Wireless",
    price: 255,
    description:
        "Keyboard with Numeric Keypad. The Magic Keyboard is the perfect companion for iPad Pro (3rd, 2nd and 1st generation) and iPad Air (5th and 4th generation). It features the best typing experience ever on iPad, a trackpad that opens up new ways to work with iPadOS, a USB-C port for charging, backlit keys, and front and back protection.",
    status: "pedding",
    isFavourite: false,
  ),
  ProductModel(
    image: "assets/products/pixel7.jpg",
    // "https://freesvg.org/img/logitechmouse.png",
    id: "4",
    name: "Google Pixel",
    price: 255,
    description:
        "Google Pixel 7 Pro. This device is globally unlocked and ready to be used with your preferred GSM Carrier. THIS DEVICE IS NOT COMPATIBLE with CDMA carriers such as Cricket, Verizon, Sprint, Boost Mobile, US Cellular, etc. SIM CARD NOT INCLUDED. Please confirm device compatibility with your service provider before placing your order. ",
    status: "pedding",
    isFavourite: false,
  ),
  ProductModel(
    image: "assets/products/yoga.jpg",
    // "https://i0.wp.com/myfreedrawings.com/wp-content/uploads/2022/04/Grey-Computer-Wired-Keyboard-PNG.png?fit=2500%2C1940&ssl=1",
    id: "5",
    name: "Lenova Yoga",
    price: 750,
    description:
        'Lenova Yoga Duet. 2 in 1 laptop with 13" 2K. At only 1.17 kg and available in sophisticated Orchid and Slate Grey, the Yoga Duet 7i is as versatile as you are. Work in laptop mode with the folio kickstand and keyboard—or detach the keyboard and prop up the screen on a raised surface for easier viewing, thanks to Bluetooth connectivity. You can also rotate the kickstand to a lower angle for sketching and taking notes—or switch to tablet mode for easy use on the go. A more intuitive, personalized experience awaits with 11th Generation Intel Core processors, featuring AI that dynamically adjusts performance to prolong battery life. ',
    status: "pedding",
    isFavourite: false,
  ),
  ProductModel(
    image: "assets/products/zfold.jpg",
    // "https://i.pinimg.com/originals/dd/dd/80/dddd80cf357d50bd81fb8385d2d7ef90.png",
    id: "6",
    name: "Galaxy Z Fold3",
    price: 2500,
    description:
        "Dual SIM and eSIM Smartphone. Design: Shape of tomorrow’s design, now more portable and durable. And now comes with support for S Pen. Great views inside out: The device comes with a dual display. An internal, 7.6-inch Infinity More cameras, more photos: Take it all in with the 12MP Ultra Wide Camera, capture more light with the bright 12MP Wide-angle Camera, zoom in with the help of 12MP Telephoto Camera, 4MP Under Display Camera, and a 10MP Cover Camera. Multi View: With a foldable, roomier internal screen, you can multitask with ease.",
    status: "pedding",
    isFavourite: false,
  ),
  ProductModel(
    image: 'assets/products/ipad.jpg',
    id: "7",
    name: 'Apple iPad',
    price: 1200,
    description:
        'Apple iPad Pro. 12.9 inch 6th Generation. Brilliant 12.9-inch Liquid Retina XDR display with ProMotion, True Tone, and P3 wide color M2 chip with 8-core CPU and 10-core GPU 12MP Wide camera, 10MP Ultra Wide back camera, and LiDAR Scanner for immersive AR 12MP Ultra Wide front camera with Center Stage Stay connected with ultrafast Wi-Fi 6E USB-C connector with support for Thunderbolt / USB 4 Face ID for secure authentication and Apple Pay Go far with all-day battery life Works with Apple Pencil (2nd generation), Magic Keyboard, and Smart Keyboard Folio Support for Apple Pencil hover for more precise marking and sketching',
    status: "pedding",
    isFavourite: false,
  ),

  // Product List 8
  ProductModel(
    image: 'assets/products/iphone.jpg',
    id: "8",
    name: 'iPhone 14 Pro',
    price: 1600,
    description:
        'Apple iPhone 14 Pro Max. Deep Purple 256GB. Introducing Dynamic Island, a truly Apple innovation that’s hardware and software and something in between. It bubbles up music, sports scores, FaceTime, and so much more — all without taking you away from what you’re doing. Now your Lock Screen is always glanceable, so you don’t even have to tap it to stay in the know.When iPhone is turned face down or in your pocket, it goes dark to save battery life. If you don’t have cell service or Wi‑Fi, iPhone lets you text emergency services over satellite.4',
    status: "pedding",
    isFavourite: false,
  ),

  // Product List 9
  ProductModel(
    image: 'assets/products/watch.jpg',
    id: "9",
    name: 'Watch Series 8',
    price: 480,
    description:
        'Apple Watch Series 8. Cellular 45mm Smart Watch. WHY APPLE WATCH SERIES 8 — Your essential companion for a healthy life is now even more powerful. Advanced sensors provide insights to help you better understand your health. New safety features can get you help when you need it. The bright, Always-On Retina display is easy to read, even when your wrist is down. CELLULAR CONNECTIVITY — Send a text, make a call, and stream music without your iPhone, even while traveling internationally. Use Family Setup to manage Apple Watch for family members who don’t have an iPhone. EASILY CUSTOMIZABLE — Available in a range of sizes and materials, with dozens of bands to choose from and watch faces with complications tailored to whatever you’re into.  ',
    status: "pedding",
    isFavourite: false,
  ),

  // Product List 10
  ProductModel(
    image: 'assets/products/logic.jpg',
    id: "10",
    name: 'Logitech MX',
    price: 87,
    description:
        'Logitech MX Master 3S. Wireless Performance Mouse. Any-surface tracking - now 8K DPI: Use MX Master 3S cordless computer mouse to work on any surface - even glass (1) - with the upgraded 8000 DPI sensor with customisable sensitivity. Introducing quiet clicks: MX Master 3S Bluetooth mouse features Quiet Clicks - offering the same satisfying feel but with 90% less click noise (2). Magspeed scrolling: A computer mouse with remarkable speed, precision, and near silence - MagSpeed scrolling is 90% faster (3), 87% more precise (4), and ultra quiet. Ergonomic design: Work comfortably with a precision mouse featuring a silhouette crafted for more natural wrist posture and optimally placed thumb controls.',
    status: "pedding",
    isFavourite: false,
  ),
];
