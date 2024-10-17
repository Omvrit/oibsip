package com.example.calculator.ui.theme
import java.util.Stack
import com.example.calculator.Storage.StoredValues


var i :Int =0;

class CalculatorAction {
   fun showHistory(arr:MutableList<StoredValues>): List<StoredValues> {
     return arr;
   }
   fun addToStorage(Str:String, arr: MutableList<String>){

      arr[i] =Str;
      i++;
   }
   fun clear(str:String):String {
      return "0";
   }
   fun del(Str:String):String{
      if(Str.length == 0) return "";
      return Str.substring(0,Str.length-1);
   }
   fun concatenate(Str:String,symbol:Char,dot:Int= 0):String{
      val operators = listOf('+', '-', 'x', '/', '%','.');

      if(Str=="0") return symbol.toString();
//    if(Str[Str.length-1] == 'x' || Str[Str.length-1] == '/'|| Str[Str.length-1] == '.'
//         ||Str[Str.length-1] == '+'
//         ||Str[Str.length-1] == '-'||
//         Str[Str.length-1] == '/'|| Str[Str.length-1] == '%') return Str;
      if(Str.isNotEmpty() && Str[Str.length-1] in operators && symbol in operators) return Str.substring(0,Str.length-1)+symbol;
      if(Str.isNotEmpty() && Str[Str.length-1] == '.' && symbol == '.') return Str;

      return Str+symbol;
   }









      fun eval(expression: String): String {
         if (expression.isEmpty()) return "Empty"
         if (expression[0] < '0' || expression[0] > '9' ) {
            if(expression[0] != '.'){
               return "Invalid"
            }

         }

         val operators = Stack<Char>()
         val values = Stack<Double>()

         var i = 0
         while (i < expression.length) {
            when {
               expression[i] == ' ' -> {
                  i++
                  continue
               }
               expression[i].isDigit() || (expression[i] == '.' && (i == 0 || expression[i - 1] == ' ' || expression[i - 1] == '(')) -> {
                  val sb = StringBuilder()
                  while (i < expression.length && (expression[i].isDigit() || expression[i] == '.')) {
                     sb.append(expression[i++])
                  }
                  try {
                     values.push(sb.toString().toDouble())
                  } catch (e: NumberFormatException) {
                     return "Error"
                  }
                  i--
               }
               expression[i] == '(' -> operators.push(expression[i])
               expression[i] == ')' -> {
                  while (operators.isNotEmpty() && operators.peek() != '(') {
                     if (!applyOperationSafe(operators, values)) return "Error"
                  }
                  if (operators.isEmpty() || operators.peek() != '(') return "Error"
                  operators.pop()
               }
               expression[i] in listOf('+', '-', 'x', '/', '%') -> {
                  while (operators.isNotEmpty() && hasPrecedence(expression[i], operators.peek())) {
                     if (!applyOperationSafe(operators, values)) return "Error"
                  }
                  operators.push(expression[i])
               }
               else -> return "Error"
            }
            i++
         }

         while (operators.isNotEmpty()) {
            if (!applyOperationSafe(operators, values)) return "Error"
         }

         if (values.size != 1) return "Error"

         val result = values.pop()
         return if (result == result.toLong().toDouble()) {
            result.toLong().toString()
         } else {
            result.toString()
         }
      }

      private fun applyOperation(op: Char, b: Double, a: Double): Double {
         return when (op) {
            '+' -> a + b
            '-' -> a - b
            'x' -> a * b
            '/' -> if (b != 0.0) a / b else throw UnsupportedOperationException("Cannot divide by zero")
            '%' -> a * (b / 100)
            else -> throw UnsupportedOperationException("Invalid operation")
         }
      }

      private fun applyOperationSafe(operators: Stack<Char>, values: Stack<Double>): Boolean {
         return try {
            val op = operators.pop()
            val b = values.pop()
            val a = values.pop()
            values.push(applyOperation(op, b, a))
            true
         } catch (e: Exception) {
            false
         }
      }

      private fun hasPrecedence(op1: Char, op2: Char): Boolean {
         if (op2 == '(' || op2 == ')') return false
         if ((op1 == 'x' || op1 == '/' || op1 == '%') && (op2 == '+' || op2 == '-')) return false
         return true
      }
   }












