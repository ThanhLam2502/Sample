export class ProjectViewModel {
  id: number;
  name: string;
  startDate: Date;
  endDate: Date;
  status: number;
  statusProjectString: string;
  assignTo: number;
  tasks: Array<ListTaskViewModel>;
}

export class ListTaskViewModel {
  id: number;
  name: string;
  projectId: number;
  task: Array<TaskViewModel>;
}

export class TaskViewModel {
  id: number;
  name: string;
  description: string;
  attachFiles: string;
  status: number;
  statusTaskString: string;
  listTaskId: number;
}

