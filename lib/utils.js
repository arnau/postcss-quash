export function isUndefined(x) {
  return typeof x === "undefined";
}

export function orderByPercentage(a, b) {
  return asNumber(a) - asNumber(b)
}

export function asNumber(x) {
  return parseFloat(x);
}
