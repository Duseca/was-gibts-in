
import 'package:was_gibts_in/data/network/BaseApiServices.dart';
import 'package:was_gibts_in/data/network/NetworkApiService.dart';

class WeatherRepository {

  BaseApiServices _apiServices = NetworkApiService() ;

  Future getWeatherApiRepo(String url)async{

    try{
      dynamic response = await _apiServices.getGetApiResponse(url);
      return response;

    }catch(e){
      throw e ;
    }
  }

}