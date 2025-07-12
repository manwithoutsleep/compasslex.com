import { Component, Input } from '@angular/core';
import { Counselor } from 'src/app/models/counselor';

@Component({
    selector: 'app-counselor',
    templateUrl: './counselor.component.html',
    styleUrls: ['./counselor.component.scss'],
    standalone: false
})
export class CounselorFakeComponent {
    @Input() counselor: Counselor | null | undefined;

    getCounselorName(): string {
        return "irrelevant counselor name";
    }
    getImageLink(): string {
        return '/assets/site-images/linda-read-more-221x276.jpg';
    }
    getFirstName(): string {
        return "irrelevant counselor first name";
    }
    getLastName(): string {
        return "irrelevant counselor last name";
    }
    getLongDescription(): string {
        return "irrelevant counselor long description";
    }
    getEmail(): string {
        return "irrelevant counselor email";
    }
    getDirectoryId(): string {
        return "irrelevant counselor directory id";
    }
    getAppointmentLink(): string {
        return "irrelevant appointment link";
    }
}
