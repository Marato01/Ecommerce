import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Data/Response/Status.dart';
import '../viewModel/catagory_VM.dart';
import 'StackProduct.dart';

class GridProduct extends StatefulWidget {
  const GridProduct({super.key});

  @override
  State<GridProduct> createState() => _GridProductState();
}


class _GridProductState extends State<GridProduct> {
  var catagoryViewModel =  CatagoryViewModel();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    catagoryViewModel.allProduct();
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => catagoryViewModel,
      child: Consumer<CatagoryViewModel>(
        builder: (context, viewModel, _){
      switch(viewModel.response.status!) {
        case Status.LOADING:
          return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) => CircularProgressIndicator());
        case Status.COMPLETED:
          return GridView.count(
            childAspectRatio: MediaQuery.of(context).size.height * 0.0007,
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            shrinkWrap: true,
            children: [
              for (int i = 1; i < viewModel.response.data!.data.length; i++)
                StackProduct(
                    attributes: viewModel.response.data!.data![i].attributes,
                ),
            ],
          );
        case Status.ERROR:
          return Text('Error');
      }
        }
      )
    );
  }
}


