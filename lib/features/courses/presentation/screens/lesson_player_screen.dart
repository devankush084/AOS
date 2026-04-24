import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class MyBooksScreen extends StatefulWidget {
  const MyBooksScreen({super.key});

  @override
  State<MyBooksScreen> createState() => _MyBooksScreenState();
}

class _MyBooksScreenState extends State<MyBooksScreen> {
  int selectedFilter = 0; // 0: All, 1: Completed, 2: In Progress
  final TextEditingController searchController = TextEditingController();

  final List<Map<String, dynamic>> allCourses = [
    {
      "title": "Mathematics",
      "chapters": "12 Chapters",
      "progress": 0.7,
      "status": "Completed",
      "progressText": "70% Completed",
      "image": "https://m.media-amazon.com/images/I/713xZjfcDIL._AC_UY218_.jpg",
      "color": 0xFFF3E5F5,
      "iconColor": 0xFF9C27B0,
    },
    {
      "title": "Science",
      "chapters": "10 Chapters",
      "progress": 1.0,
      "status": "Completed",
      "progressText": "Completed",
      "image": "https://cdn-icons-png.flaticon.com/512/2721/2721291.png",
      "color": 0xFFE8F5E9,
      "iconColor": 0xFF4CAF50,
    },
    {
      "title": "Social Studies",
      "chapters": "14 Chapters",
      "progress": 0.0,
      "status": "Not Started",
      "progressText": "Not Started",
      "image": "https://cdn-icons-png.flaticon.com/512/2991/2991148.png",
      "color": 0xFFFFF3E0,
      "iconColor": 0xFFFF9800,
    },
    {
      "title": "English",
      "chapters": "8 Chapters",
      "progress": 0.2,
      "status": "In Progress",
      "progressText": "20% Completed",
      "image": "https://cdn-icons-png.flaticon.com/512/1048/1048953.png",
      "color": 0xFFE3F2FD,
      "iconColor": 0xFF2196F3,
    },
    {
      "title": "Computer Science",
      "chapters": "9 Chapters",
      "progress": 0.0,
      "status": "Locked",
      "progressText": "Locked",
      "image": "https://cdn-icons-png.flaticon.com/512/2721/2721274.png",
      "color": 0xFFFCE4EC,
      "iconColor": 0xFFE91E63,
      "isLocked": true,
    },
    {
      "title": "Art & Design",
      "chapters": "5 Chapters",
      "progress": 0.3,
      "status": "In Progress",
      "progressText": "30% Completed",
      "image": "https://cdn-icons-png.flaticon.com/512/1829/1829586.png",
      "color": 0xFFE0F7FA,
      "iconColor": 0xFF00BCD4,
    },
  ];

