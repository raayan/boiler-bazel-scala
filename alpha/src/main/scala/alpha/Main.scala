package alpha

import beta.Worker
import org.joda.time.DateTime

object Main extends App {
  println("Here we are in the program. Brought to us by ~bazel~")

  val worker = new Worker

  println(DateTime.now())

  worker.swing()
}
