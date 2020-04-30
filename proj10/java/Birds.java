/* Birds.java illustrates inheritance and polymorphism.
 *
 * Begun by: Joel Adams, for CS 214 Lab 10 at Calvin College.
 * Completed by: David Reidsma
 * Date: 04/30/2020
 *********************************************************/

public class Birds {
  
  public static void main(String[] args) {
      System.out.println("\nWelcome to the Bird Park!\n");

      Duck duck = new Duck("Donald");
      duck.print();

      Goose goose = new Goose("Mother");
      goose.print();

      Owl owl = new Owl("Woodsey");
      owl.print();

      Penguin penguin = new Penguin("Gunther");
      penguin.print();

      Ostrich ostrich = new Ostrich("Jeffrey");
      ostrich.print();

      Kiwi kiwi = new Kiwi("Ronald");
      kiwi.print();
      
      System.out.println();
    }
}

