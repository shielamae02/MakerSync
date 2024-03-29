import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_svg/svg.dart";
import "package:frontend/widgets/button_widget.dart";
import "package:frontend/widgets/text_widget.dart";

class InitializeView extends StatefulWidget {

  const InitializeView({super.key,});

  @override
  State<InitializeView> createState() => _InitializeViewState();
}

class _InitializeViewState extends State<InitializeView> {
  int _clickedOption = -1;

  final _options = [
    {
      "type" : "Default Option",
      "time" : "Selecting this option will not initiate a timer, and therefore, no notifications will be sent upon completion of the filament process.",
      "image" : ""
    },
    {
      "type" : "500 ml",
      "time" : "1 Hour",
      "image" : "assets/svgs/Bottle_500ml.svg"
    },
    {
      "type" : "1000 ml",
      "time" : "1 Hour 30 Minutes",
      "image" : "assets/svgs/Bottle_1000ml.svg"
    },
    {
      "type" : "1500 ml",
      "time" : "2 Hours",
      "image" : "assets/svgs/Bottle_1500ml.svg"
    },
    {
      "type" : "2000 ml",
      "time" : "2 Hours 30 Minutes",
      "image" : "assets/svgs/Bottle_2000ml.svg"
    },
  ];


  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height : 20.h),

        MSTextWidget(
          "Choose a bottle to start",
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
          fontColor: Theme.of(context).colorScheme.primary
        ),

        SizedBox(height : 3.h),

        const MSTextWidget(
          "Selecting a bottle will allow the system to estimate the required time for completion and notify you once it is finished.",
          textAlign: TextAlign.center,
        ),

        Expanded(
          child: ListView.builder(
            itemCount: _options.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: (){
                  setState(() {
                    _clickedOption = index;
                  });

                  print("Clicked index: $_clickedOption");
                },
                child: Column(
                  children: [
                    SizedBox(height: 60.h),
                
                    bottleOption(
                      title: _options[index]["type"].toString(),
                      time: _options[index]["time"].toString(),
                      image: _options[index]["image"].toString(),
                      index: index
                    ),
                  ],
                ),
              );
            },
          ),
        ),

        MSButtonWidget(
          btnOnTap: (){},
          btnColor: Theme.of(context).colorScheme.primary,
          child: Center(
            child: MSTextWidget(
              "Submit",
              fontColor: Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600
            )
          )
        )
      ],
    );
  }

  Widget bottleOption({
  required String title,
  required String image,
  required String time,
  required int index,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 7.w),
    child: Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          height: 270,
          width: MediaQuery.of(context).size.width * 0.5,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.tertiary,
            borderRadius: BorderRadius.circular(15.0),
            border: Border.all(
              color: (_clickedOption == index) 
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.secondary,
              width: (_clickedOption == index) 
                ? 2.0
                : 1.0
              
                
            )
          ),
        ),

        if (index != 0)
          Positioned(
            top: -50,
            child: SvgPicture.asset(
              image,
              height: 220.h,
            ),
          ),

        Positioned(
          bottom: (index == 0) ? 80 : 15,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.45 - 16.w,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                MSTextWidget(
                  title,
                  textAlign: TextAlign.center,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  fontColor: Theme.of(context).colorScheme.primary,
                ),
                
                if(index == 0)
                SizedBox(height: 10.h),

                MSTextWidget(
                  time,
                  fontWeight: FontWeight.w500,
                  textAlign: TextAlign.center,
                  fontColor: Theme.of(context).colorScheme.onBackground,
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

}