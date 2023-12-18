import 'package:empathi_care/view/screen/profile_psikolog_screen.dart';
import 'package:empathi_care/view_model/psikolog_view_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';

class RekomendasiPsikolog extends StatefulWidget {
  const RekomendasiPsikolog({super.key});

  @override
  State<RekomendasiPsikolog> createState() => _RekomendasiPsikologState();
}

class _RekomendasiPsikologState extends State<RekomendasiPsikolog> {
  final _formKey = GlobalKey<FormState>();

  late PsikologProvider provider;
  late SharedPreferences sp;
  String token = '';

  @override
  void initState() {
    provider = Provider.of<PsikologProvider>(context, listen: false);
    initial();
    super.initState();
  }

  void initial() async {
    sp = await SharedPreferences.getInstance();
    token = sp.getString('accesstoken').toString();
    provider.fetchListPsikolog(token);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.white,
          backgroundColor: Colors.white,
          elevation: 5,
          shadowColor: Colors.black,
          title: Text(
            "Rekomendasi Psikolog",
            style: GoogleFonts.montserrat(
              fontSize: 16.0,
              color: const Color(0xff393938),
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        body: Builder(builder: (context) {
          return Consumer<PsikologProvider>(builder: (context, value, child) {
            if (provider.isLoading == true) {
              return shimmerLoading();
            } else {
              return SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              margin: const EdgeInsets.only(
                                  top: 20, bottom: 20, left: 20),
                              width: 250,
                              height: 50,
                              child: TextFormField(
                                controller: provider.searchController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                  ),
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Icon(
                                      Icons.search,
                                      size: 23,
                                    ),
                                  ),
                                  hintText: "Search",
                                ),
                                onChanged: (text) async {
                                  // final String query = viewModel.search.text;
                                  await provider.fetchListPsikologSearch(token);
                                },
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            margin: const EdgeInsets.only(
                                top: 20, bottom: 20, right: 20),
                            height: 50,
                            child: OutlinedButton.icon(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0)),
                                ),
                              ),
                              onPressed: () {},
                              icon: const Icon(
                                Icons.filter_alt_outlined,
                                size: 24.0,
                                color: Colors.black,
                              ),
                              label: Text(
                                'Filter',
                                style: GoogleFonts.montserrat(
                                  fontSize: 13.0,
                                  color: const Color(0xff393938),
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      provider.notFound != true
                          ? Column(
                              children: [
                                for (var data in provider.dataPsikolog!.data)
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              width: 3)),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.white,
                                          spreadRadius: 2,
                                          blurRadius: 5,
                                          // offset: Offset(, 3),
                                        ),
                                      ],
                                    ),
                                    margin: const EdgeInsets.only(bottom: 12.0),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 8),
                                      child: Column(
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                height: 80,
                                                width: 80,
                                                decoration: BoxDecoration(
                                                  color: Colors.blue,
                                                  shape: BoxShape.circle,
                                                  image: DecorationImage(
                                                    image: NetworkImage(
                                                        data.doctorAvatar),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 9),
                                              Flexible(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      data.doctorName,
                                                      style: const TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    const SizedBox(height: 5),
                                                    const Text(
                                                      "Spesialis Positive psychology",
                                                      style:
                                                          TextStyle(fontSize: 14),
                                                    ),
                                                    const SizedBox(height: 3),
                                                    const Text(
                                                      "Online",
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          color: Colors.green,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 6),
                                          Row(
                                            children: [
                                              Row(
                                                children: [
                                                  const Icon(
                                                    Icons.thumbs_up_down,
                                                    color: Colors.blue,
                                                  ),
                                                  const SizedBox(width: 7),
                                                  Text(
                                                    "${provider.percentageRating.toString()} %",
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                  const SizedBox(width: 8),
                                                  const Icon(
                                                    Icons.rate_review,
                                                    color: Colors.blue,
                                                  ),
                                                  const SizedBox(width: 7),
                                                  Text(
                                                    provider.countReviewDocter
                                                        .toString(),
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const Spacer(),
                                              ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 10),
                                                    backgroundColor:
                                                        Colors.blue,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                  ),
                                                  onPressed: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (_) =>
                                                                const ProfilePsikologScreen(
                                                                    isInstan:
                                                                        false)));
                                                  },
                                                  child: const Text(
                                                    "Mulai Chat",
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white,
                                                    ),
                                                  )),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                              ],
                            )
                          : Center(
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  children: [
                                    const Text(
                                      "Tidak menemukan hasil yang sesuai. Silakan coba kata kunci lainnya.",
                                      textAlign: TextAlign.center,
                                    ),
                                    Image.asset(
                                      "assets/images/Reminders-rafiki 1.png",
                                      width: 305,
                                      height: 305,
                                    )
                                  ],
                                ),
                              ),
                            ),
                    ],
                  ),
                ),
              );
            }
          });
        }));
  }

  Padding shimmerLoading() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      height: 20,
                      width: 20,
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey,
                        highlightColor: Colors.white.withOpacity(0.2),
                        child: Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.5),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      height: 10,
                      width: 40,
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey,
                        highlightColor: Colors.white.withOpacity(0.2),
                        child: Container(
                          height: 10,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(8),
                            // shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      height: 16,
                      width: 16,
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey,
                        highlightColor: Colors.white.withOpacity(0.2),
                        child: Container(
                          height: 16,
                          width: 16,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.5),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: 27,
                      height: 10,
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey,
                        highlightColor: Colors.white.withOpacity(0.2),
                        child: Container(
                          width: 27,
                          height: 10,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(8),
                            // shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                // const SizedBox(
                //   width: 156,
                // ),
              ],
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: 4,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: const EdgeInsets.only(bottom: 12.0),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            child: Shimmer.fromColors(
                              baseColor: Colors.grey.withOpacity(0.5),
                              highlightColor: Colors.white.withOpacity(0.2),
                              child: Container(
                                height: 80,
                                width: 80,
                                decoration: const BoxDecoration(
                                  color: Colors.grey,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 9),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 143,
                                height: 12,
                                child: Shimmer.fromColors(
                                  baseColor: Colors.grey.withOpacity(0.5),
                                  highlightColor: Colors.white.withOpacity(0.2),
                                  child: Container(
                                    height: 143,
                                    width: 12,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Colors.grey.withOpacity(0.5),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              SizedBox(
                                width: 143,
                                height: 9,
                                child: Shimmer.fromColors(
                                  baseColor: Colors.grey.withOpacity(0.5),
                                  highlightColor: Colors.white.withOpacity(0.2),
                                  child: Container(
                                    height: 143,
                                    width: 9,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Colors.grey.withOpacity(0.5),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              SizedBox(
                                width: 119,
                                height: 9,
                                child: Shimmer.fromColors(
                                  baseColor: Colors.grey.withOpacity(0.5),
                                  highlightColor: Colors.white.withOpacity(0.2),
                                  child: Container(
                                    height: 119,
                                    width: 9,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Colors.grey.withOpacity(0.5),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 20,
                                height: 20,
                                child: Shimmer.fromColors(
                                  baseColor: Colors.grey.withOpacity(0.5),
                                  highlightColor: Colors.white.withOpacity(0.2),
                                  child: Container(
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Colors.grey.withOpacity(0.5),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 7),
                              SizedBox(
                                width: 20,
                                height: 9,
                                child: Shimmer.fromColors(
                                  baseColor: Colors.grey.withOpacity(0.5),
                                  highlightColor: Colors.white.withOpacity(0.2),
                                  child: Container(
                                    width: 20,
                                    height: 9,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Colors.grey.withOpacity(0.5),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              SizedBox(
                                width: 20,
                                height: 20,
                                child: Shimmer.fromColors(
                                  baseColor: Colors.grey.withOpacity(0.5),
                                  highlightColor: Colors.white.withOpacity(0.2),
                                  child: Container(
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Colors.grey.withOpacity(0.5),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 7),
                              SizedBox(
                                width: 20,
                                height: 9,
                                child: Shimmer.fromColors(
                                  baseColor: Colors.grey.withOpacity(0.5),
                                  highlightColor: Colors.white.withOpacity(0.2),
                                  child: Container(
                                    width: 20,
                                    height: 9,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Colors.grey.withOpacity(0.5),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                backgroundColor: Colors.blue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              onPressed: () {},
                              child: SizedBox(
                                width: getTextWidth(
                                    "Mulai Chat",
                                    const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal)),
                                height: 10,
                                child: Shimmer.fromColors(
                                  baseColor: const Color(0xffDBDBDB),
                                  highlightColor: const Color(0xffDBDBDB),
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
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  double getTextWidth(String text, TextStyle style) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout(minWidth: 0, maxWidth: double.infinity);

    return textPainter.width;
  }
}
