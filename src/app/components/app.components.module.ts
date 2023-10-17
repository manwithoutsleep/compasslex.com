import { NgModule } from '@angular/core';
import { AppMaterialModule } from './shared/app.material.module';
import { OurServicesComponent } from './our-services/our-services.component';
import { FaqComponent } from './faq/faq.component';
import { GettingStartedComponent } from './getting-started/getting-started.component';
import { ResourcesComponent } from './resources/resources.component';
import { NavigationComponent } from './navigation/navigation.component';
import { AppRoutingModule } from '../app-routing.module';
import { MeetUsModule } from './meet-us/meet-us.module';
import { SharedModule } from './shared/shared.module';
import { CounselorModule } from './counselor/counselor.module';
import { ContactUsModule } from './contact-us/contact-us.module';
import { NewslettersModule } from './newsletters/newsletters.module';
import { HomePageModule } from './home-page/home-page.module';

@NgModule({
    declarations: [
        FaqComponent,
        GettingStartedComponent,
        NavigationComponent,
        OurServicesComponent,
        ResourcesComponent
    ],
    imports: [
        AppMaterialModule,
        AppRoutingModule,
        ContactUsModule,
        CounselorModule,
        HomePageModule,
        MeetUsModule,
        NewslettersModule,
        SharedModule
    ],
    exports: [
        NavigationComponent
    ]
})
export class AppComponentsModule {}
