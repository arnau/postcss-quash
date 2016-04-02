import chai, {expect} from "chai";

import {asNumber} from "../src/utils";


describe("utils", function () {
  describe("asNumber", function () {
    it("should return a number", function () {
      expect(asNumber("1%")).to.eq(1);
      expect(asNumber("1.1%")).to.eq(1.1);
    });
  });
});
