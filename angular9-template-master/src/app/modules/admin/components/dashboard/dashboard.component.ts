import { ViewChild } from '@angular/core';
import { Component, OnInit } from '@angular/core';
import { MatTabGroup } from '@angular/material/tabs';
import { PmService } from '@app/modules/auth/services/pm.service';
import { ProjectViewModel } from '@app/modules/core/models/project';
import { UserViewModel } from '@app/modules/core/models/user';
import { DxFormComponent } from 'devextreme-angular/ui/form';
import notify from 'devextreme/ui/notify';


@Component({
  selector: 'app-md-dashboard',
  templateUrl: 'dashboard.component.html',
  styleUrls: ['./dashboard.component.scss']
})

export class DashboardComponent implements OnInit {
  project: ProjectViewModel = new ProjectViewModel();

  users: UserViewModel[] = [];
  projects: ProjectViewModel[] = [];
  tabIndex: number = 2;

  popupDropdownVisible: boolean;
  popupProjectsVisible: boolean;
  popupAddVisible: boolean;
  isCollapsed: boolean;

  isVissibleDropDown: boolean = false;

  lookupData =
    [
      { id: 0, name: 'Open' },
      { id: 1, name: 'Closed' },
    ];

  buttonOptions: any =
    {
      text: 'Submit',
      stylingMode: 'outlined',
      type: 'success',
      width: 120,
      useSubmitBehavior: 'true',
    };

  @ViewChild(DxFormComponent) form: DxFormComponent;
  @ViewChild('navTab', { static: false }) tab: MatTabGroup;

  constructor(
    private pmServive: PmService,
  ) { }


  ngOnInit() {
    this.getUsers();
    this.getProjects();
    this.loadPage();
  }

  loadPage(): void {
    this.popupDropdownVisible = false;
    this.popupProjectsVisible = false;
    this.popupAddVisible = false;
    this.isCollapsed = false;

  }

  getProjects(): void {
    this.pmServive.getProjects().subscribe(
      item => this.projects = item);
  }

  getUsers(): void {
    this.pmServive.getUsers()
      .subscribe(item => this.users = item);
  }

  callFunction() {
    this.isVissibleDropDown = true;
  }
  dblSelectTabs(e) {
    this.tabIndex = e.rowIndex;
    this.popupDropdownVisible = false;
    this.popupProjectsVisible = false;
  }

  selectDropdownProjectItem(index) {
    this.tabIndex = index;
    this.popupDropdownVisible = false;
  }

  upinClick(e, index) {
    console.log(e);
    console.log(index);
    // this.tabIndex = index;
    e.stopPropagation();
  }

  dropdownListProject(e) {
    this.popupDropdownVisible = !this.popupDropdownVisible;
    e.stopPropagation();
  }

  showAllProject() {
    this.popupProjectsVisible = true;
  }

  addProjectBtn() {
    this.popupAddVisible = true;
  }

  onFormSubmit(e) {
    this.addProject(this.project);
    e.preventDefault();
  }

  addProject(project: ProjectViewModel): void {
    this.pmServive.addProject(project).subscribe(
      _ => {
        this.getProjects();
        this.popupAddVisible = false;
        this.popupDropdownVisible = false;
        // this.notification('You have successfully added', 'success', 3000);
      }
    );
  }

  notification(mess: string, type: string, time: number): void {
    notify({
      message: mess,
      position: {
        my: 'center top',
        at: 'center top'
      }
    }, type, time);
  }


  removeProject(e) {
    this.deleteProject(e.data.id as number);
    console.log(e);
  }
  deleteProject(id: number): void {
    this.pmServive.deleteProject(id).subscribe(
      _ => {
        this.getProjects();
        // this.notification('You have successfully deleted', 'success', 3000);
        this.popupDropdownVisible = false;
      }
    );
  }


  editProject(e) {
    this.project = { ...e.oldData, ...e.newData };
    this.updateProject(this.project);
  }
  updateProject(project: ProjectViewModel): void {
    this.pmServive.updateProject(project).subscribe(
      _ => {
        this.popupDropdownVisible = false;
        this.notification('You have successfully update', 'success', 3000);
      }
    );
  }

}

