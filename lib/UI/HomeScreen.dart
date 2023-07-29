import 'package:cached_network_image/cached_network_image.dart';
import 'package:cracktech_assessment/Controller/HomeScreenController.dart';
import 'package:cracktech_assessment/Utils/AppImages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeScreenController controller = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          decoration: const BoxDecoration(color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      Icons.menu,
                      size: 36.0,
                      color: Colors.black,
                    ),
                    Text(
                      "MovieOnline",
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.bold, fontSize: 18.0),
                    ),
                    CircleAvatar(
                      radius: 22,
                      backgroundImage: AssetImage(AppImages.instance.userImage),
                    )
                  ],
                ),
                Obx(() => controller.isDataLoading == true
                    ? Shimmer.fromColors(
                  baseColor: Colors.black87,
                  highlightColor: Colors.black26,
                  enabled: true,
                  child: SizedBox(
                      height: 55.0,
                      child: ListView.separated(
                        separatorBuilder: (_, __) => Container(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) => genreShimmerItem(),
                        itemCount: 4,
                        scrollDirection: Axis.horizontal,
                      )),
                )
                    : SizedBox(
                        height: 55.0,
                        child: ListView.separated(
                          separatorBuilder: (_, __) => Container(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) => genreItem(index),
                          itemCount: controller.movieListBaseResponse.genres?.length ?? 0,
                          scrollDirection: Axis.horizontal,
                        ))),
                Obx(
                  () => controller.isDataLoading == true
                      ? Padding(
                          padding:
                              const EdgeInsets.only(top: 10.0, bottom: 10.0),
                          child: Text(
                            "0 Movies",
                            style: GoogleFonts.inter(
                                fontWeight: FontWeight.bold, fontSize: 18.0),
                          ),
                        )
                      : Padding(
                          padding:
                              const EdgeInsets.only(top: 10.0, bottom: 10.0),
                          child: Text(
                            "${controller.movieListBaseResponse.movies?.length} Movies",
                            style: GoogleFonts.inter(
                                fontWeight: FontWeight.bold, fontSize: 18.0),
                          ),
                        ),
                ),
                Obx(() => controller.isDataLoading == true
                    ? Expanded(
                        child: Center(
                        child: Lottie.asset(AppImages.instance.loadingAnim,
                            height: 180.0, width: 180.0),
                      ))
                    : Expanded(
                        child: ListView.builder(
                        itemBuilder: (context, index) => movieItem(index),
                        itemCount: controller.movieListBaseResponse.movies?.length,
                        scrollDirection: Axis.vertical,
                      )))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget genreItem(int index) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            border: Border.all(width: 1.0, color: Colors.black54)),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
          child: Center(
              child: Text("${controller.movieListBaseResponse.genres?[index]}",
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.normal, fontSize: 18.0))),
        ),
      ),
    );
  }

  Widget genreShimmerItem() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            color: Colors.black12,
            border: Border.all(width: 1.0, color: Colors.black54)),
        child: const Padding(
          padding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
          child: SizedBox(
            height: 15.0,
            width: 35.0,
          ),
        ),
      ),
    );
  }

  Widget movieItem(int index) {
    return InkWell(
      onTap: () {
        Get.toNamed("detailsPage");
      },
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(width: 1.0, color: Colors.black12)),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Container(
                  height: 140.0,
                  width: 115.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: controller.movieListBaseResponse.movies![index].posterUrl!,
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(image: imageProvider, fit: BoxFit.fill)
                      ),
                    ),
                    placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => Image.asset(AppImages.instance.errorImage,height: 36.0,width: 36.0,),
                  ),
                ),
                const SizedBox(
                  width: 20.0,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${controller.movieListBaseResponse.movies?[index].title}",
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.bold, fontSize: 22.0)),
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: "Year: ",
                            style: GoogleFonts.inter(
                                fontWeight: FontWeight.normal,
                                fontSize: 18.0,
                                color: Colors.black45)),
                        TextSpan(
                            text: "${controller.movieListBaseResponse.movies?[index].year}",
                            style: GoogleFonts.inter(
                                fontWeight: FontWeight.normal,
                                fontSize: 18.0,
                                color: Colors.black45)),
                      ])),
                      Text("Director:",
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.normal,
                              fontSize: 18.0,
                              color: Colors.black45)),
                      Text("${controller.movieListBaseResponse.movies?[index].director}",
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.normal,
                              fontSize: 18.0,
                              color: Colors.black)),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
