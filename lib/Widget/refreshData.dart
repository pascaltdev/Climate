String refreshData(List<String> global){
  var array = [
    "temp_main",
    "feels",
    "temp_min",
    "temp_max",
    "pressure",
    "humidity"
  ];
  String temp = "";
  String celsius = "";
  String result = "";
  int i = 0, j = 0;

  while (j < global.length && i < array.length) {
    temp = "${array[i]} ";
    celsius = "${global[j]} ";

    result += "$temp: $celsius \n";
    i++;
    j++;
  }
  
  return result;
}