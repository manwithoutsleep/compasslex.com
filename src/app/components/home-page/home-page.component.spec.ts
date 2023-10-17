import { ComponentFixture, TestBed } from '@angular/core/testing';
import { newsletterBuilder } from 'src/app/models/builders/newsletter-builder';
import { HomePageComponent } from './home-page.component';

describe('HomePageComponent', () => {
    let component: HomePageComponent;
    let fixture: ComponentFixture<HomePageComponent>;

    beforeEach(() => {
        TestBed.configureTestingModule({
            declarations: [
                HomePageComponent
            ],
        }).compileComponents();

        fixture = TestBed.createComponent(HomePageComponent);
        component = fixture.componentInstance;
        fixture.detectChanges();
    });

    it('should create', () => {
        expect(component).toBeTruthy();
    });

    describe('getRotatorImageIndex', () => {
        it('should return zero', () => {
            const actual = component.getRotatorImageIndex();
            expect(actual).toEqual(0);
        });
    });

    describe('getNewsletterAltText', () => {
        it('should return the image URL of the given newsletter', () => {            
            component.latestNewsletter = newsletterBuilder();
            const expected = `${component.getNewsletterDate()} - ${component.latestNewsletter.title}`;
            const actual = component.getNewsletterAltText();
            expect(actual).toEqual(expected);
        });
        it('should return an empty string when the newsletter is null', () => {
            component.latestNewsletter = null;
            const actual = component.getNewsletterAltText();
            expect(actual).toEqual('');
        });
        it('should return an empty string when the newsletter is undefined', () => {
            component.latestNewsletter = undefined;
            const actual = component.getNewsletterAltText();
            expect(actual).toEqual('');
        });
    });    

    describe('getNewsletterImageUrl', () => {
        it('should return the image URL of the given newsletter', () => {            
            component.latestNewsletter = newsletterBuilder();
            const expected = `/assets/newsletters/CompassNewsletter${component.latestNewsletter.year}Q${component.latestNewsletter.quarter}.png`;
            const actual = component.getNewsletterImageUrl();
            expect(actual).toEqual(expected);
        });
        it('should return an empty string when the newsletter is null', () => {
            component.latestNewsletter = null;
            const actual = component.getNewsletterImageUrl();
            expect(actual).toEqual('');
        });
        it('should return an empty string when the newsletter is undefined', () => {
            component.latestNewsletter = undefined;
            const actual = component.getNewsletterImageUrl();
            expect(actual).toEqual('');
        });
    });    

    describe('getNewsletterDate', () => {
        it('should return the date of the given newsletter', () => {            
            component.latestNewsletter = newsletterBuilder();
            let season = '';
            switch (component.latestNewsletter.quarter) {
                case 1:
                    season = 'Spring ';
                    break;
                case 2:
                    season = 'Summer ';
                    break;
                case 3:
                    season = 'Fall ';
                    break;
                case 4:
                    season = 'Winter ';
                    break;
                default:
                    season = 'error';
            }
            const expected = `${season}${component.latestNewsletter.year}`;
            const actual = component.getNewsletterDate();
            expect(actual).toEqual(expected);
        });
        it('should return an empty string when the newsletter is null', () => {
            component.latestNewsletter = null;
            const actual = component.getNewsletterDate();
            expect(actual).toEqual('');
        });
        it('should return an empty string when the newsletter is undefined', () => {
            component.latestNewsletter = undefined;
            const actual = component.getNewsletterDate();
            expect(actual).toEqual('');
        });
    });
});
