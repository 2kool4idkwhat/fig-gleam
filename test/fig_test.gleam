import gleeunit
import gleeunit/should

import fig

pub fn main() {
  gleeunit.main()
}

pub fn get_amount_test() {
  fig.get_amount("4")
  |> should.equal(4)

  fig.get_amount("not a number")
  |> should.equal(0)
}
