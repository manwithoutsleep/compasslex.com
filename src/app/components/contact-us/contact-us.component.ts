import { Component, OnInit, Input } from '@angular/core';
import { Counselor } from 'src/app/models/counselor';

@Component({
    selector: 'app-contact-us',
    templateUrl: './contact-us.component.html',
    styleUrls: ['./contact-us.component.scss'],
    standalone: false
})
export class ContactUsComponent implements OnInit {
    @Input() counselorList: readonly Counselor[] | null | undefined;

    constructor() {}

    ngOnInit(): void {}
}
