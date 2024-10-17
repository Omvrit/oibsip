package com.example.calculator.ui.theme

import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row

import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.widthIn
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.material3.Divider
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.example.calculator.ui.theme.CalculatorAction

@Composable
fun historyView(List: MutableList<MutableList<String>>,) {

    LazyColumn(Modifier.fillMaxWidth()) {
        items(List.size) {
            Box(
                modifier = Modifier.fillMaxWidth()
            ) {
                Column {


                    Text(
                        text = List[it][0].toString(),
                        color = Color.White,
                        modifier = Modifier
                            .fillMaxWidth()
                            ,
                        fontSize = 15.sp


                    )

                    Text(
                        text = List[it][1].toString(),
                        color = Color.White,
                        modifier = Modifier
                            .fillMaxWidth()
                            ,
                        fontSize = 10.sp


                    )
                }

            }

        }
    }

    Spacer(modifier = Modifier.height(1.dp))

    }


