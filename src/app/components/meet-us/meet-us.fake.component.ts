import { Component, Input } from '@angular/core';
import { Counselor } from 'src/app/models/counselor';

@Component({
    selector: 'app-meet-us',
    template: '<div></div>'
})
export class MeetUsFakeComponent {
    @Input() counselorList: readonly Counselor[] | null | undefined;
}
