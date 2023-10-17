import { CounselorServiceEffects } from './counselor-service-effects.service';
import { Observable, of, throwError } from 'rxjs';
import { Action } from '@ngrx/store';
import { CounselorService } from 'src/app/services/counselor.service';
import { TestBed } from '@angular/core/testing';
import { provideMockActions } from '@ngrx/effects/testing';
import { CounselorData } from 'src/app/models/counselor-data';
import { counselorBuilder } from 'src/app/models/builders/counselor-builder';
import { getCounselorListAction, getCounselorListSuccessAction, getCounselorListFailuireAction } from '../actions/counselor-actions';
import { Counselor } from 'src/app/models/counselor';
import { createCounselorState } from '../states/counselor-state';
import { provideMockStore } from '@ngrx/store/testing';
import { marbles } from 'rxjs-marbles/jasmine';

describe('CounselorServiceEffects', () => {

    const counselorList: Counselor[] = [counselorBuilder(), counselorBuilder(), counselorBuilder()];

    let sut: CounselorServiceEffects;
    let actions$: Observable<Action>;
    const mockCounselorService = jasmine.createSpyObj('CounselorService', ['getCounselorList']);

    beforeEach(() => {
        const initialState = { counselors: createCounselorState([], false) };

        TestBed.configureTestingModule({
            providers: [
                CounselorServiceEffects,
                { provide: CounselorService, useValue: mockCounselorService },
                provideMockActions(() => actions$),
                provideMockStore({ initialState })
            ]
        });

        sut = TestBed.inject(CounselorServiceEffects);
    });

    it('should be created', () => {
        expect(sut).toBeTruthy();
    });

    describe('getCounselorListAction', () => {
        it('should fire off a getCounselorListSuccessAction when service returns success', marbles(m => {
            const expectedResponse = { counselorList } as CounselorData;

            mockCounselorService.getCounselorList = (): Observable<CounselorData> => of(expectedResponse);

            const initialAction = getCounselorListAction;
            const completedAction = getCounselorListSuccessAction(expectedResponse);

            actions$ = m.hot('--a-', { a: initialAction });
            const expected = m.cold('--b', { b: completedAction });

            m.expect (sut.getCounselorList$).toBeObservable(expected);
        }));

        it('should fire off a getCounselorListFailureAction when an HTTP error occurs', marbles(m => {
            mockCounselorService.getCounselorList = (): Observable<CounselorData> => throwError(() => new Error('irrelevant error message'));
            const action = getCounselorListAction;
            const completedAction = getCounselorListFailuireAction();

            actions$ = m.hot('a', { a: action });
            const expected = m.cold('b', { b: completedAction });

            m.expect(sut.getCounselorList$).toBeObservable(expected);
        }));
    });
});
