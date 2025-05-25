import 'package:flutter/material.dart';
import 'package:music_services_module_assignment/models/bottom_navBar_model.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final List<NavItemModel> items;
  final Function(int) onTap;

  const CustomBottomNavBar({
    Key? key,
    required this.currentIndex,
    required this.items,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.fromLTRB(0,0,0,2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(items.length, (index) {
          final isActive = currentIndex == index;
          return GestureDetector(
            onTap: () => onTap(index),
            behavior: HitTestBehavior.opaque,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: 16,
                  height: isActive ? 8 : 0,
                  margin: const EdgeInsets.only(bottom: 2),
                  decoration: BoxDecoration(
                    color: isActive ? Colors.white : Colors.transparent,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(0),
                      bottom: Radius.circular(10),
                    ),
                  ),
                ),
                Padding(
                padding: const EdgeInsets.only(top: 7),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        items[index].icon,
                        width: 28,
                        height: 28,
                        color: isActive ? Colors.white : Colors.white.withOpacity(0.45),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  items[index].label,
                  style: TextStyle(
                    color: isActive ? Colors.white : Colors.white.withOpacity(0.45),
                    fontSize: 12,
                    fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
