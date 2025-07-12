import { Component, Input } from '@angular/core';
import { Newsletter } from 'src/app/models/newsletter';

@Component({
    selector: 'app-newsletters',
    template: '<div></div>',
    standalone: false
})
export class NewslettersFakeComponent {
    @Input() newsletterList: Newsletter[] | null | undefined;
    @Input() latestNewsletter: Newsletter | null | undefined;
}
