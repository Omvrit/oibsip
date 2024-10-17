package com.example.calculator.ui.theme


import android.annotation.SuppressLint
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.layout.width
import androidx.compose.material3.Divider
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment.Companion.CenterVertically
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.alpha
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp

val Action = CalculatorAction();

@SuppressLint("MutableCollectionMutableState")
@Composable
fun Screen(){
   var arr by remember { mutableStateOf(
       MutableList(100) { MutableList(2) { ""} }
//       mutableStateOf(mutableListOf<String>(){ mutableListOf<>() })
   )
   }
    var index by remember {
        mutableStateOf(0)
    }
    for (i in 0..<index+1){
        print(arr[i])
    }

    var value by remember { mutableStateOf("") }
    var result by remember { mutableStateOf("") }


    Column(
        Modifier.fillMaxWidth()
    )
    {
        Spacer(modifier = Modifier.height(42.dp))
        Text(text = "History"
                ,
            modifier = Modifier.fillMaxWidth(),
            color = Color.Cyan,
            fontSize = 10.sp,
            fontWeight = FontWeight(25)
        )
        Box(
            Modifier

                .height(100.dp)
                .fillMaxWidth()){
                historyView(arr)


        }
        Spacer(modifier = Modifier.height(10.dp))
        Box(
            Modifier
                .fillMaxWidth()
                .padding(10.dp)){
            Column(Modifier.padding(start = 10.dp,end = 10.dp)) {


                Text(
                    text = value,
                    lineHeight = 30.sp,
                    modifier = Modifier
                        .fillMaxWidth()
                        .height(100.dp)
                        .padding(1.dp),
                        fontSize = 30.sp,
                    color = Color.White
                )
                Divider(color = Color.White,thickness = 2.dp)
                Text(
                    modifier = Modifier
                        .fillMaxWidth()
                        .height(50.dp)
                        .padding(start = 1.dp)
                        .alpha(0.7f),

                    text = "=$result",fontSize = 25.sp,
                    color = Color.White,
                    fontWeight = androidx.compose.ui.text.font.FontWeight.Bold

                )

            }
        }
        Spacer(modifier = Modifier.height(10.dp))

        Column(Modifier.fillMaxSize()) {

            Row(Modifier.fillMaxWidth()) {
                Spacer(modifier = Modifier.width(5.dp))
                CalculatorButton(
                    symbol = "AC",
                    modifier = Modifier
                        .size(90.dp)
                        .align(CenterVertically)
                        .background(Color(0xE5FF0000))
                        ,

                    onClick = {
                        value = Action.clear(value)
                        result = ""
                    })
                Spacer(modifier =Modifier.width(3.dp))
                CalculatorButton(
                    symbol = "Del",
                    modifier = Modifier
                        .size(90.dp)
                        .align(CenterVertically)
                        .background(Color(0xE5FF0000))
                        ,
                    onClick = {
                        value = Action.del(value)
                        result = Action.eval(value);
                    })
                Spacer(modifier = Modifier.width(5.dp))

                CalculatorButton(
                    symbol = "%",
                    modifier = Modifier
                        .size(90.dp)
                        .background(Color(0xE4FFA500))
                        ,
                    onClick = { value =Action.concatenate(value, '%')
                        result = Action.eval(value)})
                Spacer(modifier = Modifier.width(5.dp))
                CalculatorButton(
                    symbol = "/",
                    modifier = Modifier
                        .size(90.dp)
                        .background(Color(0xD9FFA500))
                        ,
                    onClick = { value= Action.concatenate(value, '/')})
                Spacer(modifier = Modifier.width(5.dp))


            }
            Spacer(modifier = Modifier.height(5.dp))
            Row(Modifier.fillMaxWidth()) {
                Spacer(modifier = Modifier.width(5.dp))
                CalculatorButton(
                    symbol = "7",
                    modifier = Modifier
                        .size(90.dp)
                        .align(CenterVertically)
                        .background(Color(0xCD413A3A)),
                    onClick = { value = Action.concatenate(value, '7')
                        result = Action.eval(value)})
                Spacer(modifier =Modifier.width(3.dp))
                CalculatorButton(
                    symbol = "8",
                    modifier = Modifier
                        .size(90.dp)
                        .background(Color(0xCC413A3A)),
                    onClick = { value =Action.concatenate(value, '8')
                        result = Action.eval(value)})
                Spacer(modifier = Modifier.width(5.dp))
                CalculatorButton(
                    symbol = "9",
                    modifier = Modifier
                        .size(90.dp)
                        .background(Color(0xCC413A3A)),
                    onClick = { value =Action.concatenate(value, '9')
                        result = Action.eval(value)})
                Spacer(modifier = Modifier.width(5.dp))
                CalculatorButton(
                    symbol = "x",
                    modifier = Modifier
                        .size(90.dp)
                        .background(Color(0xD9FFA500))
                        ,
                    onClick = { value  =Action.concatenate(value, 'x')})
                Spacer(modifier = Modifier.width(5.dp))

            }
            Spacer(modifier = Modifier.height(5.dp))
            Row(Modifier.fillMaxWidth()) {
                Spacer(modifier = Modifier.width(3.dp))
                CalculatorButton(
                    symbol = "4",
                    modifier = Modifier
                        .size(90.dp)
                        .background(Color(0xCC413A3A)),
                    onClick = { value  =Action.concatenate(value, '4')
                        result = Action.eval(value)})
                Spacer(modifier = Modifier.width(5.dp))
                CalculatorButton(
                    symbol = "5",
                    modifier = Modifier
                        .size(90.dp)
                        .background(Color(0xCC413A3A)),
                    onClick = { value  =Action.concatenate(value, '5')
                        result = Action.eval(value)})
                Spacer(modifier = Modifier.width(5.dp))
                CalculatorButton(
                    symbol = "6",
                    modifier = Modifier
                        .size(90.dp)
                        .background(Color(0xCC413A3A)),
                    onClick = { value  =Action.concatenate(value, '6')
                        result = Action.eval(value)})
                Spacer(modifier = Modifier.width(5.dp))
                CalculatorButton(
                    symbol = "-",
                    modifier = Modifier
                        .size(90.dp)
                        .background(Color(0xD9FFA500))
                        ,
                    onClick = {
                        value = Action.concatenate(value, '-');
                    })




            }
            Spacer(modifier = Modifier.height(5.dp))
            Row(Modifier.fillMaxWidth()) {
                Spacer(modifier = Modifier.width(3.dp))

                CalculatorButton(
                    symbol = "1",
                    modifier = Modifier
                        .size(90.dp)
                        .background(Color(0xCC413A3A)),
                    onClick = { value =Action.concatenate(value, '1')
                        result = Action.eval(value)})
                Spacer(modifier = Modifier.width(5.dp))
                CalculatorButton(
                    symbol = "2",
                    modifier = Modifier
                        .size(90.dp)
                        .background(Color(0xCC413A3A)),
                    onClick = { value  =Action.concatenate(value, '2')
                        result = Action.eval(value)})
                Spacer(modifier = Modifier.width(5.dp))
                CalculatorButton(
                    symbol = "3",
                    modifier = Modifier
                        .size(90.dp)
                        .background(Color(0xCC413A3A)),
                    onClick = { value  =Action.concatenate(value, '3')
                        result = Action.eval(value)})
                Spacer(modifier = Modifier.width(5.dp))

                CalculatorButton(
                    symbol = "+",
                    modifier = Modifier
                        .size(90.dp)
                        .background(Color(0xD9FFA500))
                        ,
                    onClick = {
                        value = Action.concatenate(value, '+');
                    })
                Spacer(modifier = Modifier.width(5.dp))

            }
            Spacer(modifier = Modifier.height(5.dp))
            Row(Modifier.fillMaxWidth()) {
                Spacer(modifier = Modifier.width(3.dp))
                CalculatorButton(
                    symbol ="00",
                    modifier = Modifier
                        .size(90.dp)
                        .background(Color(0xFF413A3A)),
                    onClick = {value =Action.concatenate(value, '0')
                        result = Action.eval(value)})
                Spacer(modifier = Modifier.width(5.dp))
                
                CalculatorButton(
                    symbol = "0",
                    modifier = Modifier
                        .size(90.dp)
                        .background(Color(0xCC413A3A)),
                    onClick = { value =Action.concatenate(value, '0')
                        result = Action.eval(value)})
                Spacer(modifier = Modifier.width(5.dp))
                CalculatorButton(
                    symbol = ".",

                    modifier = Modifier
                        .size(90.dp)
                        .background(Color(0xD9FFA500)),
                    onClick = { value  =Action.concatenate(value, '.')
                        result = Action.eval(value)})
                Spacer(modifier = Modifier.width(5.dp))
                CalculatorButton(
                    symbol ="=",
                    modifier = Modifier
                        .size(90.dp)
                        .background(Color(0xD519F600))
                        ,
                    onClick = {
                    result = Action.eval(value)
                        arr[index][0] = value;
                        value= ""

                        arr[index][1] = "="+result;
                        index++;})





            }

        }


    }
}
fun eval(expression: String): String {
    val sanitizedExpression = expression.replace(" ", "")
    val numbers = mutableListOf<Double>()
    val operations = mutableListOf<Char>()
    var numberBuffer = ""

    // Parse the expression into numbers and operations
    for (char in sanitizedExpression) {
        if (char.isDigit() || char == '.') {
            numberBuffer += char
        } else if (char in "+-*/") {
            numbers.add(numberBuffer.toDouble())
            numberBuffer = ""
            operations.add(char)
        }
    }
    numbers.add(numberBuffer.toDouble())

    // Evaluate multiplication and division first
    var index = 0
    while (index < operations.size) {
        if (operations[index] == '*' || operations[index] == '/') {
            val left = numbers[index]
            val right = numbers[index + 1]
            val result = if (operations[index] == '*') left * right else left / right
            numbers[index] = result
            numbers.removeAt(index + 1)
            operations.removeAt(index)
        } else {
            index++
        }
    }

    // Evaluate addition and subtraction
    var result = numbers[0]
    for (i in operations.indices) {
        val right = numbers[i + 1]
        result = if (operations[i] == '+') result + right else result - right
    }

    return result.toString()
}













@Preview(showBackground = true, showSystemUi = true)
@Composable
fun MainScreenPreview(){
    Screen()
}