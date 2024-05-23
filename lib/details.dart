import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'imags.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _currentIndex = 0;

  final List<String> dates = ['21', '22', '23', '24', '25', '26', '28', '29'];
  final List<String> days = [
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
    'Sun',
    'Mon',
    'Tue'
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: dates.length, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _currentIndex = _tabController.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double sw = MediaQuery.sizeOf(context).width;
    double sh = MediaQuery.sizeOf(context).height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: const Icon(Icons.menu),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 10),
            child: Row(
              children: [
                SizedBox(
                    width: sw * 0.35,
                    child: Hero(
                        tag: "kimageposter",
                        child: Image.asset(
                            kIsWeb ? "assets/$kimageposter" : kimageposter))),
                const SizedBox(
                  width: 20,
                ),
                SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("The OutPost",
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.black,
                              fontWeight: FontWeight.w600)),
                      const SizedBox(
                        height: 0,
                      ),
                      const Text(
                        "4 Seasons",
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "IMDb   6.6/10",
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Text("Cast"),
                      Row(
                        children: [
                          customcontianer(sw, kimage1),
                          customcontianer(sw, kimage2),
                          customcontianer(sw, kimage3),
                          customcontianer(sw, kimage4),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 25, right: 25),
            child: Text(
              "A small unit of U.S. soldiers, alone at the remote Combat Outpost Keating, located deep in the valley of three mountains in Afghanistan, battles an overwhelming force of Taliban fighters in a coordinated attack. The Battle of Kamdesh became the bloodiest American engagement of the Afghanistan War in 2009, and Bravo Troop 3-61 CAV became one of the most decorated units of the 19-year conflict.",
              maxLines: 6,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TabBar(
            labelPadding: EdgeInsets.zero,
            indicator: const BoxDecoration(color: Colors.transparent),
            controller: _tabController,
            tabs: List.generate(
              dates.length,
              (index) => Tab(
                child: Container(
                  color: _currentIndex == index
                      ? Colors.white
                      : Colors.grey.withOpacity(0.2),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _currentIndex == index
                          ? Container(
                              color: Colors.black,
                              height: 5,
                            )
                          : Container(),
                      Text(
                        dates[index] + '\n' + days[index],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: List.generate(
                dates.length,
                (index) => Container(
                  color: Colors.grey.withOpacity(0.2),
                  child: const Center(
                    child: Text(
                      'Tab Content',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height * 0.07,
            color: Colors.purple,
            child: const Center(
                child: Text(
              "BOOK TICKETS",
              style: TextStyle(color: Colors.white, fontSize: 20),
            )),
          ),
        ],
      ),
    );
  }

  Widget customcontianer(double sw, String image) {
    return Container(
      margin: const EdgeInsets.only(right: 7),
      height: sw * 0.1,
      width: sw * 0.1,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(kIsWeb ? "assets/$image" : image),
              fit: BoxFit.fill)),
    );
  }
}
