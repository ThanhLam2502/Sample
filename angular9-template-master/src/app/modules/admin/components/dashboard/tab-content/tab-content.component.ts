import { Component, HostListener, Input, OnInit, ViewChild } from '@angular/core';
import { PmService } from '@app/modules/auth/services/pm.service';
import { ListTasks, Project, Task } from '@app/modules/core/models/project';
import { DxValidationGroupComponent } from 'devextreme-angular';

@Component({
  selector: 'app-tab-content',
  templateUrl: './tab-content.component.html',
  styleUrls: ['./tab-content.component.scss']
})
export class TabContentComponent implements OnInit {
  @ViewChild('validationGroup', { static: false }) validationGroup: DxValidationGroupComponent;
  @Input() project: Project;
  task: Task = {} as Task;
  isFullScreen: boolean = false;
  popupAddTaskVisible: boolean = false;
  popupStatusVisible: boolean = false;

  selectStatus = [];
  statusTask =
    [
      { id: 0, text: 'Not Started' },
      { id: 1, text: 'In Progress' },
      { id: 2, text: 'Completed' },
      { id: 3, text: 'Closed' },
    ];

  constructor(
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

  onListReorder(e) {
    console.log(e);
    const list = this.project.tasks.splice(e.fromIndex, 1)[0];
    console.log(list);
    this.project.tasks.splice(e.toIndex, 0, list);

    // const status = this.statuses.splice(e.fromIndex, 1)[0];
    // this.statuses.splice(e.toIndex, 0, status);
  }

  onTaskDragStart(e) {
    e.itemData = e.fromData.task[e.fromIndex];
  }

  onTaskDrop(e) {
    e.fromData.task.splice(e.fromIndex, 1);
    e.toData.task.splice(e.toIndex, 0, e.itemData);
    // if (e.fromData.name !== e.toData.name) {
    //   this.pmServive.editTask(e.itemData, e.toData.id);
    // }
    // console.log(e);
    // console.log(this.project.tasks);
  }
  showPopupAddVisisble(listTasks: ListTasks) {
    console.log(listTasks);
    this.task.listTaskId = listTasks.id;
    this.popupAddTaskVisible = true;
  }

  addTask(e) {
    this.task.status = this.selectStatus.length === 0 ? 0 : this.selectStatus[0].id;
    if (!this.validationGroup.instance.validate().isValid) {
      return false;
    }
    console.log(this.task);
    console.log(this.task.listTaskId);
    console.log(this.project.tasks);
    console.log(this.project.tasks.filter(x => x.id === 2)[0].task.push(this.task));
  }
}
