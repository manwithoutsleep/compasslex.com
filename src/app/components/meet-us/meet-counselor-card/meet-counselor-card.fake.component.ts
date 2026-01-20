import { Component, Input } from '@angular/core';
import { Counselor } from 'src/app/models/counselor';

@Component({
    selector: 'app-meet-counselor-card',
    templateUrl: './meet-counselor-card.component.html',
    styleUrls: ['./meet-counselor-card.component.scss'],
})
export class MeetCounselorCardFakeComponent {
    @Input() counselor: Counselor | null | undefined;

    getCounselorName(): string {
        return 'irrelevant counselor name';
    }

    getImageLink(): string {
        return 'https://irrelevant-image-link.com';
    }

    getFirstName(): string {
        return 'irrelevant counselor first name';
    }

    getShortDescription(): string {
        return 'irrelevant counselor short description';
    }
}
