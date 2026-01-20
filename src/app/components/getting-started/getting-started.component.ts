import { Component, OnInit } from '@angular/core';

@Component({
    selector: 'app-getting-started',
    templateUrl: './getting-started.component.html',
    styleUrls: ['./getting-started.component.scss'],
    standalone: false,
})
export class GettingStartedComponent implements OnInit {
    constructor() {}

    ngOnInit(): void {}

    public openPdf(pdfUrl: string): void {
        window.open(pdfUrl, '_blank');
    }
}
