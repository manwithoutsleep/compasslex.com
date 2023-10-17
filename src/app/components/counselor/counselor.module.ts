import { NgModule } from '@angular/core';
import { CounselorControllerComponent } from './counselor-controller.component';
import { CounselorComponent } from './counselor.component';
import { SharedModule } from '../shared/shared.module';
import { AppRoutingModule } from 'src/app/app-routing.module';

@NgModule({
    declarations: [
        CounselorControllerComponent,
        CounselorComponent
    ],
    imports: [
        AppRoutingModule,
        SharedModule
    ]
})
export class CounselorModule { }
