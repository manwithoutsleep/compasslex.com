import { Component, OnInit, Input } from '@angular/core';
import { Newsletter } from 'src/app/models/newsletter';

@Component({
    selector: 'app-newsletters',
    templateUrl: './newsletters.component.html',
    styleUrls: ['./newsletters.component.scss'],
    standalone: false
})
export class NewslettersComponent implements OnInit {
    @Input() newsletterList: Newsletter[] | null | undefined;
    @Input() latestNewsletter: Newsletter | null | undefined;

    constructor() {}

    ngOnInit(): void {}

    public getTitle(newsletter: Newsletter | null | undefined): string {
        if (newsletter) {
            const date = this.getNewsletterDate(newsletter);
            return `${date} - ${newsletter.title}`;
        }
        return '';
    }

    public getNewsletterAltText(newsletter: Newsletter | null | undefined): string {
        if (newsletter) {
            const date = this.getNewsletterDate(newsletter);
            return `${date} - ${newsletter.title}`;
        }
        return '';
    }

    public getNewsletterImageUrl(newsletter: Newsletter | null | undefined): string {
        if (newsletter) {
            return `/assets/newsletters/CompassNewsletter${newsletter.year}Q${newsletter.quarter}.png`;
        }
        return '';
    }

    public getNewsletterDate(newsletter: Newsletter | null | undefined): string {
        if (newsletter) {
            const season = this.getSeasonFromNumber(newsletter.quarter);
            return `${season}${newsletter.year}`;
        }
        return '';
    }

    public handleClick(newsletter: Newsletter | null | undefined): void {
        if (newsletter) {
            window.open(`/assets/newsletters/CompassNewsletter${newsletter.year}Q${newsletter.quarter}.pdf`, '_blank');
        }
    }

    private getSeasonFromNumber(quarter: number): string {
        switch (quarter) {
            case 1:
                return 'Spring ';
            case 2:
                return 'Summer ';
            case 3:
                return 'Fall ';
            case 4:
                return 'Winter ';
            default:
                return '';
        }
    }
}
