using System;
using System.Collections.Generic;

namespace Sample.Entities.Models
{
    public partial class ListTask
    {
        public ListTask()
        {
            ProjectTask = new HashSet<ProjectTask>();
        }

        public int Id { get; set; }
        public string Name { get; set; }
        public int? ProjectId { get; set; }

        public virtual Project Project { get; set; }
        public virtual ICollection<ProjectTask> ProjectTask { get; set; }
    }
}
