import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_app/widgets/follower.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Follower> users=[
    Follower(
      name: "Xurshid",
      followers: 123,
      isLike: false,
      price: 5000
    ),
  ];
  @override
  Widget build(BuildContext context) {
        ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize:const Size(411.4, 899.4),
        context: context,
        minTextAdapt: true,
        orientation: Orientation.portrait);
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        elevation: 1,
        shadowColor: Colors.white,
        title: Text("Responsive App",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20.sp),),
        ),
        floatingActionButton: InkWell(
          onTap: (){
          users.add(Follower(
            name: "Xurshid",
            followers: 123,
            isLike: false,
            price: 5000
              ),
            );
            setState(() {});
          },
          radius: 40.r,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 42.r,
            child: CircleAvatar(
              backgroundColor: Colors.black,
              radius: 40.r,
              child: Text("add",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20.sp),),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: List.generate(
              users.length,
               (index) => Card(
                 margin: EdgeInsets.all(10.w),
                 shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(14.r)
                 ),
                 color: Colors.black,
                 elevation: 3,
                 shadowColor: Colors.white,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 23.r,
                      child:const Icon(Icons.person_outline_sharp,color: Colors.black,size: 30,),
                      ),
                    title: Text(users[index].name!,style:const  TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),),
                    subtitle:  Text(users[index].followers!.toString(),style: TextStyle(color: Colors.white,fontSize: 12.sp),),
                    trailing: SizedBox(
                      width: 126.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         InkWell(
                           onTap: (){
                              users[index].isLike= !users[index].isLike!;
                              setState(() {});
                           },
                           radius: 23.r,
                           splashColor: Colors.transparent,
                           highlightColor: Colors.transparent,
                           child: CircleAvatar(
                             backgroundColor: Colors.transparent,
                             radius: 23.r,
                             child:users[index].isLike! ?  const Icon(Icons.favorite,color: Colors.redAccent,size: 28,): const Icon(Icons.favorite_border_outlined,color: Colors.white,size: 28,),
                             ),
                         ),
                         Text(users[index].price!.toString()+" \$",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontSize: 18.sp))
                       ],
                      ),
                    ),
                  ),   
              ),
            ),
          ),
        ),

    );
  }
}