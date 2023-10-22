import { Component, OnInit, ViewChild } from '@angular/core';
import { MapInfoWindow, MapMarker } from '@angular/google-maps';

@Component({
    selector: 'app-gmap',
    templateUrl: './gmap.component.html',
    styleUrls: ['./gmap.component.scss'],
})
export class GmapComponent implements OnInit {
    @ViewChild('infoWindowCompass', { static: false }) infoWindow: MapInfoWindow | undefined;
    @ViewChild('markerCompass', { static: false }) mapMarker: MapMarker | undefined;

    constructor() {}

    ngOnInit(): void {}

    // angular-google-maps (AGM) is not supported with Angular 12+
    // https://github.com/SebastianM/angular-google-maps
    // 
    // Use of angular/components Google Maps as per:
    // https://github.com/angular/components/blob/master/src/google-maps/README.md
    // https://timdeschryver.dev/blog/google-maps-as-an-angular-component

    // apiLoaded: Observable<boolean>;

    // constructor(httpClient: HttpClient) {
    //     this.apiLoaded = httpClient.jsonp("https://maps.googleapis.com/maps/api/js?key=AIzaSyCV-zq7eU8kdVVHggU6I2vO3Pf-blx2b7A", "callback")
    //         .pipe(
    //             map(() => true),
    //             catchError(() => of(false))
    //         );
    // }

    lat = 37.995482;
    lng = -84.463780;
    title = "Compass Christian Counseling";

    marker = {
        position: {
            lat: this.lat,
            lng: this.lng
        },
        label: {
            color: 'red',
            text: this.title
        },
        title: this.title,
        options: { animation: google.maps.Animation.BOUNCE}
    } as MapMarker;

    // Setting height & width here sizes the map correctly in full web view
    // but it does not dynamically size it with browser resize,
    // much less in phone view.
    // So far I have not found a way to target the size via CSS that works.
    map = {
        height: 550,
        width: 465,
        zoom: 15,
        center: new google.maps.LatLng (this.lat, this.lng),
        options: {
            zoomControl: false,
            scrollwheel: false,
            disableDoubleClickZoom: true,
            gestureHandling: "cooperative",
            maxZoom: 15,
            minZoom: 8,
        }
    };

    infoWindowOptions = {
        disableAutoPan: true
    };

    openInfoWindow() {
        if (this.infoWindow && this.mapMarker) {
            this.infoWindow.open(this.mapMarker);
        }
    }
}
