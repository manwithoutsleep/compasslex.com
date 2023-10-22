import { NgModule } from '@angular/core';
import { ContactUsControllerComponent } from './contact-us-controller.component';
import { ContactUsComponent } from './contact-us.component';
import { SharedModule } from '../shared/shared.module';
import { AppRoutingModule } from 'src/app/app-routing.module';
import { ContactCounselorCardComponent } from './contact-counselor-card/contact-counselor-card.component';
import { HttpClientJsonpModule, HttpClientModule } from '@angular/common/http';

@NgModule({
    declarations: [
        ContactUsControllerComponent,
        ContactUsComponent,
        ContactCounselorCardComponent
    ],
    imports: [
        SharedModule,
        AppRoutingModule,
        HttpClientModule,
        HttpClientJsonpModule
    ]
})
export class ContactUsModule { }
