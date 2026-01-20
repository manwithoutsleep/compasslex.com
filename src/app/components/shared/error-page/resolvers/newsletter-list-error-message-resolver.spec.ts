import {
    newsletterListErrorMessageResolver,
    NewsletterListStoreStatus,
} from './newsletter-list-error-message-resolver';

describe('newsletterListErrorMessageResolver', () => {
    it('should return the appropriate error message when given NewsletterListStoreStatus.LOADING_NEWSLETTER_LIST', () => {
        const actual = newsletterListErrorMessageResolver(
            NewsletterListStoreStatus.LOADING_NEWSLETTER_LIST
        );
        expect(actual).toEqual('Loading Newsletters');
    });
    it('should return the appropriate error message when given NewsletterListStoreStatus.NO_NEWSLETTER_FOUND', () => {
        const actual = newsletterListErrorMessageResolver(
            NewsletterListStoreStatus.NO_NEWSLETTERS_RETURNED_FROM_SERVER
        );
        expect(actual).toEqual('No newsletters found<br /><a href="/">Return to home page</a>');
    });
    it('should return no error message when given NewsletterListStoreStatus.NO_ERROR', () => {
        const actual = newsletterListErrorMessageResolver(NewsletterListStoreStatus.NO_ERROR);
        expect(actual).toEqual('');
    });
});
