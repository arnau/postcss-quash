"use strict";
// module PostCSS

var postcss = require("postcss");

exports.calculateInterest = function (amount) {
  return amount * 0.1;
};

exports.calculateInterest2 = function (amount, months) {
  return amount * Math.exp(0.1, months);
};

// exports.plugin = function (name) {
//   return function (callback) {
//     postcss.plugin(name, callback);

//     return name;
//   };
// };


// () => {
//   return (root, result) => {
//     root.walkAtRules("keyframes", rule => {
//       rule.nodes = rule.nodes.reduce(squashRules, [])
//                              .sort(orderByPercentage);
//     })
//   }
// });


