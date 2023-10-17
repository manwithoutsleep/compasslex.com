import { NewsletterServiceEffects } from './newsletter-service-effects.service';
import { Observable, of, throwError } from 'rxjs';
import { marbles } from 'rxjs-marbles/jasmine';
import { Action } from '@ngrx/store';
import { NewsletterService } from 'src/app/services/newsletter.service';
import { TestBed } from '@angular/core/testing';
import { provideMockActions } from '@ngrx/effects/testing';
import { NewsletterData } from 'src/app/models/newsletter-data';
import { newsletterBuilder } from 'src/app/models/builders/newsletter-builder';
import { getNewsletterListAction, getNewsletterListSuccessAction, getNewsletterListFailuireAction } from '../actions/newsletter-actions';
import { Newsletter } from 'src/app/models/newsletter';
import { createNewsletterState } from '../states/newsletter-state';
import { provideMockStore } from '@ngrx/store/testing';

describe('NewsletterServiceEffects', () => {

    const newsletterList: Newsletter[] = [newsletterBuilder(), newsletterBuilder(), newsletterBuilder()];
    
    let sut: NewsletterServiceEffects;
    let actions$: Observable<Action>;
    const mockNewsletterService = jasmine.createSpyObj('NewsletterService', ['getNewsletterList']);

    beforeEach(() => {
        const initialState = { newsletters: createNewsletterState([], false) };

        TestBed.configureTestingModule({
            providers: [
                NewsletterServiceEffects,
                { provide: NewsletterService, useValue: mockNewsletterService },
                provideMockActions(() => actions$),
                provideMockStore({ initialState })
            ]
        });

        sut = TestBed.inject(NewsletterServiceEffects);
    });

    it('should be created', () => {
        expect(sut).toBeTruthy();
    });

    describe('getNewsletterListAction', () => {
        it('should fire off a getNewsletterListSuccessAction when service returns success', marbles(m => {
            const expectedResponse = { newsletterList } as NewsletterData;

            mockNewsletterService.getNewsletterList = (): Observable<NewsletterData> => of(expectedResponse);

            const initialAction = getNewsletterListAction;
            const completedAction = getNewsletterListSuccessAction(expectedResponse);

            actions$ = m.hot('--a-', { a: initialAction });
            const expected = m.cold('--b', { b: completedAction });

            m.expect(sut.getNewsletterList$).toBeObservable(expected);
        }));

        it('should fire off a getNewsletterListFailureAction when an HTTP error occurs', marbles(m => {
            mockNewsletterService.getNewsletterList = (): Observable<NewsletterData> => throwError(() => new Error('irrelevant error message'));
            const action = getNewsletterListAction;
            const completedAction = getNewsletterListFailuireAction();

            actions$ = m.hot('a', { a: action });
            const expected = m.cold('b', { b: completedAction });

            m.expect(sut.getNewsletterList$).toBeObservable(expected);
        }));
    });
});
