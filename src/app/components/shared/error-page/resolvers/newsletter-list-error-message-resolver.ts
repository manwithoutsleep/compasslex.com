import { StoreStatus } from './store-status';

export class NewsletterListStoreStatus extends StoreStatus {
    static readonly LOADING_NEWSLETTER_LIST = '<NewsletterListStatus> LOADING_NEWSLETTER_LIST';
    static readonly NO_NEWSLETTERS_RETURNED_FROM_SERVER =
        '<NewsletterListStatus> NO_NEWSLETTERS_RETURNED_FROM_SERVER';
}

export function newsletterListErrorMessageResolver(messageType: NewsletterListStoreStatus): string {
    switch (messageType) {
        case NewsletterListStoreStatus.LOADING_NEWSLETTER_LIST:
            return 'Loading Newsletters';
        case NewsletterListStoreStatus.NO_NEWSLETTERS_RETURNED_FROM_SERVER:
            return 'No newsletters found<br /><a href="/">Return to home page</a>';
        case NewsletterListStoreStatus.NO_ERROR:
        default:
            return '';
    }
}
