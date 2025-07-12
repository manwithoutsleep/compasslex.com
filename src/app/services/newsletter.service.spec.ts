import { NewsletterService } from './newsletter.service';
import { HttpTestingController, provideHttpClientTesting } from '@angular/common/http/testing';
import { TestBed, flushMicrotasks, fakeAsync } from '@angular/core/testing';
import { NewsletterData } from '../models/newsletter-data';
import { newsletterBuilder } from '../models/builders/newsletter-builder';
import { environment } from 'src/environments/environment';
import { provideHttpClient, withInterceptorsFromDi } from '@angular/common/http';

describe('NewsletterService', () => {

    const baseUrl = '../assets/data/newsletter.json';

    let sut: NewsletterService;
    let httpTestingController: HttpTestingController;

    beforeEach(() => {

        TestBed.configureTestingModule({
    imports: [],
    providers: [
        NewsletterService,
        provideHttpClient(withInterceptorsFromDi()),
        provideHttpClientTesting()
    ]
}).compileComponents();
        httpTestingController = TestBed.inject(HttpTestingController);
        sut = TestBed.inject(NewsletterService);
    });

    afterEach(() => {
        httpTestingController.verify();
    });

    it('should be created', () => {
        expect(sut).toBeTruthy();
    });

    describe('getAllNewsletters', () => {
        it('should call http get with the correct url', fakeAsync(() => {
            sut.getNewsletterList().subscribe();
            flushMicrotasks();

            const actualRequest = httpTestingController.expectOne(baseUrl);

            expect(actualRequest.request.method).toBe('GET');
        }));

        it('should return the newsletter list json from the service', fakeAsync(() => {
            const jsonResponse = {
                newsletterList: [
                    newsletterBuilder(),
                    newsletterBuilder(),
                    newsletterBuilder()
                ]
            } as NewsletterData;

            sut.getNewsletterList().subscribe(responseFromService => expect(responseFromService).toEqual(jsonResponse));
            flushMicrotasks();

            const actualRequest = httpTestingController.expectOne(baseUrl);
            actualRequest.flush(jsonResponse);
        }));
    });
});
