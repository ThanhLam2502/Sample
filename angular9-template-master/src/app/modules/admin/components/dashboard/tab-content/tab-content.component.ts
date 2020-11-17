import { AfterViewInit, Component, Input, OnInit } from '@angular/core';
import { PmService } from '@app/modules/auth/services/pm.service';
import { ListTasks, Project, Task } from '@app/modules/core/models/project';


@Component({
  selector: 'app-tab-content',
  templateUrl: './tab-content.component.html',
  styleUrls: ['./tab-content.component.scss']
})
export class TabContentComponent implements OnInit, AfterViewInit {
  @Input() project: Project;
  task: Task = {} as Task;
  isPopupAddTaskVisible: boolean = false;

  constructor(
    private pmServive: PmService,
  ) { }
  ngAfterViewInit(): void {
    const target: HTMLElement = document.getElementById('addTask');

  }

  ngOnInit() {
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

  addTask(e) {

  }
}
