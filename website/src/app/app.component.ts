import { Component } from '@angular/core';
import { FormControl } from '@angular/forms';
import {  primesUntil, primeFactorisation } from "./native";

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  control:FormControl = new FormControl();
  isPrimeMessage:string;
  factorsMessage:string;  
  
  onClick():void {
    const value = this.control.value as number;
    if (value < 1) {
      this.isPrimeMessage = `Please enter a number greater than 1`;
      this.factorsMessage = null;
      return;
    } else if (!Number.isInteger(value)) {
      this.isPrimeMessage = `Please enter an integer!`;
      this.factorsMessage = null;
      return;
    }

    const primes = primesUntil(Math.max(2, Math.floor(Math.sqrt(value))));
    const factors = primeFactorisation(value, primes);
    if (factors.length == 0){
      this.isPrimeMessage = `Yes, the number ${value} is a prime!`;
      this.factorsMessage = null;
    } else {
      const _factors = Array.from(new Set(factors));
      this.isPrimeMessage = `No, the number ${value} is not a prime!`;
      this.factorsMessage = `It has factor(s): ${_factors.join(", ")}`;
    }
  }

  onKeyDown(event:KeyboardEvent):void {
    if (event.key == "Enter"){
      this.onClick();
    }
  }
}
