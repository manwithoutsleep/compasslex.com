import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { CounselorData } from '../models/counselor-data';

@Injectable({
    providedIn: 'root',
})
export class CounselorService {
    private baseUrl = '../assets/data/counselor.json';

    constructor(private http: HttpClient) {}

    public getCounselorList(): Observable<CounselorData> {
        return this.http.get<CounselorData>(this.baseUrl);
    }
}
