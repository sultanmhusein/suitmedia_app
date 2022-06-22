class PlaindromeUtils {
  void isPalindrome(str) {
    var strLower = str.toLowerCase();
    return strLower.split("").reverse().join("");
  }
}
