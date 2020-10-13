class Toolbox {

  // Set the string as capitalize
  static String toCapitalize(String str) {

    if(str.length <= 1) {
      return str.substring(0,1).toUpperCase();
    }

    return str.substring(0,1).toUpperCase() + str.substring(1,str.length-1);
  }

}