import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rive_animation/models/course.dart';
import 'package:rive_animation/screens/home/components/course_car.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "Courses",
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(color: Colors.black, fontWeight: FontWeight.w600),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...courses
                        .map((e) => Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: CourseCard(course: e),
                            ))
                        .toList(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  "Recent",
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w600),
                ),
              ),
              ...recentCourses.map((e) => Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    child: SecondaryCourseCard(course: e),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class SecondaryCourseCard extends StatelessWidget {
  final Course course;

  const SecondaryCourseCard({
    super.key,
    required this.course,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      decoration: BoxDecoration(color: course.bgColor, borderRadius: const BorderRadius.all(Radius.circular(20))),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Text(
                  course.title,
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                Text(
                  course.description,
                  style: const TextStyle(
                    color: Colors.white60,
                    fontSize: 16,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 40,
            child: VerticalDivider(
              color: Colors.white70,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          SvgPicture.asset(course.iconSrc)
        ],
      ),
    );
  }
}
