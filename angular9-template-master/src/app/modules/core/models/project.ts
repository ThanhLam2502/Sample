export interface Project {
  id: number;
  name: string;
  startDate: Date;
  endDate: Date;
  status: number;
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
  listTaskId: number;
}

