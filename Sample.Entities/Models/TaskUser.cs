using System;
using System.Collections.Generic;

namespace Sample.Entities.Models
{
    public partial class TaskUser
    {
        public TaskUser()
        {
            Comment = new HashSet<Comment>();
        }

        public int Id { get; set; }
        public int? UserId { get; set; }
        public int? TaskId { get; set; }

        public virtual ProjectTask Task { get; set; }
        public virtual User User { get; set; }
        public virtual ICollection<Comment> Comment { get; set; }
    }
}
