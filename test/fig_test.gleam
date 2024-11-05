import gleeunit
import gleeunit/should

import fig

pub fn main() {
  gleeunit.main()
}

pub fn get_amount_test() {
  fig.get_amount("4")
  |> should.equal(4)

  fig.get_amount("(not a number, this should print that there was an error)")
  |> should.equal(0)
}
