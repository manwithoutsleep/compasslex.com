import { newsletterBuilder } from 'src/app/models/builders/newsletter-builder';
import { getNewsletterListSuccessAction } from '../actions/newsletter-actions';
import { NewsletterData } from 'src/app/models/newsletter-data';
import { initialNewsletterState, newsletterReducer } from './newsletter-reducer';

describe('newsletterReducer', () => {
    it('returns the given state if the action type is not in the list of actions', () => {
        const action = { type: 'Unknown' };
        const newState = newsletterReducer(initialNewsletterState, action);
        expect(newState).toBe(initialNewsletterState);
    });

    it('returns the default state if the action type is not in the list of actions and the initial state is undefined', () => {
        const action = { type: 'Unknown' };
        const newState = newsletterReducer(undefined, action);

        expect(newState).toBe(initialNewsletterState);
        expect(newState.isLoaded).toBe(false);
    });

    it('should replace the Newsletter state when the getNewsletterListSuccessAction is fired', () => {
        const expectedNewsletterState = { newsletterList: [
            newsletterBuilder(),
            newsletterBuilder(),
            newsletterBuilder()
        ] } as NewsletterData;

        const action = getNewsletterListSuccessAction(expectedNewsletterState);

        const newState = newsletterReducer(initialNewsletterState, action);

        expect(newState).not.toBe(initialNewsletterState);
        expect(newState.newsletterList).toEqual(expectedNewsletterState.newsletterList);
        expect(newState.isLoaded).toBeTrue();
    });
});
