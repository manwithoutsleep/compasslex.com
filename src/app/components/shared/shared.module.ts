import { NgModule } from '@angular/core';
import { ErrorPageComponent } from './error-page/error-page.component';
import { CommonModule } from '@angular/common';
import { GmapComponent } from './gmap/gmap.component';

@NgModule({
    declarations: [
        ErrorPageComponent,
        GmapComponent
    ],
    imports: [
        CommonModule
    ],
    exports: [
        CommonModule,
        ErrorPageComponent,
        GmapComponent
    ]
})
export class SharedModule { }
