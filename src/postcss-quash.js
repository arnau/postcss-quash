import postcss from "postcss";
import {orderByPercentage, isUndefined} from "utils";

export default postcss.plugin("postcss-quash", () => {
  return (root, result) => {
    root.walkAtRules("keyframes", rule => {
      rule.nodes = rule.nodes.reduce(quash, [])
                             .sort(orderByPercentage);
    })
  }
});

function quash(acc, node) {
  let rule = acc.find(x => node.selector === x.selector);

  if (isUndefined(rule)) {
    acc.push(node);
  } else {
    rule.nodes.push(...node.nodes);
  }

  return acc;
}
