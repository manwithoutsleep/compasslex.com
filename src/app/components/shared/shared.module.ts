import { NgModule } from '@angular/core';
import { AppMaterialModule } from './app.material.module';
import { ErrorPageComponent } from './error-page/error-page.component';
import { CommonModule } from '@angular/common';
import { GoogleMapsModule } from '@angular/google-maps';
import { GmapComponent } from './gmap/gmap.component';

@NgModule({
    declarations: [
        ErrorPageComponent,
        GmapComponent
    ],
    imports: [
        AppMaterialModule,
        CommonModule,
        GoogleMapsModule
    ],
    exports: [
        AppMaterialModule,
        CommonModule,
        ErrorPageComponent,
        GmapComponent
    ]
})
export class SharedModule { }
