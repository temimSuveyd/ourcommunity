import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ourcommunity/core/constant/color.dart';
import 'package:ourcommunity/data/model/membership_requests/membership_requests_model.dart';
import 'package:ourcommunity/data/model/user_model.dart';

class GroupInvitationsCard extends StatelessWidget {
  const GroupInvitationsCard({
    super.key,
    required this.groupRequestModel,
    required this.onAccept,
    required this.onDecline,
    required this.onDetails,
    required this.isSender,
  });

  final Function() onAccept;
  final Function() onDecline;
  final Function() onDetails;
  final GroupRequestModel groupRequestModel;
  final bool isSender;

  @override
  Widget build(BuildContext context) {
    final UserModel? userModel = isSender
        ? groupRequestModel.requestToModel
        : groupRequestModel.senderModel;
    final bool isPending = groupRequestModel.requesteStatus == 'pending';
    return Container(
      decoration: BoxDecoration(
        color: Appcolor.colorbackground,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Appcolor.grey.withOpacity(0.3),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ----- Top Section: Personal Info -----
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 22.r,
                  backgroundImage: NetworkImage(userModel!.photo!),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userModel.name!,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Appcolor.primarycolor,
                          fontFamily: "cairo",
                          fontSize: 15.sp,
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        groupRequestModel.teamModel!.teamName!,
                        style: TextStyle(
                          color: Appcolor.primarycolor,
                          fontSize: 13.sp,
                          fontFamily: "cairo",
                        ),
                      ),
                    ],
                  ),
                ),
                // --- Group Details Button ---
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(22.r),
                    onTap: () => onDetails(),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Appcolor.primarycolor.withOpacity(0.08),
                        borderRadius: BorderRadius.circular(22.r),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                      child: Row(
                        children: [
                          Icon(Icons.open_in_new,
                              color: Appcolor.primarycolor, size: 18),
                          SizedBox(width: 5.w),
                          Text(
                            "Details",
                            style: TextStyle(
                              color: Appcolor.primarycolor,
                              fontFamily: "cairo",
                              fontWeight: FontWeight.bold,
                              fontSize: 13.sp,
                              letterSpacing: .4,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            // ----- Group Description -----
            Padding(
              padding:
                  EdgeInsets.only(left: 2.w, right: 2.w, bottom: 1.h, top: 3.h),
              child: Text(
                groupRequestModel.teamModel!.teamDescription!,
                style: TextStyle(
                  color: Appcolor.grey,
                  fontSize: 13.sp,
                  fontFamily: "cairo",
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 14.h),
            // ----- Buttons: Accept - Decline -----
            !isSender
                ? Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: isPending ? onDecline : null,
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(
                                color: isPending
                                    ? Appcolor.primarycolor
                                    : Appcolor.grey),
                            backgroundColor: Colors.transparent,
                            minimumSize: Size(70.w, 36.h),
                            padding: EdgeInsets.symmetric(horizontal: 0),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                          ),
                          child: Text(
                            'Decline',
                            style: TextStyle(
                              color: isPending
                                  ? Appcolor.primarycolor
                                  : Appcolor.grey,
                              fontFamily: "cairo",
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 14.w),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: isPending ? onAccept : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: isPending
                                ? Appcolor.primarycolor
                                : Appcolor.grey,
                            minimumSize: Size(70.w, 36.h),
                            elevation: 0,
                            padding: EdgeInsets.symmetric(horizontal: 0),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                          ),
                          child: Text(
                            'Accept',
                            style: TextStyle(
                              color: Appcolor.white,
                              fontFamily: "cairo",
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : Container(
                    alignment: Alignment.center,
                    width: double.maxFinite,
                    padding:
                        EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(
                        color: Appcolor.primarycolor,
                        width: 1.2,
                      ),
                    ),
                    child: Text(
                      "${groupRequestModel.requesteStatus![0].toUpperCase()}${groupRequestModel.requesteStatus!.substring(1)}",
                      style: TextStyle(
                        color: Appcolor.primarycolor,
                        fontWeight: FontWeight.bold,
                        fontSize: 15.sp,
                        fontFamily: 'cairo',
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
