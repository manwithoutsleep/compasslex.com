import { CounselorService } from './counselor.service';
import { HttpTestingController, provideHttpClientTesting } from '@angular/common/http/testing';
import { TestBed, flushMicrotasks, fakeAsync } from '@angular/core/testing';
import { CounselorData } from '../models/counselor-data';
import { counselorBuilder } from '../models/builders/counselor-builder';
import { environment } from 'src/environments/environment';
import { provideHttpClient, withInterceptorsFromDi } from '@angular/common/http';

describe('CounselorService', () => {

    const baseUrl = '../assets/data/counselor.json';

    let sut: CounselorService;
    let httpTestingController: HttpTestingController;

    beforeEach(() => {

        TestBed.configureTestingModule({
    imports: [],
    providers: [
        CounselorService,
        provideHttpClient(withInterceptorsFromDi()),
        provideHttpClientTesting()
    ]
}).compileComponents();
        httpTestingController = TestBed.inject(HttpTestingController);
        sut = TestBed.inject(CounselorService);
    });

    afterEach(() => {
        httpTestingController.verify();
    });

    it('should be created', () => {
        expect(sut).toBeTruthy();
    });

    describe('getAllCounselors', () => {
        it('should call http get with the correct url', fakeAsync(() => {
            sut.getCounselorList().subscribe();
            flushMicrotasks();

            const actualRequest = httpTestingController.expectOne(baseUrl);

            expect(actualRequest.request.method).toBe('GET');
        }));

        it('should return the counselor list json from the service', fakeAsync(() => {
            const jsonResponse = {
                counselorList: [
                    counselorBuilder(),
                    counselorBuilder(),
                    counselorBuilder()
                ]
            } as CounselorData;

            sut.getCounselorList().subscribe(responseFromService => expect(responseFromService).toEqual(jsonResponse));
            flushMicrotasks();

            const actualRequest = httpTestingController.expectOne(baseUrl);
            actualRequest.flush(jsonResponse);
        }));
    });
});
