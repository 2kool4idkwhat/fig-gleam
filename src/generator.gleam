import gleam/int
import gleam/io

import glormat as fmt

/// Generates and prints fake IPv4 addresses
/// given amount of times
pub fn print_ipv4(counter: Int) {
  case counter < 1 {
    True -> Nil
    False -> {
      io.println(random_ipv4())
      print_ipv4(counter - 1)
    }
  }
}

/// Returns a random fake IPv4 address
pub fn random_ipv4() -> String {
  "{p1}.{p2}.{p3}.{p4}"
  |> fmt.replace("p1", with: ipv4_part())
  |> fmt.then("p2", with: ipv4_part())
  |> fmt.then("p3", with: ipv4_part())
  |> fmt.then("p4", with: ipv4_part())
  |> fmt.assert_ok
}

fn ipv4_part() -> String {
  int.random(256)
  |> int.to_string
}
