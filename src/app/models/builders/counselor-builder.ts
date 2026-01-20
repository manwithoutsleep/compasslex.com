import { Counselor } from '../counselor';
import { Random } from 'random-test-values';

export function counselorBuilder(testData?: {
    credentials?: string[];
    directoryid?: string;
    email?: string;
    firstname?: string;
    insurance?: string[];
    lastname?: string;
    longdescription?: string;
    memberships?: string[];
    phone?: string;
    practitionerid?: string;
    shortdescription?: string;
    titles?: string;
}): Counselor {
    testData = testData || {};

    return {
        credentials: testData.credentials || [Random.String(), Random.String()],
        directoryid: testData.directoryid || Random.String(),
        email: testData.email || Random.String(),
        firstname: testData.firstname || Random.String(),
        insurance: testData.insurance || [Random.String(), Random.String()],
        lastname: testData.lastname || Random.String(),
        longdescription: testData.longdescription || Random.String(),
        memberships: testData.memberships || [Random.String(), Random.String()],
        phone: testData.phone || Random.String(),
        practitionerid: testData.practitionerid || Random.String(),
        shortdescription: testData.shortdescription || Random.String(),
        titles: testData.titles || Random.String(),
    } as Counselor;
}
