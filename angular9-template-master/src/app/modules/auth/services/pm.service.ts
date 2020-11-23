import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { ListTaskViewModel, ProjectViewModel, TaskViewModel } from '@app/modules/core/models/project';
import { UserViewModel } from '@app/modules/core/models/user';
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
  ) { }

  getProjects(): Observable<ProjectViewModel[]> {
    return this.apiService.get(this.projectUrl);
  }

  addProject(project: ProjectViewModel): Observable<ProjectViewModel> {
    return this.apiService.post(this.projectUrl, project);
  }

  updateProject(project: ProjectViewModel): Observable<ProjectViewModel> {
    return this.apiService.update(this.projectUrl, project);
  }

  deleteProject(id: number): Observable<ProjectViewModel> {
    const url = `${this.projectUrl}/${id}`;
    return this.apiService.delete(url);
  }

  getUsers(): Observable<UserViewModel[]> {
    return this.apiService.get(this.usertUrl);
  }

  addTask(task: TaskViewModel): Observable<TaskViewModel> {
    const url = `${this.taskUrl}/task`;
    return this.apiService.post(url, task);
  }

  editTask(task: TaskViewModel): Observable<TaskViewModel> {
    const url = `${this.taskUrl}/task/${task.id}`;
    return this.apiService.update(url, task);
  }

  addListTask(listTask: ListTaskViewModel): Observable<ListTaskViewModel> {
    return this.apiService.post(this.taskUrl, listTask);
  }

  editListTask(listTask: ListTaskViewModel): Observable<ListTaskViewModel> {
    const url = `${this.taskUrl}/${listTask.id}`;
    return this.apiService.update(url, listTask);
  }

}
