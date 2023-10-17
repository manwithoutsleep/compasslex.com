import { createFeatureSelector, createSelector } from '@ngrx/store';
import { NewsletterState } from '../states/newsletter-state';
import * as StoreLabels from '../store-labels';
import { Newsletter } from 'src/app/models/newsletter';
import { NewsletterListStoreStatus } from 'src/app/components/shared/error-page/resolvers/newsletter-list-error-message-resolver';

const getNewsletterStoreState = createFeatureSelector<NewsletterState>(StoreLabels.newsletters);

export const selectAllNewsletters = createSelector(
    getNewsletterStoreState,
    (state: NewsletterState): NewsletterState | undefined => {
        if (!state) { return undefined; }
        return state;
    }
);

export const selectLatestNewsletter = createSelector(
    getNewsletterStoreState,
    (state: NewsletterState): Newsletter | undefined => {
        if (state?.newsletterList && state.isLoaded) {
            const sortedNewsletters = JSON.parse(JSON.stringify(state.newsletterList));
            sortedNewsletters.sort((a: Newsletter, b: Newsletter) => {
                const aVal = a.year * 10 + a.quarter;
                const bVal = b.year * 10 + b.quarter;
                return bVal - aVal;
            });
            const result = sortedNewsletters[0];
            return result;
        }
        return undefined;
    }
);

export const selectAllButLatestNewsletters = createSelector(
    getNewsletterStoreState,
    (state: NewsletterState): Newsletter[] | undefined => {
        if (state?.newsletterList && state.isLoaded) {
            const sortedNewsletters = JSON.parse(JSON.stringify(state.newsletterList));
            sortedNewsletters.sort((a: Newsletter, b: Newsletter) => {
                const aVal = a.year * 10 + a.quarter;
                const bVal = b.year * 10 + b.quarter;
                return bVal - aVal;
            });
            sortedNewsletters.shift();
            return sortedNewsletters;
        }
        return undefined;
    }
);

export const selectNewsletterListLoadState = createSelector(
    getNewsletterStoreState,
    (state: NewsletterState): boolean => state ? state.isLoaded : false
);

export const selectNewsletterListErrors = createSelector(
    getNewsletterStoreState,
    (state: NewsletterState): string | undefined => {
        if (state && state.isLoaded === false) {
            return NewsletterListStoreStatus.LOADING_NEWSLETTER_LIST;
        } else if (state?.newsletterList === undefined || state.newsletterList.length === 0) {
            return NewsletterListStoreStatus.NO_NEWSLETTERS_RETURNED_FROM_SERVER;
        }
        return undefined;
    }
);
