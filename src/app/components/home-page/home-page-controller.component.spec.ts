import { ComponentFixture, TestBed } from '@angular/core/testing';
import { MockStore, provideMockStore } from '@ngrx/store/testing';
import { HomePageControllerComponent } from './home-page-controller.component';
import { createNewsletterState } from 'src/app/store/states/newsletter-state';
import { HomePageFakeComponent } from './home-page.fake.component';
import { SharedFakeModule } from '../shared/shared.fake.module';

describe('HomePageControllerComponent', () => {
    let component: HomePageControllerComponent;
    let fixture: ComponentFixture<HomePageControllerComponent>;
    let mockReduxStore: MockStore<{}>;

    const initialState = {
        counselors: createNewsletterState([], false),
    };

    beforeEach(() => {
        TestBed.configureTestingModule({
            declarations: [HomePageControllerComponent, HomePageFakeComponent],
            imports: [SharedFakeModule],
            providers: [provideMockStore({ initialState })],
        }).compileComponents();

        fixture = TestBed.createComponent(HomePageControllerComponent);
        component = fixture.componentInstance;
        mockReduxStore = TestBed.inject(MockStore);
    });

    it('should create', () => {
        expect(component).toBeTruthy();
    });
});
