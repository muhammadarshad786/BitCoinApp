class ApiUtils
{
  static const  url ='';
  static const accepts='application/json';
  static const apikey='CG-uXyU5j8RmRF5hKJwnswDZe9z';
  


   static Uri getUri() {
    return Uri.parse(url);
  }


    static Map<String, String> getHeaders() {
    return {
      'accept': accepts,
      'api': apikey,
    };
  }
}