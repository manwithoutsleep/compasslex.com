import { NgModule } from '@angular/core';
import { AppMaterialModule } from './app.material.module';
import { ErrorPageComponent } from './error-page/error-page.component';
import { CommonModule } from '@angular/common';

@NgModule({
    declarations: [
        ErrorPageComponent
    ],
    imports: [
        AppMaterialModule,
        CommonModule
    ],
    exports: [
        AppMaterialModule,
        CommonModule,
        ErrorPageComponent
    ]
})
export class SharedModule { }
