import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { CounselorData } from '../models/counselor-data';
import { environment } from 'src/environments/environment';

@Injectable({
    providedIn: 'root'
})
export class CounselorService {
    private baseUrl = environment.currentBaseUrl + '/counselor';

    constructor(private http: HttpClient) { }

    public getCounselorList(): Observable<CounselorData> {
        return this.http.get(this.baseUrl) as Observable<CounselorData>;
    }
}
