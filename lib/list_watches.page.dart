import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:watch_animation_flutter/watch.model.dart';
import 'package:watch_animation_flutter/watch.page.dart';
import 'package:watch_animation_flutter/widgets/app_bar.widget.dart';

class ListWatchesPage extends StatelessWidget {
  const ListWatchesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(
        elevation: 1,
        onPressed: () {},
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(
          FeatherIcons.menu,
          color: Colors.white,
        ),
      ),
      appBar: const WatchAppBarWidget(),
      body: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 25,
        shrinkWrap: true,
        crossAxisSpacing: 20,
        padding: const EdgeInsets.symmetric(vertical: kToolbarHeight + 60, horizontal: 15),
        childAspectRatio: 1 / 2,
        children: mockWatches
            .map((watch) => GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => WatchPage(
                              watch: watch,
                            )));
                  },
                  child: Container(
                      // color: Colors.red.withOpacity(.5),
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Stack(
                        children: [
                          Column(
                            children: [
                              const Expanded(
                                flex: 1,
                                child: SizedBox(),
                              ),
                              Expanded(
                                flex: 2,
                                child: Hero(
                                  tag: "${watch.name}_bg",
                                  child: Container(
                                    alignment: Alignment.bottomCenter,
                                    width: double.infinity,
                                    padding: const EdgeInsets.only(bottom: 20),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFF6F6F6),
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
                                            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w900,
                                                ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            watch.provider.toUpperCase(),
                                            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                                  fontWeight: FontWeight.w100,
                                                ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "${watch.price} €",
                                            style: Theme.of(context).textTheme.headline6!.copyWith(
                                                  color: Theme.of(context).primaryColor,
                                                  fontWeight: FontWeight.w900,
                                                ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 5),
                            child: AspectRatio(
                              aspectRatio: 1 / 1,
                              child: Hero(
                                tag: "${watch.name}_image",
                                child: Image.asset(
                                  watch.assetImage,
                                  height: 220,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                ))
            .toList(),
      ),
    );
  }
}
