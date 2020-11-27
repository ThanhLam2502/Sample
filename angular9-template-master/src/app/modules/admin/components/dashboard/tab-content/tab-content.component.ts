import { Component, Input, OnInit, ViewChild } from '@angular/core';
import { PmService } from '@app/modules/auth/services/pm.service';
import { ListTaskViewModel, ListTodoViewModel, ProjectViewModel, TaskViewModel, TodoViewModel } from '@app/modules/core/models/project';
import { DxPopupComponent, DxValidationGroupComponent } from 'devextreme-angular';
import notify from 'devextreme/ui/notify';
import { ConfirmBoxComponent } from './confirm-box/confirm-box.component';

@Component({
  selector: 'app-tab-content',
  templateUrl: './tab-content.component.html',
  styleUrls: ['./tab-content.component.scss']
})
export class TabContentComponent implements OnInit {
  @Input() project: ProjectViewModel;

  @ViewChild('popupTask') popupTask: DxPopupComponent;
  @ViewChild('validationGroup', { static: false }) validationGroup: DxValidationGroupComponent;
  @ViewChild('confirmBox', { static: false }) confirmBox: ConfirmBoxComponent;

  //#region variable
  taskItem: TaskViewModel;
  selectModel: ListTodoViewModel | TodoViewModel;

  isEdit: boolean = false;
  isVisibleTaskMenu: boolean = false;

  selectStatus: number[];
  statusTask: object =
    [
      { id: 0, text: 'Not Started' },
      { id: 1, text: 'In Progress' },
      { id: 2, text: 'Completed' },
      { id: 3, text: 'Closed' },
    ];
  //#endregion

  constructor(
    private pmServive: PmService,
  ) { }

  ngOnInit() { }

  //#region responsive
  showTaskMenu(e): void {
    this.isVisibleTaskMenu = !this.isVisibleTaskMenu;
  }
  // @HostListener('window:resize', ['$event'])
  // onResize(event) {
  //   if (event.target.outerWidth < 992) {
  //     this.popupTask.fullScreen = true;
  //   } else {
  //     this.popupTask.fullScreen = false;
  //   }
  // }
  //#endregion

  //#region event drag & drop task
  onTaskDragStart(e) {
    e.itemData = e.fromData.task[e.fromIndex];
  }

  onTaskDrop(e) {
    e.fromData.task.splice(e.fromIndex, 1);
    e.toData.task.splice(e.toIndex, 0, e.itemData);
    if (e.fromData.id !== e.toData.id) {
      this.taskItem = e.itemData;
      this.taskItem.listTaskId = e.toData.id;
      this.editTask(this.taskItem);
    }
  }
  //#endregion

  //#region form add || edit task
  submitTask() {
    if (!this.validationGroup.instance.validate().isValid) {
      return false;
    }
    this.taskItem.status = this.selectStatus[0];
    if (this.isEdit) {
      this.editTask(this.taskItem);
    } else {
      this.addTask(this.taskItem);
    }
  }

  onClickEditTask(task: TaskViewModel) {
    this.isEdit = true;
    this.selectStatus = [task.status];
    this.taskItem = task;
    this.popupTask.instance.show();
  }
  editTask(task: TaskViewModel): void {
    this.pmServive.editTask(task).subscribe(
      () => {
        // task.statusTaskString = this.statusTask[this.selectStatus[0]].text;
        task.statusTaskString = this.statusTask[task.status].text;
        this.popupTask.instance.hide();
      }
    );
  }

  onClickAddTask(ltTaskId: number) {
    this.isEdit = false;
    this.taskItem = new TaskViewModel({
      listTaskId: ltTaskId,
      todos: [],
    });
    this.selectStatus = [0];
    this.popupTask.instance.show();
  }
  addTask(task: TaskViewModel): void {
    this.pmServive.addTask(task).subscribe(
      item => {
        task.id = item.data;
        task.statusTaskString = this.statusTask[task.status].text;
        this.project.tasks.find(lt => lt.id === task.listTaskId).task.push(task);

        this.popupTask.instance.hide();
        this.notification(item.message, 'success', 3000);
      }
    );
  }
  //#endregion

  //#region edit
  onClickEditNameLstTask(lsTask, inputEditLstTask): void {
    lsTask.isEditing = true;
    setTimeout(() => {
      inputEditLstTask.focus();
    }, 100);
  }
  editNameLstTask(e, lsTask): void {
    if (e.target.value === '' || lsTask.name === e.target.value)
      return;
    lsTask.name = e.target.value;
    this.pmServive.editLstTask(lsTask).subscribe(
      () => {
        lsTask.isEditing = false;
      }
    );
  }

