import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatefulWidget {
  final Function(int)? onIndexChanged; // Callback for navigation

  const CustomBottomNavBar({super.key, this.onIndexChanged});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _selectedIndex = 0;

  final List<IconData> icons = [
    Icons.home,
    Icons.message,
    Icons.group,
    Icons.person_pin,
    Icons.book,
    Icons.notifications,
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double itemWidth = screenWidth / icons.length;

    // return Scaffold(
    //   backgroundColor: Colors.white,
    //   body: Center(
    //     child: Text(
    //       "Page $_selectedIndex",
    //       style: const TextStyle(fontSize: 24),
    //     ),
    //   ),
    //   bottomNavigationBar
    return SizedBox(
      height: 60,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // The actual bar with custom painted curve
          SizedBox(
            height: 60,
            width: double.infinity,
            child: CustomPaint(
              painter: NavBarPainter(
                activeIndex: _selectedIndex,
                itemWidth: itemWidth,
              ),
            ),
          ),

          // The row of icons
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SizedBox(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(icons.length, (index) {
                  bool isActive = index == _selectedIndex;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedIndex = index;
                      });
                      if (widget.onIndexChanged != null) {
                        widget.onIndexChanged!(
                          index,
                        ); // Notify parent of index change
                      }
                    },
                    child: Opacity(
                      opacity: isActive ? 0.0 : 1.0, // Hide active icon
                      child: Icon(icons[index], color: Colors.white, size: 28),
                    ),
                  );
                }),
              ),
            ),
          ),

          // The floating selected icon with animation
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOutCubic,
            top: -25,
            left: itemWidth * _selectedIndex + itemWidth / 2 - 30,
            child: Container(
              width: 60,
              height: 60,
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icons[_selectedIndex],
                  color: Colors.white,
                  size: 28,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NavBarPainter extends CustomPainter {
  final int activeIndex;
  final double itemWidth;

  NavBarPainter({required this.activeIndex, required this.itemWidth});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.green;

    final path = Path();

    double notchRadius = 35;
    double notchCenter = itemWidth * activeIndex + itemWidth / 2;

    // Start left
    path.moveTo(0, 0);

    // Draw to left of notch
    path.lineTo(notchCenter - notchRadius - 10, 0);

    // Curve up
    path.quadraticBezierTo(
      notchCenter - notchRadius,
      0,
      notchCenter - notchRadius + 10,
      20,
    );

    // Peak of the notch
    path.quadraticBezierTo(notchCenter, 45, notchCenter + notchRadius - 10, 20);

    // Curve down
    path.quadraticBezierTo(
      notchCenter + notchRadius,
      0,
      notchCenter + notchRadius + 10,
      0,
    );

    // Finish rest of the bar
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
