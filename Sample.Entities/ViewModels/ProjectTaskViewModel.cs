using System;
using System.ComponentModel;
using System.Collections.Generic;
using Sample.Entities.Utilities;

namespace Sample.Entities.ViewModels
{


    public class ProjectTaskViewModel
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public DateTime? StartDate { get; set; }
        public DateTime? EndDate { get; set; }
        public int? Status { get; set; }
        public string StatusProjectString => ((StatusProject)Status).GetDescription();
        public int? AssignTo { get; set; }
        public IEnumerable<ListTaskViewModel> Tasks { get; set; }
    }

    public class ListTaskViewModel
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public int? ProjectId { get; set; }
        public IEnumerable<TaskViewModel> Task { get; set; }
    }
    public class TaskViewModel
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string AttachFiles { get; set; }
        public int? Status { get; set; }
        public string StatusTaskString => ((StatusTask)Status).GetDescription();
        public int? ListTaskId { get; set; }
    }
}
