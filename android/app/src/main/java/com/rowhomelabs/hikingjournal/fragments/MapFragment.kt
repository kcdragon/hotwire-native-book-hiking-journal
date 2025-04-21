package com.rowhomelabs.hikingjournal.fragments

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.ui.platform.ComposeView
import com.google.android.gms.maps.model.CameraPosition
import com.google.maps.android.compose.GoogleMap
import com.google.maps.android.compose.MapProperties
import com.google.maps.android.compose.MapType
import com.google.maps.android.compose.Marker
import com.google.maps.android.compose.rememberCameraPositionState
import com.google.maps.android.compose.rememberMarkerState
import com.rowhomelabs.hikingjournal.R
import com.rowhomelabs.hikingjournal.viewmodels.HikeViewModel
import dev.hotwire.navigation.destinations.HotwireDestinationDeepLink
import dev.hotwire.navigation.fragments.HotwireFragment

@HotwireDestinationDeepLink(uri = "hotwire://fragment/map")
class MapFragment : HotwireFragment() {
    private lateinit var viewModel: HikeViewModel

    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        viewModel = HikeViewModel(url = "${navigator.location}.json")
        val view = inflater.inflate(R.layout.fragment_map, container, false)
        view.findViewById<ComposeView>(R.id.compose_view).apply {
            setContent {
                MapView(viewModel = viewModel)
            }
        }
        return view
    }

    @Composable
    fun MapView(viewModel: HikeViewModel) {
        LaunchedEffect(viewModel) {
            viewModel.fetchCoordinates()
        }

        val hike = viewModel.hike.value
        if (hike != null) {
            val markerState = rememberMarkerState(position = hike.coordinate)
            val cameraPositionState = rememberCameraPositionState {
                position = CameraPosition.fromLatLngZoom(hike.coordinate, 15f)
            }
            GoogleMap(
                cameraPositionState = cameraPositionState,
                properties = MapProperties(mapType = MapType.HYBRID)
            ) {
                Marker(
                    state = markerState,
                    title = hike.name
                )
            }
        }
    }
}
