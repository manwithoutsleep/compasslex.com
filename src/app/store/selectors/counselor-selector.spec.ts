import { MockStore, provideMockStore } from '@ngrx/store/testing';
import { createCounselorState } from '../states/counselor-state';
import { TestBed } from '@angular/core/testing';
import { counselorBuilder } from 'src/app/models/builders/counselor-builder';
import {
    selectAllCounselors,
    selectCounselorListLoadState,
    selectCounselorListStateError,
    selectCounselorByFirstName,
    selectCounselorStateError
} from './counselor-selector';
import { CounselorListStoreStatus } from 'src/app/components/shared/error-page/resolvers/counselor-list-error-message-resolver';
import { Counselor } from 'src/app/models/counselor';

describe('counselorSelector', () => {
    let mockReduxStore: MockStore<{}>;
    const initialState = {
        counselors: createCounselorState([], false)
    };

    beforeEach(() => {
        TestBed.configureTestingModule({
            providers: [
                provideMockStore({ initialState })
            ]
        });
        TestBed.compileComponents();
        mockReduxStore = TestBed.inject(MockStore);
    });

    describe('selectAllCounselors', () => {
        it('should return all of the counselors', done => {
            const expectedCounselorList = [
                counselorBuilder(),
                counselorBuilder(),
                counselorBuilder()
            ];

            const expectedState = createCounselorState(expectedCounselorList, true);

            mockReduxStore.setState({
                counselors: expectedState
            });

            mockReduxStore.select(selectAllCounselors).subscribe(actualState => {
                expect(actualState).toEqual(expectedState);
                done();
            });
        });

        it('should return undefined when the state is undefined', done => {
            mockReduxStore.setState({ counselors: undefined });

            mockReduxStore.select(selectAllCounselors).subscribe(counselorList => {
                expect(counselorList).toBeUndefined();
                done();
            });
        });
    });

    describe('selectCounselorByFirstName', () => {
        const expectedCounselorList = [
            counselorBuilder(),
            counselorBuilder(),
            counselorBuilder()
        ];

        it('should return the specified counselor', done => {
            const expectedCounselor = expectedCounselorList[1];

            mockReduxStore.setState({
                counselors: createCounselorState(expectedCounselorList, true)
            });

            mockReduxStore.select(selectCounselorByFirstName(expectedCounselor.firstname)).subscribe(counselor => {
                expect(counselor).toEqual(expectedCounselor);
                done();
            });
        });

        it('should return undefined when the specified counselor is not found', done => {
            mockReduxStore.setState({
                counselors: createCounselorState(expectedCounselorList, true)
            });

            mockReduxStore.select(selectCounselorByFirstName('incorrect first name')).subscribe(counselor => {
                expect(counselor).toBeUndefined();
                done();
            });
        });

        it('should return undefined when the list is empty', done => {
            mockReduxStore.setState({
                counselors: createCounselorState([], true)
            });

            mockReduxStore.select(selectCounselorByFirstName('irrelevant first name')).subscribe(counselor => {
                expect(counselor).toBeUndefined();
                done();
            });
        });

        it('should return undefined when the state is not loaded', done => {
            mockReduxStore.setState({
                counselors: createCounselorState([], false)
            });

            mockReduxStore.select(selectCounselorByFirstName('irrelevant first name')).subscribe(counselor => {
                expect(counselor).toBeUndefined();
                done();
            });
        });

        it('should return undefined when the state is undefined', done => {
            mockReduxStore.setState({ counselors: undefined });

            mockReduxStore.select(selectCounselorByFirstName('irrelevant first name')).subscribe(counselor => {
                expect(counselor).toBeUndefined();
                done();
            });
        });
    });

    describe('selectCounselorListLoadState', () => {
        it('should return true when the state is loaded', done => {
            mockReduxStore.setState({
                counselors: createCounselorState([], true)
            });

            mockReduxStore.select(selectCounselorListLoadState).subscribe(loadedState => {
                expect(loadedState).toBe(true);
                done();
            });
        });

        it('should return false when the state is not loaded', done => {
            mockReduxStore.setState({
                counselors: createCounselorState([], false)
            });

            mockReduxStore.select(selectCounselorListLoadState).subscribe(loadedState => {
                expect(loadedState).toBe(false);
                done();
            });
        });

        it('should return false when the state is undefined', done => {
            mockReduxStore.setState({ counselors: undefined });

            mockReduxStore.select(selectCounselorListLoadState).subscribe(loadedState => {
                expect(loadedState).toBe(false);
                done();
            });
        });
    });

    describe('selectCounselorListErrors', () => {
        it('should return undefined when the list is loaded and has members', done => {
            const expectedCounselorList = [
                counselorBuilder(),
                counselorBuilder(),
                counselorBuilder()
            ];

            mockReduxStore.setState({
                counselors: createCounselorState(expectedCounselorList, true)
            });

            mockReduxStore.select(selectCounselorListStateError).subscribe(errorMessage => {
                expect(errorMessage).toBeUndefined();
                done();
            });
        });

        it('should return LOADING_COUNSELOR_LIST when the state is undefined', done => {
            mockReduxStore.setState({ counselors: undefined });

            mockReduxStore.select(selectCounselorListStateError).subscribe(errorMessage => {
                expect(errorMessage).toEqual(CounselorListStoreStatus.LOADING_COUNSELOR_LIST);
                done();
            });
        });

        it('should return LOADING_COUNSELOR_LIST when the list is not loaded', done => {
            const expectedCounselorList = [] as readonly Counselor[];

            mockReduxStore.setState({
                counselors: createCounselorState(expectedCounselorList, false)
            });

            mockReduxStore.select(selectCounselorListStateError).subscribe(errorMessage => {
                expect(errorMessage).toEqual(CounselorListStoreStatus.LOADING_COUNSELOR_LIST);
                done();
            });
        });

        it('should return NO_COUNSELORS_RETURNED_FROM_SERVER when the list is loaded but empty', done => {
            const expectedCounselorList = [] as readonly Counselor[];

            mockReduxStore.setState({
                counselors: createCounselorState(expectedCounselorList, true)
            });

            mockReduxStore.select(selectCounselorListStateError).subscribe(errorMessage => {
                expect(errorMessage).toEqual(CounselorListStoreStatus.NO_COUNSELORS_RETURNED_FROM_DATA_STORE);
                done();
            });
        });
    });

    describe('selectCounselorStateError', () => {
        it('should return undefined when the list is loaded and the counselor is found', done => {
            const expectedCounselorList = [
                counselorBuilder(),
                counselorBuilder(),
                counselorBuilder()
            ];
            const expectedCounselor = expectedCounselorList[1];

            mockReduxStore.setState({
                counselors: createCounselorState(expectedCounselorList, true)
            });

            mockReduxStore.select(selectCounselorStateError(expectedCounselor.firstname)).subscribe(errorMessage => {
                expect(errorMessage).toBeUndefined();
                done();
            });
        });

        it('should return REQUESTED_COUNSELOR_NOT_FOUND when the list is loaded and the counselor is found', done => {
            const expectedCounselorList = [
                counselorBuilder(),
                counselorBuilder(),
                counselorBuilder()
            ];

            mockReduxStore.setState({
                counselors: createCounselorState(expectedCounselorList, true)
            });

            mockReduxStore.select(selectCounselorStateError('incorrect first name')).subscribe(errorMessage => {
                expect(errorMessage).toEqual(CounselorListStoreStatus.REQUESTED_COUNSELOR_NOT_FOUND);
                done();
            });
        });

        it('should return LOADING_COUNSELOR_LIST when the list is not loaded', done => {
            const expectedCounselorList = [] as readonly Counselor[];

            mockReduxStore.setState({
                counselors: createCounselorState(expectedCounselorList, false)
            });

            mockReduxStore.select(selectCounselorListStateError).subscribe(errorMessage => {
                expect(errorMessage).toEqual(CounselorListStoreStatus.LOADING_COUNSELOR_LIST);
                done();
            });
        });

        it('should return LOADING_COUNSELOR_LIST when the state is undefined', done => {
            mockReduxStore.setState({ counselors: undefined });

            mockReduxStore.select(selectCounselorListStateError).subscribe(errorMessage => {
                expect(errorMessage).toEqual(CounselorListStoreStatus.LOADING_COUNSELOR_LIST);
                done();
            });
        });

        it('should return NO_COUNSELORS_RETURNED_FROM_SERVER when the list is loaded but empty', done => {
            const expectedCounselorList = [] as readonly Counselor[];

            mockReduxStore.setState({
                counselors: createCounselorState(expectedCounselorList, true)
            });

            mockReduxStore.select(selectCounselorListStateError).subscribe(errorMessage => {
                expect(errorMessage).toEqual(CounselorListStoreStatus.NO_COUNSELORS_RETURNED_FROM_DATA_STORE);
                done();
            });
        });
    });
});
