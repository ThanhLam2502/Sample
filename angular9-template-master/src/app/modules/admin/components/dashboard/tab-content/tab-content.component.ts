import { Component, HostListener, Input, OnInit, Output, ViewChild, EventEmitter, ElementRef, ChangeDetectorRef } from '@angular/core';
import { PmService } from '@app/modules/auth/services/pm.service';
import { ListTaskViewModel, ProjectViewModel, TaskViewModel } from '@app/modules/core/models/project';
import { DxTextBoxComponent, DxValidationGroupComponent } from 'devextreme-angular';

@Component({
  selector: 'app-tab-content',
  templateUrl: './tab-content.component.html',
  styleUrls: ['./tab-content.component.scss']
})
export class TabContentComponent implements OnInit {
  @ViewChild('nameInput') nameInput: ElementRef;
  @ViewChild('inputTodo') inputTodo: ElementRef;
  @ViewChild('addLstInput', { static: false }) addLstInput: DxTextBoxComponent;
  @ViewChild('validationGroup', { static: false }) validationGroup: DxValidationGroupComponent;

  @Input() project: ProjectViewModel;
  @Output() onSaved = new EventEmitter<void>();

  task: TaskViewModel;
  lstTask: ListTaskViewModel;

  isEdit: boolean = false;
  isFullScreen: boolean = false;
  isHidenTextBox: boolean = true;

  popupTaskVisible: boolean = false;
  popoverStatusVisible: boolean = false;
  popoverTodoVisible: boolean = false;

  selectStatus: number[];
  statusTask =
    [
      { id: 0, text: 'Not Started' },
      { id: 1, text: 'In Progress' },
      { id: 2, text: 'Completed' },
      { id: 3, text: 'Closed' },
    ];

  constructor(
    private cdRef: ChangeDetectorRef,
    private pmServive: PmService,
  ) { }

  ngOnInit() {
  }

  @HostListener('window:resize', ['$event'])
  onResize(event) {
    if (event.target.outerWidth < 992) {
      this.isFullScreen = true;
    } else {
      this.isFullScreen = false;
    }
  }

  // onListReorder(e) {
  //   console.log(e);
  //   const list = this.project.tasks.splice(e.fromIndex, 1)[0];
  //   console.log(list);
  //   this.project.tasks.splice(e.toIndex, 0, list);

  //   // const status = this.statuses.splice(e.fromIndex, 1)[0];
  //   // this.statuses.splice(e.toIndex, 0, status);
  // }

  onTaskDragStart(e) {
    e.itemData = e.fromData.task[e.fromIndex];
  }

  onTaskDrop(e) {
    e.fromData.task.splice(e.fromIndex, 1);
    e.toData.task.splice(e.toIndex, 0, e.itemData);

    if (e.fromData.name !== e.toData.name) {
      this.task = e.itemData;
      this.task.listTaskId = e.toData.id;
      this.editTask(this.task);
    }
  }

  onClickAddList(e) {
    this.isHidenTextBox = false;
  }
  onSave(e) {
    e.stopPropagation();
    this.isHidenTextBox = true;

    this.lstTask = new ListTaskViewModel();
    this.lstTask.name = this.addLstInput.value;
    this.lstTask.projectId = this.project.id;

    this.pmServive.addListTask(this.lstTask).subscribe(
      _ => {
        this.addLstInput.value = '';
        this.onSaved.emit();
      }
    );
  }

  onClickEditLstTaskName(listTaskEdit: ListTaskViewModel): void {
    this.lstTask = listTaskEdit;
    this.cdRef.detectChanges();
    this.nameInput.nativeElement.focus();
  }
  onBlurEditLstTask(e): void {
    if (this.lstTask.name === this.nameInput.nativeElement.value) {
      delete this.lstTask;
      return;
    }
    this.lstTask.name = this.nameInput.nativeElement.value;
    this.pmServive.editListTask(this.lstTask).subscribe(
      _ => { delete this.lstTask; }
    );
  }


  onClickEditTask(task: TaskViewModel) {
    this.isEdit = true;

    this.task = task;
    this.selectStatus = [task.status];

    this.popupTaskVisible = true;
  }

  onClickAddTask(listTasks: ListTaskViewModel) {
    this.isEdit = false;

    this.task = new TaskViewModel();
    this.task.listTaskId = listTasks.id;
    this.selectStatus = [0];

    this.popupTaskVisible = true;
  }

  submitTask(e) {
    if (!this.validationGroup.instance.validate().isValid) {
      return false;
    }
    this.task.status = this.selectStatus[0];
    if (this.isEdit) {
      this.editTask(this.task);
    } else {
      this.addTask(this.task);
    }
  }

  addTask(task: TaskViewModel): void {
    this.pmServive.addTask(task).subscribe(
      _ => {
        this.popupTaskVisible = false;
        this.onSaved.emit();
      }
    );
  }
  editTask(task: TaskViewModel): void {
    this.pmServive.editTask(task).subscribe(
      _ => {
        this.popupTaskVisible = false;
        task.statusTaskString = this.statusTask[this.selectStatus[0]].text;
      }
    );
  }

  onSubmitTodo(inputValue: string): void {
    this.popoverTodoVisible = false;
    console.log(inputValue);
    this.inputTodo.nativeElement.value = '';
  }
}
