import 'package:cached_network_image/cached_network_image.dart';
import 'package:cracktech_assessment/Controller/DetailsScreenController.dart';
import 'package:cracktech_assessment/Utils/AppImages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {

  final DetailsScreenController controller = Get.put(DetailsScreenController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(top: -15,left: 0.0,right:0.0, child: Hero(tag:"cover",child: CachedNetworkImage(
              imageUrl: controller.photo,
              imageBuilder: (context, imageProvider) => Container(
                height: 512.0,
                width: 512.0,
                decoration: BoxDecoration(
                    image: DecorationImage(image: imageProvider, fit: BoxFit.cover)
                ),
              ),
              placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Image.asset(AppImages.instance.errorImage),
            )),),
            Positioned(top: 15.0,left: 15.0,child: InkWell(onTap: () {Get.back();},child: SvgPicture.asset(AppImages.instance.backLogo,)),),
            Positioned(top: 370.0,child: Container(
              width: MediaQuery.sizeOf(context).width,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0),topRight: Radius.circular(15.0)),
                  color: Colors.white
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          height: 55.0,
                          child: ListView.separated(separatorBuilder:(_,__) => Container(), shrinkWrap:true,itemBuilder: (context,index) => genreItem(index),itemCount: controller.genre.length,scrollDirection: Axis.horizontal,)
                      ),
                      const SizedBox(height: 10.0,),
                      Text(controller.title,style: GoogleFonts.inter(fontWeight: FontWeight.bold,fontSize: 32)),
                      RichText(text: TextSpan(
                          children: [
                            TextSpan(text: "Year: ",style: GoogleFonts.inter(fontWeight: FontWeight.normal,fontSize: 18.0,color: Colors.black45)),
                            TextSpan(text: controller.year,style: GoogleFonts.inter(fontWeight: FontWeight.normal,fontSize: 18.0,color: Colors.black45)),
                          ]
                      )),
                      const SizedBox(height: 10.0,),
                      Text("Director:",style: GoogleFonts.inter(fontWeight: FontWeight.bold,fontSize: 20.0)),
                      Text(controller.director,style: GoogleFonts.inter(fontWeight: FontWeight.normal,fontSize: 18.0)),
                      const SizedBox(height: 10.0,),
                      Text("Actors:",style: GoogleFonts.inter(fontWeight: FontWeight.bold,fontSize: 20.0)),
                      Text(controller.actors,style: GoogleFonts.inter(fontWeight: FontWeight.normal,fontSize: 18.0)),
                      const SizedBox(height: 10.0,),
                      Text("Plot:",style: GoogleFonts.inter(fontWeight: FontWeight.bold,fontSize: 20.0)),
                      Text(controller.plot,style: GoogleFonts.inter(fontWeight: FontWeight.normal,fontSize: 18.0)),
                    ],
                  ),
                ),
              ),
            ),),
          ],
        ),
      ),
    );
  }

  Widget genreItem(int index){
    return Padding(
      padding: const EdgeInsets.only(right:10.0,top: 10.0,bottom: 10.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            border: Border.all(width: 1.0,color: Colors.black54)
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20.0,5.0,20.0,5.0),
          child: Center(child: Text(controller.genre[index],style: GoogleFonts.inter(fontWeight: FontWeight.normal,fontSize: 18.0))),
        ),
      ),
    );
  }

}
