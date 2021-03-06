export function isUndefined(x) {
  return typeof x === "undefined";
}

export function orderByPercentage(a, b) {
  return asNumber(a) - asNumber(b)
}

export function asNumber(x) {
  return parseFloat(x);
}

export function bySelector(contrast) {
  return ({selector}) => contrast === selector;
}

export function byProp(contrast) {
  return ({prop}) => contrast === prop;
}
