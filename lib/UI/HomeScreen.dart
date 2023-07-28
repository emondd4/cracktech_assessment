import 'package:cracktech_assessment/Utils/AppImages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          decoration: const BoxDecoration(
            color: Colors.white
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.menu,size: 36.0,color: Colors.black,),
                    Text("MovieOnline",style: GoogleFonts.inter(fontWeight: FontWeight.bold,fontSize: 18.0),),
                    CircleAvatar(
                      radius: 22,
                      backgroundImage:AssetImage(AppImages.instance.userImage),
                    )
                  ],
                ),
                SizedBox(
                  height: 55.0,
                    child: ListView.separated(separatorBuilder:(_,__) => Container(), shrinkWrap:true,itemBuilder: (context,index) => genreItem(),itemCount: 7,scrollDirection: Axis.horizontal,)
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0,bottom: 10.0),
                  child: Text("4 Crime Movies",style: GoogleFonts.inter(fontWeight: FontWeight.bold,fontSize: 18.0),),
                ),
                Expanded(child: ListView.builder(itemBuilder: (context,index) => movieItem(),itemCount: 10,scrollDirection: Axis.vertical,))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget genreItem(){
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          border: Border.all(width: 1.0,color: Colors.black54)
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20.0,5.0,20.0,5.0),
          child: Center(child: Text("Crime",style: GoogleFonts.inter(fontWeight: FontWeight.normal,fontSize: 18.0))),
        ),
      ),
    );
  }

  Widget movieItem(){
    return InkWell(
      onTap: () {
        Get.toNamed("detailsPage");
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            border: Border.all(width: 1.0,color: Colors.black12)
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Container(
                height: 140.0,
                width: 115.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  image: DecorationImage(image: AssetImage(AppImages.instance.userImage,),fit: BoxFit.cover)
                ),
              ),
              const SizedBox(width: 20.0,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("The Cotton Club",style: GoogleFonts.inter(fontWeight: FontWeight.bold,fontSize: 22.0)),
                  RichText(text: TextSpan(
                    children: [
                      TextSpan(text: "Year: ",style: GoogleFonts.inter(fontWeight: FontWeight.normal,fontSize: 18.0,color: Colors.black45)),
                      TextSpan(text: "1984",style: GoogleFonts.inter(fontWeight: FontWeight.normal,fontSize: 18.0,color: Colors.black45)),
                    ]
                  )),
                  Text("Director:",style: GoogleFonts.inter(fontWeight: FontWeight.normal,fontSize: 18.0,color: Colors.black45)),
                  Text("Francis Ford Coppola",style: GoogleFonts.inter(fontWeight: FontWeight.normal,fontSize: 18.0,color: Colors.black)),
                ],
              )
            ],
          ),
        )
      ),
    );
  }

}
