import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:svg_icon/svg_icon.dart';
import 'package:yoliday_llp/constants/app_colors.dart';
import 'package:yoliday_llp/database/data.dart';

class CustomList extends StatefulWidget {
  const CustomList({super.key});

  @override
  _CustomListState createState() => _CustomListState();
}

class _CustomListState extends State<CustomList> {
  TextEditingController searchController = TextEditingController();

  List<String> filteredTitles = [];

  @override
  void initState() {
    super.initState();
    filteredTitles = List.from(title);
    searchController.addListener(_filterTitles);
  }

  // Method to filter titles based on the search query
  void _filterTitles() {
    String query = searchController.text.toLowerCase();
    setState(() {
      filteredTitles =
          title.where((t) => t.toLowerCase().contains(query)).toList();
    });
  }

  @override
  void dispose() {
    searchController.removeListener(_filterTitles);
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4),
            child: TextFormField(
              controller: searchController,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                isDense: true,
                suffixIcon: Icon(
                  Icons.search,
                  color: AppColors.orange,
                  size: 30,
                ),
                hintText: 'Search a Project',
                border: InputBorder.none,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    borderSide: BorderSide(color: AppColors.orange, width: 0.5)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    borderSide: BorderSide(color: AppColors.orange, width: .5)),
              ),
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: filteredTitles.length,
                  itemBuilder: (context, index) {
                    int originalIndex = title.indexOf(filteredTitles[index]);
                    return Card(
                      elevation: 0,
                      margin:
                          const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: const BorderSide(color: AppColors.grey),
                      ),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: SizedBox.fromSize(
                                  size: const Size.fromRadius(45),
                                  child: Image.asset(
                                    image[originalIndex],
                                    height: 60.h,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    filteredTitles[index],
                                    style: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w800),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(name[originalIndex]),
                                      Text(subName[originalIndex]),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 20.w,
                                  ),
                                  Container(
                                    height: 25.h,
                                    width: 55.w,
                                    decoration: AppColors.gradientDecoration,
                                    child: const Center(
                                      child: Text(
                                        'A',
                                        style: TextStyle(
                                            color: AppColors.white, fontSize: 12),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                ),
                Positioned(
                  bottom: 10,
                  left: 140.w,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        backgroundColor: AppColors.orange,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
                    onPressed: () {},
                    label: const Text("Filter"),
                    icon: const SvgIcon(
                      'assets/icons/filter.svg',
                      height: 10,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
