import { ComponentFixture, TestBed, waitForAsync } from '@angular/core/testing';
import { NavigationComponent } from './navigation.component';
import { of } from 'rxjs';
import { ActivatedRoute, provideRouter, RouterOutlet } from '@angular/router';
import { SharedFakeModule } from '../shared/shared.fake.module';
import { NoopAnimationsModule } from '@angular/platform-browser/animations';
import { GmapFakeComponent } from '../shared/gmap/gmap.fake.component';

describe('NavigationComponent', () => {
    let component: NavigationComponent;
    let fixture: ComponentFixture<NavigationComponent>;
    const mockActivatedRoute = { queryParams: of({}) };

    beforeEach(waitForAsync(() => {
        TestBed.configureTestingModule({
            declarations: [NavigationComponent, GmapFakeComponent],
            imports: [RouterOutlet, SharedFakeModule, NoopAnimationsModule],
            providers: [
                provideRouter([]),
                { provide: ActivatedRoute, useValue: mockActivatedRoute },
            ],
        }).compileComponents();

        fixture = TestBed.createComponent(NavigationComponent);
        component = fixture.componentInstance;
        fixture.detectChanges();
    }));

    it('should create', () => {
        expect(component).toBeTruthy();
    });
});
