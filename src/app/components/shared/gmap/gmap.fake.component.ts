import { Component, Input, ViewChild } from '@angular/core';
import { MapInfoWindow, MapMarker } from '@angular/google-maps';

@Component({
    selector: 'app-gmap',
    template: '',
    standalone: false,
})
export class GmapFakeComponent {
    @ViewChild('infoWindowCompass', { static: false }) infoWindow: MapInfoWindow | undefined;
    @ViewChild('markerCompass', { static: false }) mapMarker: MapMarker | undefined;
}
