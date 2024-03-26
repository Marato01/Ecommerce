import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CatagorySkeleton extends StatelessWidget {
  const CatagorySkeleton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: Container(
        width: 110,
        height: 90,
        child: Column(
          children: [
            InkWell(
              onTap: (){
                print('Catagory');
              },
              child: Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(45),
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(45),
                    child: Image.asset('assets/images/handbag.webp', fit: BoxFit.cover,)),
              ),
            ),
            Text('Catagory', style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}