import { Component, ElementRef, EventEmitter, Input, OnInit, Output, ViewChild } from '@angular/core';
import { DxPopoverComponent } from 'devextreme-angular';

@Component({
  selector: 'app-task-menu',
  templateUrl: './task-menu.component.html',
  styleUrls: ['./task-menu.component.scss']
})
export class TaskMenuComponent implements OnInit {
  private _selectStatus: number[];

  @Output() selectStatusChange = new EventEmitter<number[]>();
  @Output() onSubmitedTask: EventEmitter<any> = new EventEmitter<any>();
  @Output() addLstTodoTask: EventEmitter<ElementRef> = new EventEmitter<ElementRef>();

  @Input() statusTask: object;
  @Input() isEdit: boolean;

  @Input()
  get selectStatus(): number[] {
    return this._selectStatus;
  }

  set selectStatus(value: number[]) {
    this._selectStatus = value;
    this.selectStatusChange.emit(value);
  }

  @ViewChild('popoverTodo', { static: true }) popoverTodo: DxPopoverComponent;
  @ViewChild('popoverStatus', { static: true }) popoverStatus: DxPopoverComponent;

  constructor() { }

  ngOnInit() {
  }

  submitTask(): void {
    this.onSubmitedTask.emit();
  }

  addLstTodo(inputAddLstTodo: ElementRef): void {
    this.popoverTodo.instance.hide();
    this.addLstTodoTask.emit(inputAddLstTodo);
  }

  showPopoverTodo(e) {
    this.popoverTodo.visible = !this.popoverTodo.visible;
    if (this.popoverTodo.visible) {
      this.popoverTodo.instance.show(e.toElement);
    }
  }
  showPopoverStatus(e) {
    this.popoverStatus.visible = !this.popoverStatus.visible;
    if (this.popoverStatus.visible) {
      this.popoverStatus.instance.show(e.toElement);
    }
  }
}
