import { createAction, props } from '@ngrx/store';
import { NewsletterData } from 'src/app/models/newsletter-data';

export const getNewsletterListAction = createAction('[Newsletter Actions] GET NEWSLETTER LIST');
export const getNewsletterListFailuireAction = createAction(
    '[Newsletter Actions] GET NEWSLETTER LIST FAILURE'
);
export const getNewsletterListSuccessAction = createAction(
    '[Newsletter Actions] GET NEWSLETTER LIST SUCCESS',
    props<NewsletterData>()
);
