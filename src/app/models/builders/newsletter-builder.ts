import { Random } from 'random-test-values';
import { Newsletter } from '../newsletter';

export function newsletterBuilder(testData?: {
    description?: string,
    quarter?: number,
    title?: string,
    year?: number
}): Newsletter {

    testData = testData || {};

    return {
        description: testData.description || Random.String(),
        quarter: testData.quarter || Random.Number({max: 4, min: 1}),
        title: testData.title || Random.String(),
        year: testData.year || Random.Number()
    } as Newsletter;
}