  List<Map<String, dynamic>> get filteredCourses {
    List<Map<String, dynamic>> filtered = allCourses;

    if (selectedFilter == 1) {
      filtered = filtered.where((c) => c["status"] == "Completed").toList();
    } else if (selectedFilter == 2) {
      filtered = filtered.where((c) => c["status"] == "In Progress").toList();
    }

    final query = searchController.text.toLowerCase();
    if (query.isNotEmpty) {
      filtered = filtered.where((c) =>
          c["title"].toLowerCase().contains(query)
      ).toList();
    }

    return filtered;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(
        child: Column(
          children: [
            // Header with gradient
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF7C3AED), Color(0xFFA78BFA)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(24.r),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(8.w),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          size: 18.sp,
                          color: Colors.white,
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            "My Books",
                            style: GoogleFonts.poppins(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Class 10",
                            style: GoogleFonts.inter(
                              fontSize: 14.sp,
                              color: Colors.white.withOpacity(0.8),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "CBSE Board",
                            style: GoogleFonts.inter(
                              fontSize: 12.sp,
                              color: Colors.white.withOpacity(0.6),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "Total Subjects",
                                  style: GoogleFonts.inter(
                                    fontSize: 10.sp,
                                    color: Colors.white.withOpacity(0.7),
                                  ),
                                ),
                                Text(
                                  "6",
                                  style: GoogleFonts.poppins(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 16.w),
                            Container(
                              height: 30.h,
                              width: 1,
                              color: Colors.white.withOpacity(0.2),
                            ),
                            SizedBox(width: 16.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "Progress",
                                  style: GoogleFonts.inter(
                                    fontSize: 10.sp,
                                    color: Colors.white.withOpacity(0.7),
                                  ),
                                ),
                                Text(
                                  "40%",
                                  style: GoogleFonts.poppins(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),

            // Search Bar
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Container(
                height: 48.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.04),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: TextField(
                  controller: searchController,
                  onChanged: (value) => setState(() {}),
                  decoration: InputDecoration(
                    hintText: "Search subjects...",
                    hintStyle: GoogleFonts.inter(
                      fontSize: 14.sp,
                      color: Colors.grey.shade400,
                    ),
                    prefixIcon: Icon(
                      Icons.search_rounded,
                      size: 20.sp,
                      color: Colors.grey.shade400,
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 12.h),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.h),

            // Filters
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                children: [
                  _filterChip("All", 0),
                  SizedBox(width: 12.w),
                  _filterChip("Completed", 1),
                  SizedBox(width: 12.w),
                  _filterChip("In Progress", 2),
                ],
              ),
            ),
            SizedBox(height: 16.h),

            // Stats Summary Row
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.book_outlined, size: 14.sp, color: Colors.deepPurple),
                        SizedBox(width: 4.w),
                        Text(
                          "${filteredCourses.length} subjects",
                          style: GoogleFonts.inter(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.deepPurple,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  if (searchController.text.isNotEmpty)
                    GestureDetector(
                      onTap: () {
                        searchController.clear();
                        setState(() {});
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.close_rounded, size: 14.sp, color: Colors.grey.shade600),
                            SizedBox(width: 4.w),
                            Text(
                              "Clear search",
                              style: GoogleFonts.inter(
                                fontSize: 12.sp,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
            SizedBox(height: 12.h),

            // Grid - Fixed overflow issue
            Expanded(
              child: filteredCourses.isEmpty
                  ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.search_off_rounded,
                      size: 64.sp,
                      color: Colors.grey.shade300,
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      "No subjects found",
                      style: GoogleFonts.inter(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade500,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      "Try a different search term",
                      style: GoogleFonts.inter(
                        fontSize: 13.sp,
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ],
                ),
              )
                  : Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: GridView.builder(
                  padding: EdgeInsets.only(bottom: 20.h),
                  itemCount: filteredCourses.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 14.w,
                    mainAxisSpacing: 14.h,
                    // Increased aspect ratio to prevent overflow
                    childAspectRatio: 0.68,
                  ),
                  itemBuilder: (context, index) {
                    final course = filteredCourses[index];
                    final isLocked = course["isLocked"] == true;

                    return TweenAnimationBuilder(
                      duration: Duration(milliseconds: 300 + (index * 50)),
                      tween: Tween<double>(begin: 0, end: 1),
                      builder: (context, double value, child) {
                        return Opacity(
                          opacity: value,
                          child: Transform.translate(
                            offset: Offset(0, 20 * (1 - value)),
                            child: child,
                          ),
                        );
                      },
                      child: _buildCourseCard(course, isLocked),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCourseCard(Map<String, dynamic> course, bool isLocked) {
    // Only show completed badge if progress is exactly 1.0 (100%)
    final bool isFullyCompleted = !isLocked && course["progress"] == 1.0;
    final bool isNotStarted = !isLocked && course["progress"] == 0.0;
    final bool isInProgress = !isLocked && course["progress"] > 0 && course["progress"] < 1;

    // Book cover images for each subject
    final Map<String, String> bookCovers = {
      "Mathematics": "https://images.pexels.com/photos/256417/pexels-photo-256417.jpeg?auto=compress&cs=tinysrgb&w=400",
      "Science": "https://images.pexels.com/photos/2280571/pexels-photo-2280571.jpeg?auto=compress&cs=tinysrgb&w=400",
      "Social Studies": "https://images.pexels.com/photos/290595/pexels-photo-290595.jpeg?auto=compress&cs=tinysrgb&w=400",
      "English": "https://images.pexels.com/photos/261763/pexels-photo-261763.jpeg?auto=compress&cs=tinysrgb&w=400",
      "Computer Science": "https://images.pexels.com/photos/577585/pexels-photo-577585.jpeg?auto=compress&cs=tinysrgb&w=400",
      "Art & Design": "https://images.pexels.com/photos/157924/pexels-photo-157924.jpeg?auto=compress&cs=tinysrgb&w=400",
    };

    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Book Cover Image Section
              Container(
                height: 140.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(16.r),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(
                      bookCovers[course["title"]] ??
                          "https://images.pexels.com/photos/159866/books-book-pages-read-literature-159866.jpeg?auto=compress&cs=tinysrgb&w=400",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: [
                    // Gradient overlay for better text readability
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(16.r),
                        ),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.3),
                          ],
                        ),
                      ),
                    ),
                    if (isLocked)
                      Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.6),
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(16.r),
                          ),
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.lock_outline_rounded,
                                size: 32.sp,
                                color: Colors.white,
                              ),
                              SizedBox(height: 4.h),
                              Text(
                                "Locked",
                                style: GoogleFonts.inter(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    // Book type badge
                    Positioned(
                      bottom: 8.h,
                      left: 8.w,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Text(
                          isFullyCompleted ? "Hardcover" : "Softcover",
                          style: GoogleFonts.inter(
                            fontSize: 9.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Content section
              Padding(
                padding: EdgeInsets.all(12.w),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      course["title"],
                      style: GoogleFonts.poppins(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                        height: 1.2,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      course["chapters"],
                      style: GoogleFonts.inter(
                        fontSize: 10.sp,
                        color: Colors.grey.shade500,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 8.h),

                    // Show different content based on progress
                    if (isFullyCompleted)
                    // Show completed badge only for 100% complete courses
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 3.h),
                        decoration: BoxDecoration(
                          color: Colors.green.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.check_circle_rounded,
                                size: 10.sp, color: Colors.green),
                            SizedBox(width: 3.w),
                            Text(
                              "Completed",
                              style: GoogleFonts.inter(
                                fontSize: 9.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.green,
                              ),
                            ),
                          ],
                        ),
                      ),

                    if (isInProgress)
                    // Show progress bar for in-progress courses
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(6.r),
                            child: LinearProgressIndicator(
                              value: course["progress"],
                              minHeight: 4.h,
                              backgroundColor: Colors.grey.shade100,
                              color: Color(course["iconColor"]),
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            "${(course["progress"] * 100).toInt()}% Completed",
                            style: GoogleFonts.inter(
                              fontSize: 9.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(course["iconColor"]),
                            ),
                          ),
                        ],
                      ),

                    if (isNotStarted && !isLocked)
                    // Show not started badge
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 3.h),
                        decoration: BoxDecoration(
                          color: Colors.orange.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Text(
                          "Not Started",
                          style: GoogleFonts.inter(
                            fontSize: 9.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.orange,
                          ),
                        ),
                      ),

                    SizedBox(height: 12.h),

                    // Button text changes based on completion status
                    SizedBox(
                      width: double.infinity,
                      height: 34.h,
                      child: ElevatedButton(
                        onPressed: isLocked ? null : () {
                          _showStartDialog(course["title"]);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isLocked
                              ? Colors.grey.shade200
                              : (isFullyCompleted ? Colors.green : Color(course["iconColor"])),
                          foregroundColor: Colors.white,
                          disabledBackgroundColor: Colors.grey.shade200,
                          disabledForegroundColor: Colors.grey.shade500,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          elevation: 0,
                          padding: EdgeInsets.zero,
                        ),
                        child: Text(
                          isLocked
                              ? "Locked"
                              : (isFullyCompleted ? "View Course" : "Start Learning"),
                          style: GoogleFonts.inter(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
  Widget _filterChip(String label, int filterIndex) {
    final isSelected = selectedFilter == filterIndex;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedFilter = filterIndex;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(
          gradient: isSelected
              ? const LinearGradient(
            colors: [Color(0xFF7C3AED), Color(0xFFA78BFA)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )
              : null,
          color: isSelected ? null : Colors.white,
          borderRadius: BorderRadius.circular(30.r),
          border: Border.all(
            color: isSelected ? Colors.transparent : Colors.grey.shade200,
            width: 1.5,
          ),
          boxShadow: isSelected
              ? [
            BoxShadow(
              color: Colors.deepPurple.withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ]
              : [],
        ),
        child: Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 12.sp,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
            color: isSelected ? Colors.white : Colors.grey.shade700,
          ),
        ),
      ),
    );
  }

  void _showStartDialog(String subjectName) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.r)),
        child: Container(
          padding: EdgeInsets.all(24.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24.r),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  color: Colors.deepPurple.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.school_rounded,
                  size: 36.sp,
                  color: Colors.deepPurple,
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                "Start Learning",
                style: GoogleFonts.poppins(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                "You're about to start $subjectName",
                style: GoogleFonts.inter(
                  fontSize: 13.sp,
                  color: Colors.grey.shade600,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14.r),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                      ),
                      child: Text(
                        "Cancel",
                        style: GoogleFonts.inter(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14.r),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                      ),
                      child: Text(
                        "Continue",
                        style: GoogleFonts.inter(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}