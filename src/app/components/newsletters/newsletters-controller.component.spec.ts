import { ComponentFixture, TestBed } from '@angular/core/testing';
import { MockStore, provideMockStore } from '@ngrx/store/testing';
import { createNewsletterState } from 'src/app/store/states/newsletter-state';
import { SharedFakeModule } from '../shared/shared.fake.module';
import { NewslettersControllerComponent } from './newsletters-controller.component';
import { NewslettersFakeComponent } from './newsletters.fake.component';

describe('NewsletterControllerComponent', () => {
    let component: NewslettersControllerComponent;
    let fixture: ComponentFixture<NewslettersControllerComponent>;
    let mockReduxStore: MockStore<{}>;

    const initialState = {
        counselors: createNewsletterState([], false),
    };

    beforeEach(() => {
        TestBed.configureTestingModule({
            declarations: [NewslettersControllerComponent, NewslettersFakeComponent],
            imports: [SharedFakeModule],
            providers: [provideMockStore({ initialState })],
        }).compileComponents();

        fixture = TestBed.createComponent(NewslettersControllerComponent);
        component = fixture.componentInstance;
        mockReduxStore = TestBed.inject(MockStore);
    });

    it('should create', () => {
        expect(component).toBeTruthy();
    });
});
