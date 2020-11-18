export interface Project {
  id: number;
  name: string;
  startDate: Date;
  endDate: Date;
  status: number;
  statusProjectString: string;
  assignTo: number;
  tasks: ListTasks[];
}

export interface ListTasks {
  id: number;
  name: string;
  projectId: number;
  task: Task[];
}

export interface Task {
  id: number;
  name: string;
  description: string;
  attachFiles: string;
  status: number;
  statusTaskString: string;
  listTaskId: number;
}

