import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
// tslint:disable-next-line: max-line-length
import { BaseResponse, ListTaskViewModel, ListTodoViewModel, ProjectViewModel, TaskViewModel, TodoViewModel } from '@app/modules/core/models/project';
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
  todoUrl = 'api/todos';

  constructor(
    private apiService: ApiService,
  ) { }

  getProjects(): Observable<BaseResponse<ProjectViewModel[]>> {
    return this.apiService.get(this.projectUrl);
  }

  addProject(project: ProjectViewModel): Observable<BaseResponse<number>> {
    return this.apiService.post(this.projectUrl, project);
  }


  updateProject(project: ProjectViewModel): Observable<BaseResponse<number>> {
    return this.apiService.update(this.projectUrl, project);
  }

  deleteProject(id: number): Observable<BaseResponse<number>> {
    const url = `${this.projectUrl}/${id}`;
    return this.apiService.delete(url);
  }


  getUsers(): Observable<UserViewModel[]> {
    return this.apiService.get(this.usertUrl);
  }


  addTask(task: TaskViewModel): Observable<BaseResponse<number>> {
    const url = `${this.taskUrl}/task`;
    return this.apiService.post(url, task);
  }

  editTask(task: TaskViewModel): Observable<BaseResponse<number>> {
    const url = `${this.taskUrl}/task/${task.id}`;
    return this.apiService.update(url, task);
  }


  addLstTask(listTask: ListTaskViewModel): Observable<BaseResponse<number>> {
    return this.apiService.post(this.taskUrl, listTask);
  }

  editLstTask(listTask: ListTaskViewModel): Observable<BaseResponse<number>> {
    const url = `${this.taskUrl}/${listTask.id}`;
    return this.apiService.update(url, listTask);
  }


  addLstTodo(listTodo: ListTodoViewModel): Observable<BaseResponse<number>> {
    return this.apiService.post(this.todoUrl, listTodo);
  }

  editLstTodo(listTodo: ListTodoViewModel): Observable<BaseResponse<number>> {
    const url = `${this.todoUrl}/${listTodo.id}`;
    return this.apiService.update(url, listTodo);
  }

  delLstTodo(id: number): Observable<BaseResponse<number>> {
    const url = `${this.todoUrl}/${id}`;
    return this.apiService.delete(url);
  }


  addTodo(todo: TodoViewModel): Observable<BaseResponse<number>> {
    const url = `${this.todoUrl}/todo`;
    return this.apiService.post(url, todo);
  }

  editTodo(todo: TodoViewModel): Observable<BaseResponse<number>> {
    const url = `${this.todoUrl}/todo/${todo.id}`;
    return this.apiService.update(url, todo);
  }
  delTodo(id: number): Observable<BaseResponse<number>> {
    const url = `${this.todoUrl}/todo/${id}`;
    return this.apiService.delete(url);
  }
}
