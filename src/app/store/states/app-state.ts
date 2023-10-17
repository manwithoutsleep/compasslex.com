import { CounselorState } from "./counselor-state";
import { NewsletterState } from "./newsletter-state";

export interface AppState {
    allCounselors: CounselorState,
    allNewsletters: NewsletterState
}