import { MockStore, provideMockStore } from '@ngrx/store/testing';
import { createNewsletterState } from '../states/newsletter-state';
import { TestBed } from '@angular/core/testing';
import { newsletterBuilder } from 'src/app/models/builders/newsletter-builder';
import {
    selectAllNewsletters,
    selectNewsletterListLoadState,
    selectNewsletterListErrors,
    selectLatestNewsletter,
    selectAllButLatestNewsletters,
} from './newsletter-selector';
import { NewsletterListStoreStatus } from 'src/app/components/shared/error-page/resolvers/newsletter-list-error-message-resolver';
import { Newsletter } from 'src/app/models/newsletter';

describe('newsletterSelector', () => {
    let mockReduxStore: MockStore<{}>;
    const initialState = {
        newsletters: createNewsletterState([], false),
    };

    beforeEach(() => {
        TestBed.configureTestingModule({
            providers: [provideMockStore({ initialState })],
        });
        TestBed.compileComponents();
        mockReduxStore = TestBed.inject(MockStore);
    });

    describe('selectAllNewsletters', () => {
        it('should return all of the newsletters', (done) => {
            const expectedState = createNewsletterState(
                [newsletterBuilder(), newsletterBuilder(), newsletterBuilder()],
                true
            );

            mockReduxStore.setState({
                newsletters: expectedState,
            });

            mockReduxStore.select(selectAllNewsletters).subscribe((actualState) => {
                expect(actualState).toEqual(expectedState);
                done();
            });
        });

        it('should return undefined when the state is undefined', (done) => {
            mockReduxStore.setState({ newsletters: undefined });

            mockReduxStore.select(selectAllNewsletters).subscribe((newsletterList) => {
                expect(newsletterList).toBeUndefined();
                done();
            });
        });
    });

    describe('selectLatestNewsletter', () => {
        it('should return the latest newsletter', (done) => {
            const expectedNewsletter = newsletterBuilder({
                title: 'expected newsletter',
                year: 2020,
                quarter: 3,
            });
            const expectedNewsletterList = [
                newsletterBuilder({ year: 2020, quarter: 2 }),
                expectedNewsletter,
                newsletterBuilder({ year: 2019, quarter: 4 }),
                newsletterBuilder({ year: 2019, quarter: 3 }),
                newsletterBuilder({ year: 2019, quarter: 2 }),
                newsletterBuilder({ year: 2019, quarter: 1 }),
            ];

            mockReduxStore.setState({
                newsletters: createNewsletterState(expectedNewsletterList, true),
            });

            mockReduxStore.select(selectLatestNewsletter).subscribe((newsletter) => {
                expect(newsletter).toEqual(expectedNewsletter);
                done();
            });
        });

        it('should return undefined when the list is empty', (done) => {
            mockReduxStore.setState({
                newsletters: createNewsletterState([], true),
            });

            mockReduxStore.select(selectLatestNewsletter).subscribe((newsletter) => {
                expect(newsletter).toBeUndefined();
                done();
            });
        });

        it('should return undefined when the state is not loaded', (done) => {
            mockReduxStore.setState({
                newsletters: createNewsletterState([], false),
            });

            mockReduxStore.select(selectLatestNewsletter).subscribe((newsletter) => {
                expect(newsletter).toBeUndefined();
                done();
            });
        });

        it('should return undefined when the state is undefined', (done) => {
            mockReduxStore.setState({ newsletters: undefined });

            mockReduxStore.select(selectLatestNewsletter).subscribe((newsletter) => {
                expect(newsletter).toBeUndefined();
                done();
            });
        });
    });

    describe('selectNotLatestNewsletters', () => {
        it('should return all but the latest newsletter', (done) => {
            const latestNewsletter = newsletterBuilder({
                title: 'expected newsletter',
                year: 2020,
                quarter: 3,
            });
            const expectedNewsletterList = [
                newsletterBuilder({ year: 2020, quarter: 2 }),
                newsletterBuilder({ year: 2019, quarter: 4 }),
                newsletterBuilder({ year: 2019, quarter: 3 }),
                newsletterBuilder({ year: 2019, quarter: 2 }),
                newsletterBuilder({ year: 2019, quarter: 1 }),
            ];

            const fullNewsletterList = JSON.parse(JSON.stringify(expectedNewsletterList));
            fullNewsletterList.push(latestNewsletter);

            mockReduxStore.setState({
                newsletters: createNewsletterState(fullNewsletterList, true),
            });

            mockReduxStore.select(selectAllButLatestNewsletters).subscribe((newsletterList) => {
                expect(newsletterList).toEqual(expectedNewsletterList);
                done();
            });
        });

        it('should return empty array when the list has just one newsletter', (done) => {
            const fullNewsletterList = [newsletterBuilder()];

            mockReduxStore.setState({
                newsletters: createNewsletterState(fullNewsletterList, true),
            });

            mockReduxStore.select(selectAllButLatestNewsletters).subscribe((newsletterList) => {
                expect(newsletterList).toEqual([]);
                done();
            });
        });

        it('should return empty array when the list is empty', (done) => {
            mockReduxStore.setState({
                newsletters: createNewsletterState([], true),
            });

            mockReduxStore.select(selectAllButLatestNewsletters).subscribe((newsletterList) => {
                expect(newsletterList).toEqual([]);
                done();
            });
        });

        it('should return undefined when the state is not loaded', (done) => {
            mockReduxStore.setState({
                newsletters: createNewsletterState([], false),
            });

            mockReduxStore.select(selectAllButLatestNewsletters).subscribe((newsletterList) => {
                expect(newsletterList).toBeUndefined();
                done();
            });
        });

        it('should return undefined when the state is undefined', (done) => {
            mockReduxStore.setState({
                newsletters: undefined,
            });

            mockReduxStore.select(selectAllButLatestNewsletters).subscribe((newsletterList) => {
                expect(newsletterList).toBeUndefined();
                done();
            });
        });
    });

    describe('selectNewsletterListLoadState', () => {
        it('should return true when the state is loaded', (done) => {
            mockReduxStore.setState({
                newsletters: createNewsletterState([], true),
            });

            mockReduxStore.select(selectNewsletterListLoadState).subscribe((loadedState) => {
                expect(loadedState).toBe(true);
                done();
            });
        });

        it('should return false when the state is not loaded', (done) => {
            mockReduxStore.setState({
                newsletters: createNewsletterState([], false),
            });

            mockReduxStore.select(selectNewsletterListLoadState).subscribe((loadedState) => {
                expect(loadedState).toBe(false);
                done();
            });
        });

        it('should return false when the state is undefined', (done) => {
            mockReduxStore.setState({ newsletters: undefined });

            mockReduxStore.select(selectNewsletterListLoadState).subscribe((loadedState) => {
                expect(loadedState).toBe(false);
                done();
            });
        });
    });

    describe('selectNewsletterListErrors', () => {
        it('should return undefined when the list is loaded and has members', (done) => {
            const expectedNewsletterList = [
                newsletterBuilder(),
                newsletterBuilder(),
                newsletterBuilder(),
            ];

            mockReduxStore.setState({
                newsletters: createNewsletterState(expectedNewsletterList, true),
            });

            mockReduxStore.select(selectNewsletterListErrors).subscribe((errorMessage) => {
                expect(errorMessage).toBeUndefined();
                done();
            });
        });

        it('should return NO_NEWSLETTERS_RETURNED_FROM_SERVER when the state is undefined', (done) => {
            mockReduxStore.setState({ newsletters: undefined });

            mockReduxStore.select(selectNewsletterListErrors).subscribe((errorMessage) => {
                expect(errorMessage).toEqual(
                    NewsletterListStoreStatus.NO_NEWSLETTERS_RETURNED_FROM_SERVER
                );
                done();
            });
        });

        it('should return LOADING_NEWSLETTER_LIST when the list is not loaded', (done) => {
            const expectedNewsletterList = [] as readonly Newsletter[];

            mockReduxStore.setState({
                newsletters: createNewsletterState(expectedNewsletterList, false),
            });

            mockReduxStore.select(selectNewsletterListErrors).subscribe((errorMessage) => {
                expect(errorMessage).toEqual(NewsletterListStoreStatus.LOADING_NEWSLETTER_LIST);
                done();
            });
        });

        it('should return NO_NEWSLETTERS_RETURNED_FROM_SERVER when the list is loaded but empty', (done) => {
            const expectedNewsletterList = [] as readonly Newsletter[];

            mockReduxStore.setState({
                newsletters: createNewsletterState(expectedNewsletterList, true),
            });

            mockReduxStore.select(selectNewsletterListErrors).subscribe((errorMessage) => {
                expect(errorMessage).toEqual(
                    NewsletterListStoreStatus.NO_NEWSLETTERS_RETURNED_FROM_SERVER
                );
                done();
            });
        });
    });
});
