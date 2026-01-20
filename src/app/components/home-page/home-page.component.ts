import { Component, OnInit, Input } from '@angular/core';
import { Newsletter } from 'src/app/models/newsletter';

@Component({
    selector: 'app-home-page',
    templateUrl: './home-page.component.html',
    styleUrls: ['./home-page.component.scss'],
    standalone: false,
})
export class HomePageComponent implements OnInit {
    @Input() latestNewsletter: Newsletter | null | undefined;

    rotatorImageIndex = 1;

    constructor() {
        setInterval(() => {
            // Get the next image in the array
            this.rotatorImageIndex = (this.rotatorImageIndex % 5) + 1;
        }, 7000);
    }

    ngOnInit(): void {
        this.loadImages();
    }

    public getRotatorImageIndex(): number {
        return this.rotatorImageIndex;
    }

    public getNewsletterAltText(): string {
        if (this.latestNewsletter) {
            const date = this.getNewsletterDate();
            return `${date} - ${this.latestNewsletter.title}`;
        }
        return '';
    }

    public getNewsletterImageUrl(): string {
        if (this.latestNewsletter) {
            const result = `/assets/newsletters/CompassNewsletter${this.latestNewsletter.year}Q${this.latestNewsletter.quarter}.png`;
            return result;
        }
        return '';
    }

    public getNewsletterDate(): string {
        if (this.latestNewsletter) {
            const season = this.getSeasonFromNumber(this.latestNewsletter.quarter);
            return `${season}${this.latestNewsletter.year}`;
        }
        return '';
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

    images = [
        '/assets/slider-images/slider-image-1.jpg',
        '/assets/slider-images/slider-image-2.jpg',
        '/assets/slider-images/slider-image-3.jpg',
        '/assets/slider-images/slider-image-4.jpg',
        '/assets/slider-images/slider-image-5.jpg',
    ];

    loadImages() {
        for (let i = 0; i < this.images.length; i++) {
            const img = new Image();
            img.src = this.images[i];
        }
    }
}
