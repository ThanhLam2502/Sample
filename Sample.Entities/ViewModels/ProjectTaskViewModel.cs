using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace Sample.Entities.ViewModels
{
    public class ProjectTaskViewModel
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public DateTime? StartDate { get; set; }
        public DateTime? EndDate { get; set; }
        public int? Status { get; set; }
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
        public int? ListTaskId { get; set; }
    }
}
