function getRange(n:number):number[]{
  var range:number [] = [];
  for (let i = 2; i < n + 1; i++) {
    range.push(i);
  }
  return range;
}

export function primesUntil(n:number):number[] {
  var primes = getRange(n);
  for (var i = 0; i < primes.length; i++){
    if (primes[i]){
      var maybePrime = primes.filter((j) => {
        if (!j) return false;
        return j % primes[i] == 0;
      });
      maybePrime.splice(0, 1);
      maybePrime.forEach((number) => {
        if (number){
          primes[number - 2] = null;
        }
      });
    }
  }
  return primes.filter((value) => value);
}

export function primeFactorisation(n:number, checkingUntil:number[]):number[] {
  var primeFactors:number[] = [];
  const copy = n;
  checkingUntil.forEach((i) => {
    while (n % i == 0) {
      primeFactors.push(i);
      n = n / i;
    }
  });
  if (n != 1 && n != copy){
    primeFactors.push(n);
  }
  return primeFactors;
}
