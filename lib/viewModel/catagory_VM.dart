import 'package:final_exam/repository/catagory_repo.dart';
import 'package:flutter/widgets.dart';
import '../Data/Response/api_response.dart';

class CatagoryViewModel extends ChangeNotifier{
  var catagoryRepo = CatagoryRepository();
  ApiResponse<dynamic> response = ApiResponse.loading();

  setCatagoryList(response){
    this.response = response;
    notifyListeners();
  }
  setProductList(response){
    this.response = response;
    notifyListeners();
  }

  setPictureList(response){
    this.response = response;
    notifyListeners();
  }

  Future<dynamic> getAllCatagory() async {
    await catagoryRepo.getAllCatagory()
        .then((catagory) => setCatagoryList(ApiResponse.completed(catagory)))
        .onError((error, stackTrace) => setCatagoryList(ApiResponse.error(stackTrace.toString())));
  }

  Future<dynamic> allProduct() async {
    await catagoryRepo.allProduct()
        .then((product) => setProductList(ApiResponse.completed(product)))
        .onError((error, stackTrace) => setProductList(ApiResponse.error(stackTrace.toString())));
  }

}