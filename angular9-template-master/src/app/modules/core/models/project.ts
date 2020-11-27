
export class BaseResponse<T> {
  data: T;
  message: string;
  statusCode: number;
}

export class ProjectViewModel {
  id: number;
  name: string;
  startDate: Date;
  endDate: Date;
  status: number;
  statusProjectString: string;
  assignTo: number;
  tasks: ListTaskViewModel[];

  constructor(init?: Partial<ProjectViewModel>) {
    Object.assign(this, init);
  }
}

export class ListTaskViewModel {
  id: number;
  name: string;
  projectId: number;
  isEditing: boolean = false; // dang edit
  task: TaskViewModel[];

  constructor(init?: Partial<ListTaskViewModel>) {
    Object.assign(this, init);
  }
}

export class TaskViewModel {
  id: number;
  name: string;
  description: string;
  attachFiles: string;
  status: number;
  statusTaskString: string;
  listTaskId: number;
  todos: ListTodoViewModel[];

  constructor(init?: Partial<TaskViewModel>) {
    Object.assign(this, init);
  }
}

export class ListTodoViewModel {
  id: number;
  name: string;
  percent: number;
  isCollapsed: boolean = false; // showCollapsed todo[]
  isEditing: boolean = false; // dang edit
  taskId: number;
  todo: TodoViewModel[];

  constructor(init?: Partial<ListTodoViewModel>) {
    Object.assign(this, init);
  }
}

export class TodoViewModel {
  id: number;
  name: string;
  isComplete: boolean;
  isEditing: boolean = false; // dang edit
  listTodoId: number;

  constructor(init?: Partial<TodoViewModel>) {
    Object.assign(this, init);
  }
}
