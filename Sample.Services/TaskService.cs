using DevExtreme.AspNet.Data;
using Sample.Entities.Models;
using Sample.Entities.Services;
using Sample.Entities.UnitOfWork;
using Sample.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Sample.Services
{
    public class TaskService : BaseService<ProjectTask>, ITaskService
    {
        private readonly IUnitOfWork _unitOfWork;

        public TaskService(IUnitOfWork unitOfWork): base(unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }
    }
}
