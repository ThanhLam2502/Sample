

using Sample.Core.Http;
using Sample.Entities.Models;
using Sample.Entities.ViewModels;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Sample.Entities.Services
{
    public interface ICommentService : IBaseService<Comment>
    {
        Task<HttpResponse<List<CommentViewModel>>> GetCommentByTaskID(int taskId);
        Task<HttpResponse<IEnumerable<CommentViewModel>>> GetComments();
        Task<HttpResponse<int>> InsertComment(CommentViewModel model);
        Task<HttpResponse<int>> UpdateCmtContent(CommentViewModel model, int id);
        Task<HttpResponse<int>> DeleteComment(int id);
    }
}
