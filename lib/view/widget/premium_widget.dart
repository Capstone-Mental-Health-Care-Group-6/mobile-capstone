import 'package:empathi_care/model/active_package_models.dart';
import 'package:empathi_care/view/screen/zoom_screen.dart';
import 'package:empathi_care/view_model/premium_view_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PremiumWidget extends StatefulWidget {
  const PremiumWidget({super.key});

  @override
  State<PremiumWidget> createState() => _PremiumWidgetState();
}

class _PremiumWidgetState extends State<PremiumWidget> {
  @override
  void initState() {
    super.initState();
    Provider.of<PremiumViewModel>(context, listen: false).fetchDataPremium();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PremiumViewModel>(
      builder: (context, premiumModel, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 13.0,
              ),
              child: SizedBox(
                height: 36.0,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: premiumModel.categories.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        premiumModel.selectCategories(index);
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 5.0,
                        ),
                        width: 68.0,
                        decoration: BoxDecoration(
                          color: index == premiumModel.selectedIndex
                              ? const Color(0xff0085FF)
                              : const Color(0xffCCE7FF),
                          borderRadius: BorderRadius.circular(
                            8.0,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            premiumModel.categories[index],
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14.0,
                              color: index == premiumModel.selectedIndex
                                  ? Colors.white
                                  : Colors.black,
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
              height: 10.0,
            ),
            premiumModel.selectedIndex == 0 &&
                    premiumModel.activePackageModel != null
                ? cardInstant(premiumModel.activePackageModel!.data!
                    .where((element) => element.status != 'pending')
                    .toList())
                : premiumModel.selectedIndex == 2 &&
                        premiumModel.activePackageModel != null
                    ? cardInstant(premiumModel.activePackageModel!.data!
                        .where((element) => element.status == 'not_finished')
                        .toList())
                    : premiumModel.selectedIndex == 1
                        ? cardInstant(premiumModel.activePackageModel!.data!
                            .where((element) => element.status == 'finished')
                            .toList())
                        : const SizedBox(),
          ],
        );
      },
    );
  }

  Widget cardInstant(List<Data> data) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: data.length,
      itemBuilder: (context, index) {
        final data1 = data[index];
        if (data1.status == 'pending') {
          return null;
        } else {
          return data1.counselingType == "B"
              ? Container(
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
                          leading: Container(
                            width: 60.0,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: SizedBox(
                              width: 60.0,
                              height: 60.0,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                  30.0,
                                ),
                                child: Image(
                                  image: NetworkImage(
                                    '${data1.doctorAvatar}',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          title: Text(
                            '${data1.doctorName}',
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w700,
                              fontSize: 14.0,
                            ),
                          ),
                          titleAlignment: ListTileTitleAlignment.top,
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 8.0,
                              ),
                              Text(
                                'Spesialis Psikologi',
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10.0,
                                  color: const Color(0xff323232),
                                ),
                              ),
                              Text(
                                'Metode ${data1.counselingMethod}',
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10.0,
                                  color: const Color(0xff323232),
                                ),
                              ),
                              Text(
                                'Topik ${data1.counselingTopic}',
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10.0,
                                  color: const Color(0xff323232),
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
                            Container(
                              width: 152.0,
                              height: 20.0,
                              padding: const EdgeInsets.only(
                                top: 3.0,
                              ),
                              decoration: BoxDecoration(
                                color: data1.date! == 'masa'
                                    ? const Color(0xff54C438)
                                    : const Color(0xff959595),
                                borderRadius: BorderRadius.circular(
                                  4.0,
                                ),
                              ),
                              child: GestureDetector(
                                onTap: () {},
                                child: data1.status == 'not_finished'
                                    ? Text(
                                        'Masa aktif',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 10.0,
                                        ),
                                      )
                                    : Text(
                                        'formatDate',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 10.0,
                                        ),
                                      ),
                              ),
                            ),
                            data1.status == 'finished'
                                ? OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                      padding: const EdgeInsets.all(10.0),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                          8.0,
                                        ),
                                      ),
                                      side: const BorderSide(
                                        color: Color(0xff0085FF),
                                      ),
                                      foregroundColor: const Color(0xff0085FF),
                                    ),
                                    onPressed: () {},
                                    child: Text(
                                      'Chat Kembali',
                                      style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 12.0,
                                      ),
                                    ),
                                  )
                                : ElevatedButton(
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
                                    onPressed: () {
                                      data1.counselingMethod == 'Gmeet'
                                          ? Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const ZoomScreen(),
                                              ),
                                            )
                                          : data1.counselingMethod == 'Chat'
                                              ? Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (_) =>
                                                        const ZoomScreen(),
                                                  ),
                                                )
                                              : const SizedBox();
                                    },
                                    child: data1.counselingMethod == 'Chat'
                                        ? Text(
                                            'Mulai Chat',
                                            style: GoogleFonts.montserrat(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 12.0,
                                              color: Colors.white,
                                            ),
                                          )
                                        : Text(
                                            'Mulai Gmeet',
                                            style: GoogleFonts.montserrat(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 12.0,
                                              color: Colors.white,
                                            ),
                                          ),
                                  ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              : const SizedBox();
        }
      },
    );
  }
}
