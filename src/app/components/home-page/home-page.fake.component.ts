import { Component, Input } from '@angular/core';
import { Newsletter } from 'src/app/models/newsletter';

@Component({
    selector: 'app-home-page',
    template: '<div></div>'
})
export class HomePageFakeComponent {
    @Input() latestNewsletter: Newsletter | null | undefined;
}
