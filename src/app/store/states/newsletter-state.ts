import { Newsletter } from 'src/app/models/newsletter';

export interface NewsletterState {
    newsletterList: readonly Newsletter[];
    isLoaded: boolean;
}

export function createNewsletterState(newsletterList: readonly Newsletter[], isLoaded: boolean): NewsletterState {
    return {
        newsletterList,
        isLoaded
    };
}
