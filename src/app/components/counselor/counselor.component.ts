import { Component, OnInit, Input } from '@angular/core';
import { Counselor } from 'src/app/models/counselor';

@Component({
    selector: 'app-counselor',
    templateUrl: './counselor.component.html',
    styleUrls: ['./counselor.component.scss'],
    standalone: false,
})
export class CounselorComponent implements OnInit {
    @Input() counselor: Counselor | null | undefined;

    constructor() {}

    ngOnInit(): void {}

    getCounselorName(): string {
        let counselorName = this.counselor
            ? this.counselor.firstname + ' ' + this.counselor.lastname
            : '';
        if (counselorName === 'Linda Fentress') {
            counselorName += ', Clinical Director';
        }
        return counselorName;
    }

    getImageLink(): string {
        return (
            '/assets/site-images/' +
            this.counselor?.firstname?.toLowerCase() +
            '-read-more-221x276.jpg'
        );
    }

    getFirstName(): string {
        return this.counselor ? this.counselor.firstname : '';
    }

    getLastName(): string {
        return this.counselor ? this.counselor.lastname : '';
    }

    getLongDescription(): string {
        return this.counselor ? this.counselor.longdescription : '';
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
