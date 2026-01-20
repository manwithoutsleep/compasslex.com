import { Component, OnInit, Input } from '@angular/core';
import { Counselor } from 'src/app/models/counselor';

@Component({
    selector: 'app-meet-us',
    templateUrl: './meet-us.component.html',
    styleUrls: ['./meet-us.component.scss'],
    standalone: false,
})
export class MeetUsComponent implements OnInit {
    @Input() counselorList: readonly Counselor[] | null | undefined;

    constructor() {}

    ngOnInit(): void {}
}
