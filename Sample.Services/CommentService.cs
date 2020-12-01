using AutoMapper;
using DevExtreme.AspNet.Data;
using Sample.Core.Http;
using Sample.Entities.Models;
using Sample.Entities.Resources;
using Sample.Entities.Services;
using Sample.Entities.UnitOfWork;
using Sample.Entities.ViewModels;
using Sample.Repositories;
using Sample.Repositories.Repostitory;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Sample.Services
{
    public class CommentService : BaseService<Comment>, ICommentService
    {
        private readonly IMapper _mapper;
        private readonly IUnitOfWork _unitOfWork;

        public CommentService(IUnitOfWork unitOfWork, IMapper mapper): base(unitOfWork)
        {
            _unitOfWork = unitOfWork;
            _mapper = mapper;
        }

        public Task<HttpResponse<List<CommentViewModel>>> GetCommentByTaskID(int taskId)
        {
            var comments = Repository.GetCommentByTaskID(taskId);
            return comments;
        }

        public async Task<HttpResponse<int>> InsertComment(CommentViewModel model)
        {
            var comment = _mapper.Map<Comment>(model);
            await Repository.InsertAsync(comment);
            return HttpResponse<int>.OK(comment.Id, Messages.ItemInserted);
        }

        public async Task<HttpResponse<int>> UpdateCmtContent(CommentViewModel model, int id)
        {
            var comment = await Repository.FindAsync(id);
            if (comment == null)
                return HttpResponse<int>.Error(Messages.ActionFailed, statusCode: System.Net.HttpStatusCode.NoContent);

            comment.Cmt = model.Cmt;
          

            int saved = await _unitOfWork.SaveChangesAsync();

            if (saved > 0)
                return HttpResponse<int>.OK(model.Id, Messages.ItemUpdated);

            return HttpResponse<int>.Error(Messages.ActionFailed, statusCode: System.Net.HttpStatusCode.BadRequest);
        }

        public async Task<HttpResponse<int>> DeleteComment(int id)
        {
            var comment = await Repository.FindAsync(id);
            if (comment == null)
                return HttpResponse<int>.Error(Messages.ActionFailed, statusCode: System.Net.HttpStatusCode.NoContent);

            comment.IsDeleted = true;
            var saved = await _unitOfWork.SaveChangesAsync();
            if (saved > 0)
                return HttpResponse<int>.OK(id, Messages.ItemDeleted);

            return HttpResponse<int>.Error(Messages.ActionFailed, statusCode: System.Net.HttpStatusCode.BadRequest);
        }
    }
}
