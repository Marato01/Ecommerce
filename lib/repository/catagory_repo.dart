import 'package:final_exam/Data/network/api_service.dart';
import 'package:final_exam/Res/app_url.dart';
import '../models/Product.dart';
import '../models/catagory.dart';

class CatagoryRepository{
  var apiService = ApiService();

  Future<CatagoryListView> getAllCatagory() async{
    try{
      dynamic response = await apiService.getApi(AppUrl.getAllCatagory);
      return catagoryListViewFromJson(response);
    }catch (exception){
      rethrow;
    }
  }

  Future<ProductList> allProduct() async{
    try{
      dynamic response = await apiService.getApi(AppUrl.allProduct);
      return productListFromJson(response);
    }catch (exception){
      rethrow;
    }
  }
}