import 'package:empathi_care/model/active_package_models.dart';
import 'package:empathi_care/view_model/instants_view_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class InstantWidget extends StatefulWidget {
  const InstantWidget({super.key});

  @override
  State<InstantWidget> createState() => _InstantWidgetState();
}

class _InstantWidgetState extends State<InstantWidget> {
  @override
  void initState() {
    super.initState();
    Provider.of<InstantViewModel>(context, listen: false)
        .fetchDataInstant();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<InstantViewModel>(
      builder: (context, instantViewModel, child) {
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
                  itemCount: instantViewModel.categories.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        instantViewModel.selectCategories(index);
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 5.0,
                        ),
                        width: 68.0,
                        decoration: BoxDecoration(
                          color: index == instantViewModel.selectedIndex
                              ? const Color(0xff0085FF)
                              : const Color(0xffCCE7FF),
                          borderRadius: BorderRadius.circular(
                            8.0,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            instantViewModel.categories[index],
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14.0,
                              color: index == instantViewModel.selectedIndex
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
            instantViewModel.selectedIndex == 0 &&
                    instantViewModel.activePackageModel != null
                ? cardInstant(instantViewModel.activePackageModel!.data!)
                : instantViewModel.selectedIndex == 2 &&
                        instantViewModel.activePackageModel != null
                    ? cardInstant(instantViewModel.activePackageModel!.data!
                        .where((element) => element.status == 'Not finished')
                        .toList())
                    : instantViewModel.selectedIndex == 1
                        ? cardInstant(instantViewModel.activePackageModel!.data!
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
        final datas = data[index];
        if (datas.status == 'pending') {
          return null;
        }
        return datas.counselingType == "A"
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
                      color: Colors.black.withOpacity(0.6),
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
                                      child: Image(
                                        image: NetworkImage(
                                          '${datas.doctorAvatar}',
                                        ),
                                        fit: BoxFit.cover,
                                      ),),
                                ),
                              ),
                            ],
                          ),
                        ),
                        title: Text(
                          '${datas.doctorName}',
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
                              'Metode ${datas.counselingMethod}',
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w400,
                                fontSize: 10.0,
                                color: const Color(0xff323232),
                              ),
                            ),
                            Text(
                              'Topik ${datas.counselingTopic}',
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
                              color: '${datas.status}' == 'Not Finished'
                                  ? const Color(0xff54C438)
                                  : const Color(0xff959595),
                              borderRadius: BorderRadius.circular(
                                4.0,
                              ),
                            ),
                            child: GestureDetector(
                              onTap: () {},
                              child: datas.status == 'Not Finished'
                                  ? Text(
                                      'Percakapan masih dibuka',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 10.0,
                                      ),
                                    )
                                  : Text(
                                      'Percakapan sudah ditutup',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 10.0,
                                      ),
                                    ),
                            ),
                          ),
                          '${datas.status}' == 'Not Finished'
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
                                  child: Text(
                                    'Mulai Chat',
                                    style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              : OutlinedButton(
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
                                ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            : const SizedBox();
      },
    );
  }
}