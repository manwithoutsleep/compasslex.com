import { ComponentFixture, TestBed, waitForAsync } from '@angular/core/testing';
import { CounselorComponent } from './counselor.component';
import { counselorBuilder } from 'src/app/models/builders/counselor-builder';
import { Random } from 'random-test-values';

describe('CounselorComponent', () => {
    let component: CounselorComponent;
    let fixture: ComponentFixture<CounselorComponent>;

    beforeEach(waitForAsync(() => {
      TestBed.configureTestingModule({
        declarations: [ CounselorComponent ]
      })
      .compileComponents();
    }));

    beforeEach(() => {
      fixture = TestBed.createComponent(CounselorComponent);
      component = fixture.componentInstance;
      fixture.detectChanges();
    });

    it('should create', () => {
      expect(component).toBeTruthy();
    });

    describe('getCounselorName', () => {
        it('should return the first and last name', () => {
            component.counselor = counselorBuilder();

            const expected = component.counselor.firstname + ' ' + component.counselor.lastname;
            const actual = component.getCounselorName();

            expect(actual).toEqual(expected);
        });

        it('should return empty string when the counselor is undefined', () => {
            component.counselor = undefined;

            const expected = '';
            const actual = component.getCounselorName();

            expect(actual).toEqual(expected);
        });

        it('should append Clinical Director when the counselor name is Linda Fentress', () => {
            component.counselor = counselorBuilder( {
                firstname: 'Linda',
                lastname: 'Fentress'
            });

            const expected = 'Linda Fentress, Clinical Director';
            const actual = component.getCounselorName();

            expect(actual).toEqual(expected);
        });
    });

    describe('getImageLink', () => {
        it('should return the correct link to the counselor image', () => {
            component.counselor = counselorBuilder({
                firstname: 'X' + Random.String(),
            });

            const expected =
                '/assets/site-images/' +
                component.counselor.firstname.toLowerCase() +
                '-read-more-221x276.jpg';

            const actual = component.getImageLink();
            expect(actual).toEqual(expected);
        });
    });

    describe('getFirstName', () => {
        it('should return the counselor first name', () => {
          component.counselor = counselorBuilder();
          const actual = component.getFirstName();
            expect(actual).toEqual(component.counselor.firstname);
        });
        it('should return an empty string when the counselor is null', () => {
            component.counselor = null;
            const actual = component.getFirstName();
            expect(actual).toEqual('');
        });
        it('should return an empty string when the counselor is undefined', () => {
            component.counselor = undefined;
            const actual = component.getFirstName();
            expect(actual).toEqual('');
        });
    });

    describe('getLastName', () => {
        it('should return the counselor last name', () => {
          component.counselor = counselorBuilder();
          const actual = component.getLastName();
            expect(actual).toEqual(component.counselor.lastname);
        });
        it('should return an empty string when the counselor is null', () => {
            component.counselor = null;
            const actual = component.getLastName();
            expect(actual).toEqual('');
        });
        it('should return an empty string when the counselor is undefined', () => {
            component.counselor = undefined;
            const actual = component.getLastName();
            expect(actual).toEqual('');
        });
    });

    describe('getLongDescription', () => {
        it('should return the counselor long description', () => {
            component.counselor = counselorBuilder();
            const actual = component.getLongDescription();
            expect(actual).toEqual(component.counselor.longdescription);
        });
        it('should return an empty string when the counselor is null', () => {
            component.counselor = null;
            const actual = component.getLongDescription();
            expect(actual).toEqual('');
        });
        it('should return an empty string when the counselor is undefined', () => {
            component.counselor = undefined;
            const actual = component.getLongDescription();
            expect(actual).toEqual('');
        });
    });

    describe('getEmail', () => {
        it('should return the counselor email', () => {
          component.counselor = counselorBuilder();
          const actual = component.getEmail();
            expect(actual).toEqual(component.counselor.email);
        });
        it('should return an empty string when the counselor is null', () => {
            component.counselor = null;
            const actual = component.getEmail();
            expect(actual).toEqual('');
        });
        it('should return an empty string when the counselor is undefined', () => {
            component.counselor = undefined;
            const actual = component.getEmail();
            expect(actual).toEqual('');
        });
    });

    describe('getAppointmentLink', () => {
        it('should return the counselor appointment link', () => {
            component.counselor = counselorBuilder();
            const actual = component.getAppointmentLink();
            expect(actual).toEqual(component.counselor.appointmentlink);
        });
        it('should return an empty string when the counselor is null', () => {
            component.counselor = null;
            const actual = component.getAppointmentLink();
            expect(actual).toEqual('');
        });
        it('should return an empty string when the counselor is undefined', () => {
            component.counselor = undefined;
            const actual = component.getAppointmentLink();
            expect(actual).toEqual('');
        });
    });

    describe('getDirectoryId', () => {
        it('should return the counselor directory id', () => {
            component.counselor = counselorBuilder();
            const actual = component.getDirectoryId();
            expect(actual).toEqual(component.counselor.directoryid);
        });
        it('should return an empty string when the counselor is null', () => {
            component.counselor = null;
            const actual = component.getDirectoryId();
            expect(actual).toEqual('');
        });
        it('should return an empty string when the counselor is undefined', () => {
            component.counselor = undefined;
            const actual = component.getDirectoryId();
            expect(actual).toEqual('');
        });
    });
});
