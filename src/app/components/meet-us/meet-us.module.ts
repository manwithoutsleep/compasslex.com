import { NgModule } from '@angular/core';
import { MeetUsControllerComponent } from './meet-us-controller.component';
import { MeetUsComponent } from './meet-us.component';
import { SharedModule } from '../shared/shared.module';
import { MeetCounselorCardComponent } from './meet-counselor-card/meet-counselor-card.component';
import { AppRoutingModule } from 'src/app/app-routing.module';

@NgModule({
    declarations: [MeetUsControllerComponent, MeetUsComponent, MeetCounselorCardComponent],
    imports: [SharedModule, AppRoutingModule],
})
export class MeetUsModule {}
