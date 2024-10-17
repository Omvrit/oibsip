package com.example.calculator.ui.theme

import android.graphics.drawable.shapes.OvalShape
import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.Card
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.Font
import androidx.compose.ui.text.font.FontStyle
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import kotlin.math.round

@Composable
fun CalculatorButton(
    symbol:String,
    modifier :Modifier,
    onClick:()-> Unit
){
     Box(
         modifier = Modifier
            .clip(shape = RoundedCornerShape(100))
            .clickable { onClick() }
            .then(modifier)
        ,
         ){

        Text(text = symbol,
            fontSize = 30.sp,
            color = Color.White,
            fontWeight = androidx.compose.ui.text.font.FontWeight.ExtraBold,
            modifier = Modifier.padding(15.dp).align(Alignment.Center),
            softWrap = true,
            fontStyle = FontStyle(20)
        )
    }
}