import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { ResourcesComponent } from './components/resources/resources.component';
import { GettingStartedComponent } from './components/getting-started/getting-started.component';
import { FaqComponent } from './components/faq/faq.component';
import { OurServicesComponent } from './components/our-services/our-services.component';
import { MeetUsControllerComponent } from './components/meet-us/meet-us-controller.component';
import { CounselorControllerComponent } from './components/counselor/counselor-controller.component';
import { ContactUsControllerComponent } from './components/contact-us/contact-us-controller.component';
import { NewslettersControllerComponent } from './components/newsletters/newsletters-controller.component';
import { HomePageControllerComponent } from './components/home-page/home-page-controller.component';


const routes: Routes = [
    { path: 'home', component: HomePageControllerComponent },
    { path: 'meet-us', component: MeetUsControllerComponent },
    { path: 'meet-us/:firstname', component: CounselorControllerComponent },
    { path: 'our-services', component: OurServicesComponent },
    { path: 'faq', component: FaqComponent },
    { path: 'getting-started', component: GettingStartedComponent },
    { path: 'resources', component: ResourcesComponent },
    { path: 'contact-us', component: ContactUsControllerComponent },
    { path: 'newsletters', component: NewslettersControllerComponent },
    { path: '', redirectTo: '/home', pathMatch: 'full', },
    { path: '**', redirectTo: '/home', pathMatch: 'full' }
];

@NgModule({
    imports: [
        RouterModule.forRoot(routes, {
            scrollPositionRestoration: 'top'
        })
    ],
    exports: [
        RouterModule
    ]
})
export class AppRoutingModule { }
