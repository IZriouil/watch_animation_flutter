import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:watch_animation_flutter/watch.model.dart';

class ListWatchesPage extends StatelessWidget {
  const ListWatchesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: IconButton(
          icon: const Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: RotatedBox(
              quarterTurns: 1,
              child: Icon(
                FeatherIcons.barChart2,
                color: Colors.black,
              ),
            ),
          ),
          onPressed: () => SystemNavigator.pop(),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: IconButton(
              icon: const Icon(
                FeatherIcons.search,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
          ),
        ],
        title: ColorFiltered(
            colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),
            child: SizedBox(
              height: kToolbarHeight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  "assets/images/steizy.png",
                  fit: BoxFit.fitHeight,
                ),
              ),
            )),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 50,
        shrinkWrap: true,
        crossAxisSpacing: 20,
        padding: const EdgeInsets.symmetric(vertical: kToolbarHeight + 40, horizontal: 30),
        childAspectRatio: 2 / 3,
        children: mockWatches
            .map((watch) => Container(
                    // color: Colors.red.withOpacity(.5),
                    child: Stack(
                  children: [
                    Column(
                      children: [
                        Expanded(
                          flex: 3,
                          child: SizedBox(),
                        ),
                        Expanded(
                          flex: 5,
                          child: Container(
                            alignment: Alignment.bottomCenter,
                            width: double.infinity,
                            padding: const EdgeInsets.only(bottom: 20),
                            decoration: BoxDecoration(
                              color: Color(0xFFF6F6F6),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: IntrinsicHeight(
                              child: Column(
                                children: [
                                  // const SizedBox(
                                  //   height: 100,
                                  // ),
                                  Text(
                                    watch.name,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    watch.provider,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "${watch.price} €",
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20.0, left: 10),
                        child: Image.asset(
                          watch.assetImage,
                          height: 220,
                        ),
                      ),
                    ),
                  ],
                )))
            .toList(),
      ),

      // ListView.builder(
      //   itemCount: mockWatches.length,
      //   physics: const BouncingScrollPhysics(),
      //   itemBuilder: (context, index) => Row(
      //     children: [
      //       Expanded(
      //         child: Stack(
      //           children: [
      //             Column(
      //               children: [
      //                 SizedBox(
      //                   height: 70,
      //                 ),
      //                 Container(
      //                   height: 200,
      //                   margin: const EdgeInsets.all(16),
      //                   decoration: BoxDecoration(
      //                     color: const Color(0xFFF6F6F6),
      //                     border: Border.all(color: Colors.black.withOpacity(0.01)),
      //                     borderRadius: BorderRadius.circular(20),
      //                   ),
      //                 )
      //               ],
      //             ),
      //             Align(
      //               alignment: Alignment.topCenter,
      //               child: Image.asset(
      //                 mockWatches[index].assetImage,
      //                 height: 180,
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //       Expanded(
      //         child: Stack(
      //           children: [
      //             Column(
      //               children: [
      //                 SizedBox(
      //                   height: 70,
      //                 ),
      //                 Container(
      //                   height: 200,
      //                   margin: const EdgeInsets.all(16),
      //                   decoration: BoxDecoration(
      //                     color: const Color(0xFFF6F6F6),
      //                     border: Border.all(color: Colors.black.withOpacity(0.01)),
      //                     borderRadius: BorderRadius.circular(20),
      //                   ),
      //                   child: Center(
      //                     child: Column(
      //                       children: [
      //                         const SizedBox(
      //                           height: 110,
      //                         ),
      //                         Text(
      //                           mockWatches[1].name,
      //                           style: TextStyle(
      //                             fontSize: 20,
      //                             fontWeight: FontWeight.bold,
      //                           ),
      //                         ),
      //                         const SizedBox(
      //                           height: 5,
      //                         ),
      //                         Text(
      //                           mockWatches[1].provider,
      //                           textAlign: TextAlign.center,
      //                         ),
      //                         const SizedBox(
      //                           height: 5,
      //                         ),
      //                         Text(
      //                           "${mockWatches[1].price} €",
      //                           textAlign: TextAlign.center,
      //                         ),
      //                       ],
      //                     ),
      //                   ),
      //                 )
      //               ],
      //             ),
      //             Align(
      //               alignment: Alignment.topCenter,
      //               child: Image.asset(
      //                 "assets/images/watch.png",
      //                 height: 180,
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
