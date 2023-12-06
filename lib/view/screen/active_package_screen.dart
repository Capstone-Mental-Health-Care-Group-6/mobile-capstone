import 'package:empathi_care/view/widget/instant_widget.dart';
import 'package:empathi_care/view/widget/premium_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

class ActivePacketScreen extends StatefulWidget {
  const ActivePacketScreen({super.key});

  @override
  State<ActivePacketScreen> createState() => _ActivePacketScreenState();
}

class _ActivePacketScreenState extends State<ActivePacketScreen>
    with TickerProviderStateMixin {
  bool isInstant = true;
  bool isLoaded = true;

  Future<void> delayLoading() {
    return Future.delayed(
      const Duration(seconds: 5),
    ).then((value) {
      setState(() {
        isLoaded = false;
      });
    });
  }

  @override
  void initState() {
    delayLoading();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 2, vsync: this);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Konseling',
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w700,
            fontSize: 16.0,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        shadowColor: Colors.grey,
      ),
      backgroundColor: Colors.white,
      body: Builder(
        builder: (context) {
          if (isLoaded) {
            return shimmerLoad();
          } else {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xff0085FF),
                        width: 0.1,
                      ),
                    ),
                    child: TabBar(
                      controller: tabController,
                      indicatorColor: const Color(0xff0085FF),
                      unselectedLabelColor: const Color(0xff001B33),
                      labelColor: const Color(0xff0085FF),
                      labelPadding: const EdgeInsets.all(
                        15.0,
                      ),
                      indicator: const UnderlineTabIndicator(
                        borderSide: BorderSide(
                          width: 2.0,
                          color: Color(0xff0085FF),
                        ),
                        insets: EdgeInsets.symmetric(
                          horizontal: 131.5,
                        ),
                      ),
                      tabs: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isInstant = true;
                              tabController.index = 0;
                            });
                          },
                          child: Text(
                            'Instant',
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w600,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            if (tabController.index != 1) {
                              setState(() {
                              isInstant = false;
                              tabController.index = 1;
                            });
                            }
                          },
                          child: Text(
                            'Premium',
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w600,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  SizedBox(
                    width: double.maxFinite,
                    height: MediaQuery.of(context).size.height,
                    child: TabBarView(
                      controller: tabController,
                      children: const [
                        InstantWidget(),
                        PremiumWidget(),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  Widget shimmerLoad() {
    int selectIndex = 0;
    final List<Map<String, String>> listPaket = [
      {
        'status': 'Percakapan Masih dibuka',
      },
      {
        'status': 'Percakapan Selesai',
      },
      {
        'status': 'Masa aktif sudah berakhir',
      },
      {
        'status': 'Masa aktif 6 hari',
      },
      {
        'status': 'Masa aktif 14 hari',
      },
      {
        'status': 'Masa aktif 29 hari',
      },
    ];
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 35.0,
            padding: const EdgeInsets.only(
              top: 20.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 52.0,
                  height: 24.0,
                  child: Shimmer.fromColors(
                    baseColor: const Color(0xffE0E0E0),
                    highlightColor: const Color(0xffF5F5F5),
                    child: Container(
                      height: 52.0,
                      width: 24.0,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(
                          20.0,
                        ),
                        shape: BoxShape.rectangle,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 78.0,
                  height: 24.0,
                  child: Shimmer.fromColors(
                    baseColor: const Color(0xffE0E0E0),
                    highlightColor: const Color(0xffF5F5F5),
                    child: Container(
                      height: 52.0,
                      width: 24.0,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(
                          20.0,
                        ),
                        shape: BoxShape.rectangle,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 13.0,
            ),
            child: SizedBox(
              height: 36.0,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectIndex = index;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 5.0,
                      ),
                      width: 68.0,
                      decoration: BoxDecoration(
                        color: index == selectIndex
                            ? const Color(0xff0085FF)
                            : const Color(0xffCCE7FF),
                        borderRadius: BorderRadius.circular(
                          8.0,
                        ),
                      ),
                      child: Center(
                        child: Shimmer.fromColors(
                          baseColor: const Color(0xffE0E0E0),
                          highlightColor: const Color(0xffF5F5F5),
                          child: Container(
                            height: 12.25,
                            width: 50.0,
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(
                                20.0,
                              ),
                              shape: BoxShape.rectangle,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: isLoaded ? 2 : 4,
            itemBuilder: (context, index) {
              return Container(
                width: MediaQuery.of(context).size.width,
                height: 150.0,
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 1.0,
                      offset: const Offset(0.0, 1.0),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 5.0,
                      ),
                      child: ListTile(
                        leading: SizedBox(
                          width: 60.0,
                          child: Stack(
                            textDirection: TextDirection.rtl,
                            children: [
                              Center(
                                child: SizedBox(
                                  width: 60.0,
                                  height: 60.0,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                      30.0,
                                    ),
                                    child: Shimmer.fromColors(
                                      baseColor: const Color(0xffE0E0E0),
                                      highlightColor: const Color(0xffF5F5F5),
                                      child: Container(
                                        height: 60.0,
                                        width: 60.0,
                                        decoration: BoxDecoration(
                                          color: Colors.grey.withOpacity(0.5),
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.all(
                                  2.9,
                                ),
                                padding: const EdgeInsets.all(
                                  1.5,
                                ),
                                height: 9.0,
                                width: 9.0,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: Shimmer.fromColors(
                                  baseColor: const Color(0xffE0E0E0),
                                  highlightColor: const Color(0xffF5F5F5),
                                  child: Container(
                                    height: 60.0,
                                    width: 60.0,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.5),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        title: Padding(
                          padding: const EdgeInsets.only(
                            right: 120.0,
                          ),
                          child: Shimmer.fromColors(
                            baseColor: const Color(0xffE0E0E0),
                            highlightColor: const Color(0xffF5F5F5),
                            child: Container(
                              height: 12.25,
                              width: 12.0,
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(
                                  20.0,
                                ),
                                shape: BoxShape.rectangle,
                              ),
                            ),
                          ),
                        ),
                        titleAlignment: ListTileTitleAlignment.top,
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 8.0,
                            ),
                            SizedBox(
                              width: 120.0,
                              height: 8.0,
                              child: Shimmer.fromColors(
                                baseColor: const Color(0xffE0E0E0),
                                highlightColor: const Color(0xffF5F5F5),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(
                                      20.0,
                                    ),
                                    shape: BoxShape.rectangle,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 3.0,
                            ),
                            SizedBox(
                              width: 120.0,
                              height: 8.0,
                              child: Shimmer.fromColors(
                                baseColor: const Color(0xffE0E0E0),
                                highlightColor: const Color(0xffF5F5F5),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(
                                      20.0,
                                    ),
                                    shape: BoxShape.rectangle,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 3.0,
                            ),
                            SizedBox(
                              width: 70.0,
                              height: 8.0,
                              child: Shimmer.fromColors(
                                baseColor: const Color(0xffE0E0E0),
                                highlightColor: const Color(0xffF5F5F5),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(
                                      20.0,
                                    ),
                                    shape: BoxShape.rectangle,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 2.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 15.0,
                        right: 15.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Center(
                              child: Shimmer.fromColors(
                                baseColor: const Color(0xffE0E0E0),
                                highlightColor: const Color(0xffF5F5F5),
                                child: Container(
                                  height: 9.25,
                                  width: 130.0,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(
                                      20.0,
                                    ),
                                    shape: BoxShape.rectangle,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          listPaket[index]['status'] ==
                                      'Percakapan Masih dibuka' ||
                                  listPaket[index]['status'] ==
                                      'Masa aktif 29 hari' ||
                                  listPaket[index]['status'] ==
                                      'Masa aktif 14 hari' ||
                                  listPaket[index]['status'] ==
                                      'Masa aktif 6 hari'
                              ? ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xff0085FF),
                                    padding: const EdgeInsets.all(
                                      10.0,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                        8.0,
                                      ),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: Center(
                                    child: Shimmer.fromColors(
                                      baseColor: const Color(0xffE0E0E0),
                                      highlightColor: const Color(0xffF5F5F5),
                                      child: Container(
                                        height: 12.25,
                                        width: 50.0,
                                        decoration: BoxDecoration(
                                          color: Colors.grey.withOpacity(0.5),
                                          borderRadius: BorderRadius.circular(
                                            20.0,
                                          ),
                                          shape: BoxShape.rectangle,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : Center(
                                  child: Shimmer.fromColors(
                                    baseColor: const Color(0xffE0E0E0),
                                    highlightColor: const Color(0xffF5F5F5),
                                    child: Container(
                                      height: 12.25,
                                      width: 100.0,
                                      decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(0.5),
                                        borderRadius: BorderRadius.circular(
                                          20.0,
                                        ),
                                        shape: BoxShape.rectangle,
                                      ),
                                    ),
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
