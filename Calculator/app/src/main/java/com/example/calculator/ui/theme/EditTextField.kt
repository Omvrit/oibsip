package com.example.calculator.ui.theme

import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.size
import androidx.compose.material3.TextField
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.sp


@Composable
fun EditTextField(modifier: Modifier,onValueChanged:(String)->Unit , value: String = ""){
    Box(){
        TextField(
            value = value,
            onValueChange = { onValueChanged(it) },
            modifier = modifier,
            textStyle = androidx.compose.ui.text.TextStyle(fontSize = 20.sp),


        )

    }
}
