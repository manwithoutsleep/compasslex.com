import { NgModule } from '@angular/core';
import { NewslettersControllerComponent } from './newsletters-controller.component';
import { NewslettersComponent } from './newsletters.component';
import { SharedModule } from '../shared/shared.module';
import { AppRoutingModule } from 'src/app/app-routing.module';

@NgModule({
    declarations: [
        NewslettersControllerComponent,
        NewslettersComponent,
    ],
    imports: [
        SharedModule,
        AppRoutingModule
    ]
})
export class NewslettersModule { }
