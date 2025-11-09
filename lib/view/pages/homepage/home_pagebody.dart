import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ourcommunity/core/class/handling_data.dart';
import 'package:ourcommunity/core/constant/color.dart';
import '../../../controller/home/home_page_controller.dart';
import '../../widgets/homepage/eventlist.dart';
import '../../widgets/homepage/searchfield.dart';
import '../../widgets/homepage/filterdrawer.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeControllerImp>(
      builder: (controller) => Scaffold(
        appBar: HomeAppBar(context),
        endDrawer: FilterDrawer(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
          child: RefreshIndicator(
            onRefresh: () async {
              controller.statusR = Statusreqest.loading;
              await controller.getUserDataById();
              await controller.setEventsType();
              controller.statusR = Statusreqest.success;
            },
            backgroundColor: Appcolor.backgroundColor,
            color: Appcolor.primarycolor,
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                    child: SearchField(
                  controller: controller.serachController,
                  onChanged: (value) => controller.serachInEvents(),
                )),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 10,
                  ),
                ),
                const EventList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar HomeAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Appcolor.backgroundColor,
      centerTitle: true,
      title: Text(
        "Home".tr,
        style: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
          color: Appcolor.primarycolor,
        ),
      ),
      automaticallyImplyLeading: false,
      actions: [
        Builder(
          builder: (context) => IconButton(
            icon: Icon(
              Icons.filter_list,
              color: Appcolor.primarycolor,
              size: 22.sp,
            ),
            onPressed: () {
              Scaffold.of(context).openEndDrawer();
            },
          ),
        ),
      ],
    );
  }
}
