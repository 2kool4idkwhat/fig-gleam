import gleam/int
import gleam/io
import gleam/list
import gleam/result

import argv
import glormat as fmt

import generator.{print_ipv4}

const usage = "fig - fake ip generator (gleam edition)

Usage: fig [number]

where [number] is the amount of fake IPs to generate, defaults to 1"

pub fn main() {
  argv.load().arguments
  |> check_args_amount
}

fn check_args_amount(args: List(String)) {
  case list.length(args) {
    0 -> print_ipv4(1)
    1 -> {
      list.at(args, 0)
      |> result.unwrap("")
      |> parse_arg
    }
    _ -> io.println("Error: got more than 1 argument")
  }
}

fn parse_arg(arg: String) {
  case arg {
    "-h" | "--help" | "help" -> {
      io.println(usage)
      Nil
    }
    "--" <> _ -> {
      io.println_error("Error: unknown flag " <> arg)
    }
    _ -> {
      get_amount(arg)
      |> print_ipv4
    }
  }
}

pub fn get_amount(arg: String) -> Int {
  case int.parse(arg) {
    Ok(num) -> num
    Error(_) -> {
      "Error: {arg} isn't an integer"
      |> fmt.format(replace: "arg", with: arg)
      |> fmt.assert_ok
      |> io.println_error
      0
    }
  }
}
