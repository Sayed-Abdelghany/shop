
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
class ProductScreen extends StatefulWidget {
  static String id = 'ProductScreen';
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  GlobalKey<FormState>formKey = GlobalKey<FormState>();
  String ?name;
  String ?price;
  String ?desc;
  String ?size;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 1.sh,
        width: 1.sw,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/k6.jpg'),
              fit: BoxFit.cover,
            )
        ),
        child: ListView(
          children: [
            Padding(
              padding:  EdgeInsets.all(10.h),
              child:
              Form(
                key: formKey,
                child: Column(
                  children: [
                    // Container(
                    //   height: 180.h,
                    //   width: 1.sw,
                    //   decoration: BoxDecoration(
                    //     border: Border.all(color: Colors.purple,width: 2.h),
                    //   ),
                    //   child: Center(
                    //     child: Icon(Icons.add_a_photo_outlined,size: 50.h,color: Colors.purple,),
                    //   ),
                    // ),
                    //     customLinkForm('Product link', (v){
                    //       setState(() {
                    //         link=v;
                    //       });
                    // }),

                    // CustomField(name: 'Product Name',hint: '      Enter product name',),
                    // CustomField(name: 'Product Price',hint: '      Enter product price',),
                    // CustomField(name: 'Product Description',hint: '      Enter product description',),
                    // CustomField(name: 'Product Size',hint: '      Enter product size',),
                    // customAddForm('Product link', (v){
                    //   setState(() {
                    //     link = v;
                    //   });
                    // }),
                    InkWell(
                      onTap: (){},
                      child: Container(
                        height: 180.h,
                        width: 1.sw,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.purple,width: 2.h),
                        ),
                        child: Center(
                          child: Icon(Icons.add_a_photo_outlined,size: 50.h,color: Colors.purple,),
                        ),
                      ),
                    ),

                    customAddForm('Product Name', (v){
                      setState(() {
                        name = v;
                      });
                    }),
                    customAddForm('Product Price', (v){
                      setState(() {
                        price = v;
                      });
                    }),
                    customAddForm('Product Description', (v){
                      setState(() {
                        desc = v;
                      });
                    }),
                    customAddForm('Product Size', (v){
                      setState(() {
                        size = v;
                      });
                    }),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 30.h,vertical: 10.w),
                      child: InkWell(
                        onTap: ()async{
                          formKey.currentState!.save();
                          await FirebaseFirestore.instance.collection('Products').add(
                              {
                                'name':name,
                                'price':price,
                                'Description':desc,
                                'size':size,
                              }
                          );
                        },
                        child: Container(
                          height: 40.h,
                          width: 200.w,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            border: Border.all(width: 1,color: Colors.white),
                            borderRadius: BorderRadius.circular(20.h),
                          ),
                          child: Center(child: Text('Add Product',style: TextStyle(fontSize: 20.sp,color: Colors.white),)),

                        ),
                      ),
                    ),
                  ],
                ),
              ),

            ),
          ],
        ),
      ),
    ) ;
  }
  customAddForm(label,onSaved){
    return Padding(
      padding:  EdgeInsets.all(15.h),
      child: TextFormField(
        decoration: InputDecoration(labelText: label,
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.h)),
          ),
        ),
        onSaved: onSaved,
      ),
    );
  }
// customLinkForm(label,onSaved){
//   return Container(
//     height: 180.h,
//     width: 1.sw,
//     decoration: BoxDecoration(
//       border: Border.all(color: Colors.purple,width: 2.h),
//     ),
//     child: Center(
//       child:  TextFormField(
//         decoration: InputDecoration(labelText: label,
//           fillColor: Colors.white,
//           filled: true,
//           icon: Center(child: Icon(Icons.add_a_photo_outlined,size: 50.h,color: Colors.purple,)),
//         ),
//         onSaved: onSaved,
//       ),
//     ),
//   );
// }
}
