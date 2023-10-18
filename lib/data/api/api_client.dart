import 'package:get/get.dart';

class ApiClient extends GetConnect implements GetxService{
 late String token ;
 final String baseUrl;
 late Map<String, String>_mainHeaders;
 ApiClient({required this.baseUrl}){
   baseUrl = baseUrl;
   timeout= Duration(seconds: 30);
   token="";
   _mainHeaders={
     'Content-type':'application/json;charset=UTF-8',
     'Authorization':'Bearer $token',
   };
 }
 Future<Response> getDate(String url)async{
   try{
     Response response = await get(url);
     return response;
   }catch(e)
   {
     return Response(statusText: e.toString());
   }
 }
}