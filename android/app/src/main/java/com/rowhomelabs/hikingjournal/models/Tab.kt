package com.rowhomelabs.hikingjournal.models

import androidx.annotation.IdRes
import com.rowhomelabs.hikingjournal.R

data class Tab(
    val name: String,
    val path: String,
    @IdRes val menuId: Int,
    @IdRes val navigatorHostId: Int
) {
    companion object {
        val all = listOf(
            Tab(
                name = "hikes",
                path = "hikes",
                menuId = R.id.bottom_nav_hikes,
                navigatorHostId = R.id.hikes_nav_host
            ),
            Tab(
                name = "hikers",
                path = "users",
                menuId = R.id.bottom_nav_hikers,
                navigatorHostId = R.id.hikers_nav_host
            )
        )
    }
}
