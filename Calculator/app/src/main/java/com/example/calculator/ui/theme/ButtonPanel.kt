package com.example.calculator.ui.theme

import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.layout.width
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp

var valu = "0"
@Composable
fun ButtonPanel(modifier: Modifier = Modifier.size(300.dp),value:String) {

    var value by remember { mutableStateOf("") }
    Column(Modifier.fillMaxSize()) {


        Row(Modifier.fillMaxWidth()) {

            CalculatorButton(
                symbol = "1",
                modifier = Modifier.size(100.dp),
                onClick = { value += "1" })
            CalculatorButton(
                symbol = "2",
                modifier = Modifier.size(100.dp),
                onClick = { value += "2" })
            CalculatorButton(
                symbol = "3",
                modifier = Modifier.size(100.dp),
                onClick = { value += "3" })

            CalculatorButton(
                symbol = "AC",
                modifier = Modifier.size(150.dp),
                onClick = {
                    value = "";
                })

        }
        Row(Modifier.fillMaxWidth()) {

            CalculatorButton(
                symbol = "4",
                modifier = Modifier.size(100.dp),
                onClick = { value += "4" })
            CalculatorButton(
                symbol = "5",
                modifier = Modifier.size(100.dp),
                onClick = { value += "5" })
            CalculatorButton(
                symbol = "6",
                modifier = Modifier.size(100.dp),
                onClick = { value += "6" })

            CalculatorButton(
                symbol = "Del",
                modifier = Modifier.size(150.dp),
                onClick = {
                    value = value.substring(0, value.length - 1);
                })

        }
        Row(Modifier.fillMaxWidth()) {

            CalculatorButton(
                symbol = "7",
                modifier = Modifier.size(100.dp),
                onClick = { value += "1" })
            CalculatorButton(
                symbol = "8",
                modifier = Modifier.size(100.dp),
                onClick = { value += "2" })
            CalculatorButton(
                symbol = "9",
                modifier = Modifier.size(100.dp),
                onClick = { value += "3" })

            CalculatorButton(
                symbol = "+",
                modifier = Modifier.size(150.dp),
                onClick = {
                    value = value+"+";
                })

        }
        Row(Modifier.fillMaxWidth()) {

            CalculatorButton(
                symbol = ".",

                modifier = Modifier.size(100.dp),
                onClick = { value += "." })
            CalculatorButton(
                symbol = "0",
                modifier = Modifier.size(100.dp),
                onClick = { value += "0" })
            CalculatorButton(
                symbol ="=",
                modifier = Modifier.size(100.dp),
                onClick = { value += "-" },
               )
            CalculatorButton(
                symbol = "-",
                modifier = Modifier.size(150.dp),
                onClick = {
                    value = value+"-";
                })

        }

    }
     valu = value;


}
fun valuereturn(value:String):String{
    return valu;
}




