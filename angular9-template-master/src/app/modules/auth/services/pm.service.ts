import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Project, Task } from '@app/modules/core/models/project';
import { User } from '@app/modules/core/models/user';
import { ApiService } from '@app/modules/core/services';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class PmService {

  projectUrl = 'api/projects';
  usertUrl = 'api/users';
  taskUrl = 'api/tasks';

  constructor(
    private apiService: ApiService,
    private httpClient: HttpClient,
  ) { }

  getProjects(): Observable<Project[]> {
    return this.apiService.get(this.projectUrl);
  }

  addProject(project: Project): Observable<Project> {
    return this.apiService.post(this.projectUrl, project);
  }

  updateProject(project: Project): Observable<Project> {
    return this.apiService.update(this.projectUrl, project);
  }

  deleteProject(id: number): Observable<Project> {
    const url = `${this.projectUrl}/${id}`;
    return this.apiService.delete(url);
  }

  getUsers(): Observable<User[]> {
    return this.apiService.get(this.usertUrl);
  }

  editTask(task: Task, listTaskId: number): Observable<Task> {
    console.log(task);
    return this.apiService.update(this.taskUrl, task);
  }
}
