import { Component, OnInit } from '@angular/core';
import { Loader } from '@googlemaps/js-api-loader';
import { environment } from 'src/environments/environment';

@Component({
    selector: 'app-gmap',
    templateUrl: './gmap.component.html',
    styleUrls: ['./gmap.component.scss'],
    standalone: false,
})
export class GmapComponent implements OnInit {
    public loader = new Loader({
        apiKey: environment.googleMapsApiKey,
        version: 'weekly',
    });

    constructor() {}

    ngOnInit(): void {
        this.loader.load().then(async () => {
            const title = 'Compass Christian Counseling';
            const content =
                '<b>Compass Christian Counseling</b><br />651 Perimeter Drive, Suite 115<br />Lexington, KY 40517';
            const position = {
                lat: 37.995482,
                lng: -84.46378,
            };

            const { Map } = (await google.maps.importLibrary('maps')) as google.maps.MapsLibrary;
            const { AdvancedMarkerElement } = (await google.maps.importLibrary(
                'marker'
            )) as google.maps.MarkerLibrary;

            const map = new Map(document.getElementById('map') as HTMLElement, {
                center: position,
                mapId: 'CompassMapId',
                zoom: 14,
                gestureHandling: 'cooperative',
            });

            const anchor = new AdvancedMarkerElement({
                map,
                position,
                title,
            });

            const infoWindow = new google.maps.InfoWindow({
                content,
                ariaLabel: title,
            });

            infoWindow.open({
                anchor,
                map,
            });
        });
    }
}
