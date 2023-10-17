import { Component, Input } from '@angular/core';
import { Counselor } from 'src/app/models/counselor';

@Component({
    selector: 'app-contact-us',
    template: '<div></div>'
})
export class ContactUsFakeComponent {
    @Input() counselorList: readonly Counselor[] | null | undefined;
}
