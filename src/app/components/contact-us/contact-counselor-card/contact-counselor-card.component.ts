import { Component, OnInit, Input } from '@angular/core';
import { Counselor } from 'src/app/models/counselor';

@Component({
    selector: 'app-contact-counselor-card',
    templateUrl: './contact-counselor-card.component.html',
    styleUrls: ['./contact-counselor-card.component.scss'],
    standalone: false
})
export class ContactCounselorCardComponent implements OnInit {
    @Input() counselor: Counselor | null | undefined;

    constructor() {}

    ngOnInit(): void {}

    getImageLink(): string {
        return '/assets/site-images/' + this.counselor?.firstname?.toLowerCase() + '-contact-us-200x206.jpg';
    }

    getFirstName(): string {
        return this.counselor ? this.counselor.firstname : '';
    }

    getLastName(): string {
        return this.counselor ? this.counselor.lastname : '';
    }

    getPhone(): string {
        return this.counselor ? this.counselor.phone : '';
    }

    getEmail(): string {
        return this.counselor ? this.counselor.email : '';
    }

    getAppointmentLink(): string {
        return this.counselor ? this.counselor.appointmentlink : '';
    }

    getDirectoryId(): string {
        return this.counselor ? this.counselor.directoryid : '';
    }
}
