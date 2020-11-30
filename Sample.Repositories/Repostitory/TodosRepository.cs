using Microsoft.EntityFrameworkCore;
using Sample.Core.Http;
using Sample.Entities.Models;
using Sample.Entities.Repositories;
using Sample.Entities.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Sample.Repositories.Repostitory
{
    public static class TodosRepository
    {
        public static async Task<HttpResponse<List<ListTodoViewModel>>> GetTodosByTaskID(this IRepository<ListTodo> repository, int taskId)
        {
            var query = await repository.Entities
                .Where(todos => todos.TaskId == taskId && todos.IsDeleted != true)
                .Select(todos => new ListTodoViewModel
                {
                    Id = todos.Id,
                    Name = todos.Name,
                    TaskId = todos.TaskId,
                    Todo = todos.Todo
                    .Select(todo => new TodoViewModel
                    {
                        Id = todo.Id,
                        Name = todo.Name,
                        IsComplete = todo.IsComplete,
                        ListTodoId = todo.ListTodoId,
                    })
                }).ToListAsync();

            return HttpResponse<List<ListTodoViewModel>>.OK(query);
        }
    }
}

//Todos = task.ListTodo
//.Where(todos => todos.IsDeleted != true)
//.Select(todos => new ListTodoViewModel
//{
//    Id = todos.Id,
//    Name = todos.Name,
//    TaskId = todos.TaskId,
//    Todo = todos.Todo.Select(todo => new TodoViewModel
//    {
//        Id = todo.Id,
//        Name = todo.Name,
//        IsComplete = todo.IsComplete,
//        ListTodoId = todo.ListTodoId,
//    })
//})