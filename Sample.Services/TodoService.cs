using AutoMapper;
using DevExtreme.AspNet.Data;
using Sample.Core.Http;
using Sample.Entities.Models;
using Sample.Entities.Resources;
using Sample.Entities.Services;
using Sample.Entities.UnitOfWork;
using Sample.Entities.ViewModels;
using Sample.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Sample.Services
{
    public class TodoService : BaseService<Todo>, ITodoService
    {
        private readonly IMapper _mapper;
        private readonly IUnitOfWork _unitOfWork;

        public TodoService(IUnitOfWork unitOfWork, IMapper mapper) : base(unitOfWork)
        {
            _unitOfWork = unitOfWork;
            _mapper = mapper;
        }

        public async Task<HttpResponse<int>> InsertTodo(TodoViewModel model)
        {
            var todo = _mapper.Map<Todo>(model);
            await Repository.InsertAsync(todo);
            return HttpResponse<int>.OK(todo.Id, Messages.ItemInserted);
        }

        public async Task<HttpResponse<int>> UpdateTodo(TodoViewModel model, int id)
        {
            var todo = await Repository.FindAsync(id);
            if (todo == null)
                return HttpResponse<int>.Error(Messages.ActionFailed, statusCode: System.Net.HttpStatusCode.NoContent);

            todo.Name = model.Name;
            todo.IsComplete = model.IsComplete;
            todo.ListTodoId = model.ListTodoId;
            int saved = await _unitOfWork.SaveChangesAsync();
            if (saved > 0)
                return HttpResponse<int>.OK(todo.Id, Messages.ItemUpdated);

            return HttpResponse<int>.Error(Messages.ActionFailed, statusCode: System.Net.HttpStatusCode.BadRequest);

        }

        public HttpResponse<int> DeleteTodo(int id)
        {
            Repository.Delete(id);
            return HttpResponse<int>.OK(id, Messages.ItemDeleted);
        }

        public async Task<HttpResponse<int>> InsertListTodo(ListTodoViewModel model)
        {
            var repos = _unitOfWork.Repository<ListTodo>();
            var listTodo = _mapper.Map<ListTodo>(model);
            await repos.InsertAsync(listTodo);
            return HttpResponse<int>.OK(listTodo.Id, Messages.ItemInserted);
        }

        public async Task<HttpResponse<int>> UpdateListTodo(ListTodoViewModel model, int id)
        {
            var repos = _unitOfWork.Repository<ListTodo>();
            var listTodo = await repos.FindAsync(id);

            if (listTodo == null)
                return HttpResponse<int>.Error(Messages.ActionFailed, statusCode: System.Net.HttpStatusCode.NoContent);

            listTodo.Name = model.Name;
            listTodo.TaskId = model.TaskId;

            int saved = await _unitOfWork.SaveChangesAsync();
            if (saved > 0)
                return HttpResponse<int>.OK(listTodo.Id, Messages.ItemUpdated);

            return HttpResponse<int>.Error(Messages.ActionFailed, statusCode: System.Net.HttpStatusCode.BadRequest);

        }

        public async Task<HttpResponse<int>> DeleteListTodo(int id)
        {
            var repos = _unitOfWork.Repository<ListTodo>();
            var listTodo = await repos.FindAsync(id);
            if (listTodo == null)
                return HttpResponse<int>.Error(Messages.ActionFailed, statusCode: System.Net.HttpStatusCode.NoContent);

            listTodo.IsDeleted = true;
            var saved = await _unitOfWork.SaveChangesAsync();
            if (saved > 0)
                return HttpResponse<int>.OK(id, Messages.ItemDeleted);

            return HttpResponse<int>.Error(Messages.ActionFailed, statusCode: System.Net.HttpStatusCode.BadRequest);
        }
    }
}