  onClickEditLstTodo(e, lsTodo, inputElement): void {
    e.stopPropagation();
    lsTodo.isEditing = true;
    setTimeout(() => {
      inputElement.focus();
    }, 100);
  }
  editLstTodoName(e, lsTodo): void {
    if (e.target.value === '' || lsTodo.name === e.target.value) {
      return;
    }
    lsTodo.name = e.target.value;
    this.pmServive.editLstTodo(lsTodo).subscribe(
      () => {
        lsTodo.isEditing = false;
      }
    );
  }

  editTodoComplete(e, todo): void {
    todo.isComplete = e.target.checked;
    this.pmServive.editTodo(todo).subscribe(
      () => {
        this.setPercent(todo.listTodoId);
      }
    );
  }

  editTodoName(e, todo): void {
    if (e.target.value === '') {
      return;
    }
    todo.name = e.target.value;
    this.pmServive.editTodo(todo).subscribe(
      () => {
        this.setPercent(todo.listTodoId);
        todo.isEditing = false;
      }
    );
  }

  onCLickEditTodo(inputElement, todo): void {
    todo.isEditing = true;
    setTimeout(() => {
      inputElement.focus();
    }, 100);
  }
  //#endregion

  //#region delete
  onClickDelLstTodo(e, lsTodo: ListTodoViewModel) {
    e.stopPropagation();
    this.selectModel = new ListTodoViewModel(lsTodo);
    this.confirmBox.show(e.currentTarget);
  }
  onClickDelTodo(e, todo: TodoViewModel) {
    this.selectModel = new TodoViewModel(todo);
    this.confirmBox.show(e.currentTarget);
  }

  onClickConfirm(e) {
    if (e === false)
      return;
    const nameClass = this.selectModel.constructor.name;console.log(nameClass);
    if (nameClass === 'ListTodoViewModel'){
      this.deleteLstTodo(<ListTodoViewModel>this.selectModel);
    }
    if (nameClass === 'TodoViewModel'){
      this.deleteTodo(<TodoViewModel>this.selectModel);
    }
    this.confirmBox.hide();
  }

  deleteLstTodo(lsTodo: ListTodoViewModel) {
    this.pmServive.delLstTodo(lsTodo.id).subscribe(
      item => {
        this.taskItem.todos = this.taskItem.todos.filter(x => x.id !== item.data);
        this.notification(item.message, 'success', 3000);
      }
    );
  }
  deleteTodo(todo: TodoViewModel) {
    this.pmServive.delTodo(todo.id).subscribe(
      item => {
        const lsTodo: ListTodoViewModel = this.taskItem.todos.find(t => t.id === todo.listTodoId);
        lsTodo.todo = lsTodo.todo.filter(x => x.id !== item.data);
        this.setPercent(lsTodo.id);
        this.notification(item.message, 'success', 3000);
      }
    );
  }
  //#endregion

  //#region add
  addLstTask(inputAddLstTask) {
    const lsTask = new ListTaskViewModel({
      name: inputAddLstTask.value,
      projectId: this.project.id,
      task: [],
    });
    this.pmServive.addLstTask(lsTask).subscribe(
      item => {
        lsTask.id = item.data;
        this.project.tasks.push(lsTask);

        inputAddLstTask.value = '';
        this.notification(item.message, 'success', 3000);
      }
    );
  }

  addLstTodo(inputAddLstTodo): void {
    const lsTodo = new ListTodoViewModel({
      name: inputAddLstTodo.value,
      taskId: this.taskItem.id,
      percent: 0,
      todo: [],
    });
    this.pmServive.addLstTodo(lsTodo).subscribe(
      item => {
        lsTodo.id = item.data;
        this.taskItem.todos.push(lsTodo);
        inputAddLstTodo.value = '';
      }
    );
  }

  addTodo(e, lstTodoId: number): void {
    const todo = new TodoViewModel({
      name: e.target.value,
      isComplete: false,
      listTodoId: lstTodoId,
    });

    this.pmServive.addTodo(todo).subscribe(
      item => {
        todo.id = item.data;
        this.taskItem.todos.find(t => t.id === lstTodoId).todo.push(todo);
        e.target.value = '';
      }
    );
  }
  //#endregion

  //#region private funtion
  private setPercent(listTodoId: number): void {
    const lsTodo = this.taskItem.todos.find(x => x.id === listTodoId); // type listTodoViewModel
    if(lsTodo.todo.length !== 0)
      lsTodo.percent = lsTodo.todo.filter(x => x.isComplete === true).length * 100 / lsTodo.todo.length;
    else
      lsTodo.percent = 0;
  }

  private notification(mess: string, type: string, time: number): void {
    notify({
      message: mess,
      position: {
        my: 'center bottom',
        at: 'center bottom'
      }
    }, type, time);
  }
  //#endregion
}
