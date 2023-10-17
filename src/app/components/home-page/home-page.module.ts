import { NgModule } from '@angular/core';
import { HomePageControllerComponent } from './home-page-controller.component';
import { HomePageComponent } from './home-page.component';
import { SharedModule } from '../shared/shared.module';
import { AppRoutingModule } from 'src/app/app-routing.module';

@NgModule({
    declarations: [
        HomePageControllerComponent,
        HomePageComponent,
    ],
    imports: [
        SharedModule,
        AppRoutingModule
    ]
})
export class HomePageModule { }
