import postcss from "postcss";
import { orderByPercentage
       , isUndefined
       , bySelector
       , byProp
       } from "./utils";

module.exports = postcss.plugin("postcss-quash", () => {
  return (root, result) => {
    root.walkAtRules("keyframes", rule => {
      rule.nodes = rule.nodes.reduce(squashRules, [])
                             .sort(orderByPercentage);
    })
  }
});

function squashRules(acc, node) {
  let rule = acc.find(bySelector(node.selector));

  if (isUndefined(rule)) {
    acc.push(node);
  } else {
    rule.nodes.push(...node.nodes);
    rule.nodes = rule.nodes;
  }

  return acc;
}
