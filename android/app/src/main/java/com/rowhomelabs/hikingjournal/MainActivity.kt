package com.rowhomelabs.hikingjournal;

import android.os.Bundle
import android.view.View
import androidx.activity.enableEdgeToEdge
import dev.hotwire.navigation.activities.HotwireActivity
import dev.hotwire.navigation.navigator.NavigatorConfiguration
import dev.hotwire.navigation.util.applyDefaultImeWindowInsets

const val baseURL = "http://10.0.2.2:3000"

class MainActivity : HotwireActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContentView(R.layout.activity_main)
        findViewById<View>(R.id.main).applyDefaultImeWindowInsets()
    }

    override fun navigatorConfigurations(): List<NavigatorConfiguration> = listOf(
        NavigatorConfiguration(
            name = "main",
            startLocation = "$baseURL/hikes",
            navigatorHostId = R.id.main
        )
    )
}
