using System;
using System.Collections.Generic;

namespace Sample.Entities.Models
{
    public partial class ProjectTask
    {
        public ProjectTask()
        {
            TaskUser = new HashSet<TaskUser>();
        }

        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string AttachFiles { get; set; }
        public int? Status { get; set; }
        public int? ListTaskId { get; set; }

        public virtual ListTask ListTask { get; set; }
        public virtual ICollection<TaskUser> TaskUser { get; set; }
    }
}
