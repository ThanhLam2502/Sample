using System;
using System.Collections.Generic;

namespace Sample.Entities.Models
{
    public partial class Comment
    {
        public int Id { get; set; }
        public string Comment1 { get; set; }
        public int? UserId { get; set; }
        public int? TaskId { get; set; }
        public int? ParentCommentId { get; set; }

        public virtual TaskUser Task { get; set; }
        public virtual User User { get; set; }
    }
}
