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
    public static class CommentRepository
    {
        public static async Task<HttpResponse<List<CommentViewModel>>> GetCommentByTaskID(this IRepository<Comment> repository, int taskId)
        {
            var query = await repository.Entities
                .Where(cmt => cmt.TaskId == taskId)
               .Select(cmt => new CommentViewModel
               {
                   Id = cmt.Id,
                   Cmt = cmt.Cmt,
                   UserId = cmt.UserId,
                   UserName = cmt.User.Name,
                   Img = cmt.User.Img,
                   TaskId = cmt.TaskId,
                   ParentId = cmt.ParentId,
                   InverseParent = cmt.InverseParent.Select(cm => new CommentViewModel
                   {
                       Id = cm.Id,
                       Cmt = cm.Cmt,
                       UserId = cm.UserId,
                       UserName = cm.User.Name,
                       Img = cm.User.Img,
                       TaskId = cm.TaskId,
                       ParentId = cm.ParentId,
                   })
               }).ToListAsync();

            return HttpResponse<List<CommentViewModel>>.OK(query);
        }
        public static async Task<HttpResponse<IEnumerable<CommentViewModel>>> GetComments(this IRepository<Comment> repository)
        {
            var query = await repository.Entities
                .Where(cmt => cmt.ParentId == null)
                .Select(cmt => new CommentViewModel
                {
                    Id = cmt.Id,
                    Cmt = cmt.Cmt,
                    UserId = cmt.UserId,
                    UserName = cmt.User.Name,
                    Img = cmt.User.Img,
                    TaskId = cmt.TaskId,
                    ParentId = cmt.ParentId,
                    InverseParent = cmt.InverseParent.Where(cm => cm.ParentId == cmt.Id).Select(cm => new CommentViewModel
                    {
                        Id = cm.Id,
                        Cmt = cm.Cmt,
                        UserId = cm.UserId,
                        UserName = cm.User.Name,
                        Img = cm.User.Img,
                        TaskId = cm.TaskId,
                        ParentId = cm.ParentId,
                    })
                })
                .ToListAsync();

            return HttpResponse<IEnumerable<CommentViewModel>>.OK(query);
        }

    }
}
