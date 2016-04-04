import fs from "fs";
import postcss from "postcss";
import chai, {expect} from "chai";
import chaiAsPromised from "chai-as-promised";

import quash from "../dist/postcss-quash.js";

chai.use(chaiAsPromised);

const processor = postcss([quash]);

describe("postcss-quash", function () {
  describe("references", function () {
     ["case-01",
      "case-02"].forEach(ref => {
       it(`should transpile ${ref}`, function (done) {
         const from = `reference/${ref}.postcss.css`;
         const to = `reference/${ref}.css`;

         const input = fs.readFileSync(from, "utf-8");
         const output = fs.readFileSync(to, "utf-8");

         expect(processor.process(input, {from, to})
                         .then(result => result.css)).to.eventually
                                                     .eq(output)
                                                     .notify(done);
       });
     });
  });
});
