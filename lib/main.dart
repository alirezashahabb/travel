import 'package:delayed_widget/delayed_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:read_more_text/read_more_text.dart';
import 'package:travel/mdel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('fa'), // Persian
      ],
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Vazir',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;
  double imageSize = 55;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: size.height / 1.6,
                  color: Colors.white,
                  child: Stack(children: [
                    //bg image
                    Container(
                      height: size.height / 1.9,
                      foregroundDecoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.4),
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(60),
                          bottomRight: Radius.circular(60),
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(60),
                          bottomRight: Radius.circular(60),
                        ),
                        image: DecorationImage(
                          image: AssetImage(travelList[selectedIndex].img),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    // header Icon
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white.withOpacity(0.5),
                            ),
                            child: const Icon(CupertinoIcons.heart),
                          ),
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white.withOpacity(0.5),
                            ),
                            child: const Icon(CupertinoIcons.arrow_left),
                          ),
                        ],
                      ),
                    ),
                    // slider
                    Positioned(
                      left: 0,
                      top: 70,
                      child: DelayedWidget(
                        animationDuration: const Duration(milliseconds: 3000),
                        delayDuration: const Duration(seconds: 2),
                        child: SizedBox(
                          width: 80,
                          height: double.maxFinite,
                          child: ListView.builder(
                            itemCount: travelList.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        selectedIndex = index;
                                      });
                                    },
                                    child: AnimatedContainer(
                                      margin: const EdgeInsets.all(8),
                                      height: selectedIndex == index
                                          ? imageSize + 15
                                          : imageSize,
                                      width: selectedIndex == index
                                          ? imageSize + 15
                                          : imageSize,
                                      duration:
                                          const Duration(milliseconds: 200),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                          color: Colors.white,
                                          width: selectedIndex == index ? 3 : 1,
                                        ),
                                        image: DecorationImage(
                                          image:
                                              AssetImage(travelList[index].img),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    // text
                    Positioned(
                      bottom: 70,
                      right: 50,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            travelList[selectedIndex].name,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                CupertinoIcons.location_fill,
                                size: 15,
                                color: Colors.white,
                              ),
                              const SizedBox(
                                width: 3,
                              ),
                              Text(
                                travelList[selectedIndex].location,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
                // card and description
                Container(
                  margin: const EdgeInsets.only(
                      top: 10, left: 10, right: 20, bottom: 10),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // cart
                      DelayedWidget(
                        animationDuration: const Duration(milliseconds: 4000),
                        delayDuration: const Duration(seconds: 1),
                        child: Wrap(
                          spacing: 10,
                          alignment: WrapAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(23),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black.withOpacity(0.1),
                                ),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Column(
                                children: [
                                  const Text('مقصد'),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    travelList[selectedIndex].distance,
                                    style: const TextStyle(
                                      color: Color(0xff78CADE),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(23),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black.withOpacity(0.1),
                                ),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Column(
                                children: [
                                  const Text('دما'),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    travelList[selectedIndex].temp,
                                    style: const TextStyle(
                                      color: Color(0xff78CADE),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(23),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black.withOpacity(0.1),
                                ),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Column(
                                children: [
                                  const Text('امتیاز'),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    travelList[selectedIndex].rating,
                                    style: const TextStyle(
                                      color: Color(0xff78CADE),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      // description
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        'توضیحات',
                        style: TextStyle(fontSize: 18),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      ReadMoreText(
                        readMoreAlign: AlignmentDirectional.bottomStart,
                        style: TextStyle(color: Colors.black.withOpacity(0.7)),
                        travelList[selectedIndex].description,
                        numLines: 2,
                        readMoreText: 'توضیحات بیشتر',
                        readLessText: 'جمع شدن',
                      ),
                      // price
                      const SizedBox(
                        height: 18,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              const Text(
                                'جمع نهایی',
                                style:
                                    TextStyle(fontSize: 18, color: Colors.grey),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                '${travelList[selectedIndex].price} تومان',
                              ),
                            ],
                          ),
                          Container(
                            width: 80,
                            height: 80,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.black,
                            ),
                            child: const Icon(
                              CupertinoIcons.arrow_left,
                              color: Colors.white,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
