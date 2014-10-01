/**
 * Demo class, which prints values of system properties.
 * Names of the properties are provided as program arguments.
 */
public class Demo {
  
  public static void main(String args[]) {
    for (String arg:args) {
      System.out.println(arg + " = " + System.getProperty(arg));
    }
  }
}
