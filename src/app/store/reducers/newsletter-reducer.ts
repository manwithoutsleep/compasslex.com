import { createNewsletterState } from '../states/newsletter-state';
import { createReducer, on } from '@ngrx/store';
import { getNewsletterListSuccessAction } from '../actions/newsletter-actions';

export const initialNewsletterState = createNewsletterState([], false);

export const newsletterReducer = createReducer(
    initialNewsletterState,
    on(getNewsletterListSuccessAction, (_state, { newsletterList }) => createNewsletterState(newsletterList, true))
);
