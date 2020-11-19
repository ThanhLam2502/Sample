﻿using System;
using System.ComponentModel;
using DevExpress.Xpo;

namespace Sample.Entities.Utilities
{
    public enum StatusProject : int
    {
        [Description("Open")] Open = 0,
        [Description("Open")] Close,
    }
    public enum StatusTask : int
    {
        [Description("Not Started")] NotStarted = 0,
        [Description("In Progress")] InProgress,
        [Description("Completed")] Completed,
        [Description("Closed")] Closed
    }
}