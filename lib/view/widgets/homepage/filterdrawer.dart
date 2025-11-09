import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ourcommunity/data/dataScore/static/auth/citys_data.dart';
import 'package:ourcommunity/data/dataScore/static/auth/neighborhoodData.dart';
import 'package:ourcommunity/data/dataScore/static/home/filter_data.dart';
import 'package:ourcommunity/view/widgets/auth/dropdownButton.dart';
import '../../../controller/home/home_page_controller.dart';
import '../../../core/constant/color.dart';

class FilterDrawer extends StatelessWidget {
  const FilterDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          color: Appcolor.backgroundColor,
          boxShadow: [
            BoxShadow(
              color: Appcolor.shadowColor.withOpacity(0.05),
              blurRadius: 16,
              offset: const Offset(-8, 0),
            ),
          ],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(32),
            bottomLeft: Radius.circular(0),
          ),
        ),
        child: GetBuilder<HomeControllerImp>(
          builder: (controller) => Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 36.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                  ),
                  color: Appcolor.primarycolor.withOpacity(0.05),
                ),
                child: Center(
                  child: Text(
                    "Additional Filter",
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w800,
                      color: Appcolor.primarycolor,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(22),
                  children: [
                    // ✅ Price
                    CustomChoiceChipFilter(
                      title: "Price",
                      options: priceOptions,
                      selectedValue: controller.price,
                      onChanged: (value) => controller.selectPrice(value),
                    ),
                    CustomChoiceChipFilter(
                      title: "Event State",
                      options: eventState,
                      selectedValue: controller.eventState,
                      onChanged: (value) => controller.selecetEventState(value),
                    ),

                    // ✅ Age Group
                    _FilterSectionTitle(title: "Age Group"),
                    const SizedBox(height: 10),

                    CustomDropdownButton(
                      height: 46,
                      dataList: ageOptions,
                      onChanged: (value) => controller.selectAgeGroup(value),
                      hintText: controller.ageGroup == 'All'
                          ? "Select Age Group"
                          : controller.ageGroup,
                    ),

                    const SizedBox(height: 15),

                    //  Gender
                    _FilterSectionTitle(title: "Gender"),
                    const SizedBox(height: 10),

                    CustomDropdownButton(
                      height: 46,
                      dataList: genderOptions,
                      onChanged: (value) => controller.selectGender(value),
                      hintText: controller.gender == 'All'
                          ? "Select Gender"
                          : controller.ageGroup,
                    ),
                    const SizedBox(height: 15),

                    // category
                    _FilterSectionTitle(title: "Category"),
                    const SizedBox(height: 10),
                    CustomDropdownButton(
                      height: 46,
                      dataList: controller.categoryList
                          .map((e) => e['category_name'].toString())
                          .toList(),
                      hintText: controller.categoryName == "All"
                          ? "Select Category"
                          : controller.categoryName,
                      onChanged: (selectedName) {
                        final selected = controller.categoryList.firstWhere(
                          (e) => e['category_name'] == selectedName,
                        );
                        if (selected != null) {
                          controller.selectCategory(
                              selected['id'], selectedName);
                        }
                      },
                    ),
                    const SizedBox(height: 15),

                    // team
                    _FilterSectionTitle(title: "Team"),
                    const SizedBox(height: 10),
                    CustomDropdownButton(
                      height: 46,
                      dataList: controller.teamDataList
                          .map((e) => e['team_name'].toString())
                          .toList(),
                      hintText: "Select Team",
                      onChanged: (selectedName) {
                        final selected = controller.teamDataList.firstWhere(
                          (e) => e['team_name'] == selectedName,
                        );
                        if (selected != null) {
                          controller.selectTeam(selected['id']);
                        }
                      },
                    ),
                    const SizedBox(height: 15),
                    _FilterSectionTitle(title: "City"),
                    CustomDropdownButton(
                      height: 46,
                      dataList: cities,
                      hintText: controller.city!,
                      onChanged: (value) {
                        controller.selectCity(value);
                      },
                      onTap: () => controller.showGovernorate(),
                    ),
                    if (controller.shwoGovernorate == true)
                      Column(
                        children: [
                          _FilterSectionTitle(title: "Governorate"),
                          const SizedBox(height: 10),
                          CustomDropdownButton(
                            height: 46,
                            dataList: neighborhoods[controller.city] ?? [],
                            hintText: controller.governorate,
                            onChanged: (value) {
                              controller.selectGovernorate(value);
                            },
                          ),
                        ],
                      ),

                    const SizedBox(height: 30),

                    // ✅ Reset Button
                    CustomButton(
                      onTap: () {
                        controller.setEventsType();
                        Get.back();
                      },
                      title: "Apply",
                      icon: Iconsax.tick_square,
                    ),
                    const SizedBox(height: 10),

                    CustomButton(
                      onTap: () => controller.resetFilters(),
                      title: "Rest",
                      icon: Iconsax.refresh,
                    ),

                    const SizedBox(height: 70),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    required this.onTap,
    required this.icon,
  });
  final String title;
  final Function() onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 46,
      child: MaterialButton(
        color: Appcolor.primarycolor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        onPressed: () => onTap(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Icon(icon, color: Appcolor.white, size: 20.sp),
            SizedBox(width: 10),
            Text(
              title,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                fontFamily: "cairo",
                letterSpacing: 1,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ✅ Custom Price Filter Widget
class CustomChoiceChipFilter extends StatelessWidget {
  final String title;
  final List<String> options;
  final String? selectedValue;
  final Function(String) onChanged;

  const CustomChoiceChipFilter({
    super.key,
    required this.title,
    required this.options,
    required this.selectedValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _FilterSectionTitle(title: title),
        const SizedBox(height: 8),
        Container(
          height: 60,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
          decoration: BoxDecoration(
            color: Appcolor.backgroundColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Appcolor.grey, width: 0.5),
          ),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(options.length, (index) {
              bool selected = selectedValue == options[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: ChoiceChip(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                  backgroundColor: Appcolor.backgroundColor,
                  label: Text(
                    options[index],
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: selected
                          ? Appcolor.primarycolor
                          : Appcolor.secondTextcolor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  selected: false,
                  onSelected: (value) {
                    onChanged(options[index]);
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide(
                      color: selected ? Appcolor.primarycolor : Appcolor.grey,
                      width: 0.5,
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}

// ✅ Filter Section Title Widget
class _FilterSectionTitle extends StatelessWidget {
  final String title;
  const _FilterSectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2, left: 2, top: 12),
      child: Row(
        children: [
          Container(
            width: 5,
            height: 20,
            margin: const EdgeInsets.only(right: 2),
            decoration: BoxDecoration(
              color: Appcolor.primarycolor,
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            title,
            style: TextStyle(
              fontSize: 17.sp,
              fontWeight: FontWeight.w600,
              color: Appcolor.secondTextcolor,
              fontFamily: "cairo",
            ),
          ),
        ],
      ),
    );
  }
}
