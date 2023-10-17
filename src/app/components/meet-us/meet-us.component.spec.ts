import { ComponentFixture, TestBed, waitForAsync } from '@angular/core/testing';
import { MeetUsComponent } from './meet-us.component';

describe('MeetUsComponent', () => {
    let component: MeetUsComponent;
    let fixture: ComponentFixture<MeetUsComponent>;

    beforeEach(waitForAsync(() => {
        TestBed.configureTestingModule({
            declarations: [MeetUsComponent],
        }).compileComponents();
    }));

    beforeEach(() => {
        fixture = TestBed.createComponent(MeetUsComponent);
        component = fixture.componentInstance;
        fixture.detectChanges();
    });

    it('should create', () => {
        expect(component).toBeTruthy();
    });
});
