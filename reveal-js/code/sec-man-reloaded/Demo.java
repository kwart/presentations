public class Demo {
  
  public static void main(String args[]) {
    for (String arg:args) {
      System.out.println(arg + " = " + System.getProperty(arg));
    }
  }
}
