import { Component, OnInit, Input } from '@angular/core';
import { Counselor } from 'src/app/models/counselor';

@Component({
    selector: 'app-meet-counselor-card',
    templateUrl: './meet-counselor-card.component.html',
    styleUrls: ['./meet-counselor-card.component.scss'],
})
export class MeetCounselorCardComponent implements OnInit {
    @Input() counselor: Counselor | null | undefined;

    constructor() {}

    ngOnInit(): void {}

    getCounselorName(): string {
        let counselorName = this.counselor ? this.counselor.firstname + ' ' + this.counselor.lastname : '';
        if (counselorName === 'Linda Fentress') {
            counselorName += ', Clinical Director';
        }
        return counselorName;
    }

    getImageLink(): string {
        return '/assets/site-images/' + this.counselor?.firstname?.toLowerCase() + '-meet-us-182x235.jpg';
    }

    getFirstName(): string {
        return this.counselor ? this.counselor.firstname : '';
    }

    getShortDescription(): string {
        return this.counselor ? this.counselor.shortdescription : '';
    }
}
