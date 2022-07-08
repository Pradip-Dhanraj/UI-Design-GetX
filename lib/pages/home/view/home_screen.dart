import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qubehealth/common/widgets/calendar.dart';
import 'package:qubehealth/common/widgets/mood_meter.dart';
import 'package:qubehealth/common/widgets/schedule.dart';
import 'package:qubehealth/models/feelings_model.dart';
import 'package:qubehealth/pages/home/controller/home_controller.dart';
import 'package:youtube/youtube_thumbnail.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homeController = Get.find<HomeController>();

  @override
  void initState() {
    homeController.onPageInitialized();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        elevation: 0.0,
        leading: InkWell(
          onTap: () {
            //Navigate back
            Get.offNamed('/setting');
          },
          child: const Icon(
            Icons.chevron_left,
          ),
        ),
        backgroundColor: Colors.white,
        title: const Text(
          "Your Feelings History",
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(20),
        child: Column(
          children: [
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return FutureBuilder(
                    future: homeController.apiservice.getFeelingPercentage(),
                    builder: (bc, snap) {
                      return snap.hasData
                          ? MoodMeterView(
                              constraints,
                              snap.data as List<Feelings>,
                            )
                          : const Center(
                              child: CircularProgressIndicator(),
                            );
                    },
                  );
                },
              ),
            ),
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(0),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: Colors.blue.withAlpha(80)),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: Text(
                              "${DateTime.now().day} Jun, ${DateTime.now().year}",
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: ObxValue(
                            (data) => CalendarView(
                              homeController.weekDays.value,
                              constraints,
                            ),
                            [].obs,
                          ),
                        )
                      ],
                    );
                  },
                ),
              ),
            ),
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: FutureBuilder(
                future: homeController.apiservice.getSchedule(),
                builder: (context, snapshot) {
                  return LayoutBuilder(builder: (context, constraints) {
                    var fontSize = constraints.minHeight * 0.13;
                    var space = constraints.minHeight;
                    return snapshot.hasData
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: (snapshot.data as List<Feelings>)
                                .map((e) => getScheduleTile(
                                      space,
                                      fontSize,
                                      e.label!,
                                      e.icon!,
                                    ))
                                .toList(),
                          )
                        : const Center(
                            child: CircularProgressIndicator(),
                          );
                  });
                },
              ),
            ),
            Flexible(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: LayoutBuilder(builder: ((context, constraints) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          "You May Find Interesting",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                      ObxValue(
                        (data) => Text(
                          homeController.desc.value,
                          textAlign: TextAlign.justify,
                          maxLines: 4,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        false.obs,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: ObxValue(
                            (data) => homeController.url.value == ''
                                ? SizedBox()
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.network(
                                      YoutubeThumbnail(
                                        youtubeId: homeController.url.value,
                                      ).hd(),
                                      height: constraints.maxHeight * 0.45,
                                      width: constraints.maxHeight * 0.45,
                                    ),
                                  ),
                            false.obs,
                          ),
                        ),
                      ),
                    ],
                  );
                })),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
