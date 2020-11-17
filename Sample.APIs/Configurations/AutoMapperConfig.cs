using AutoMapper;
using Sample.Entities.Models;
using Sample.Entities.ViewModels;

namespace Sample.APIs.Configurations
{
    public class AutoMapperConfig : Profile
    {
        public AutoMapperConfig()
        {
            CreateMap<ProjectTaskViewModel, Project>().ReverseMap();
            CreateMap<ListTaskViewModel, ListTask>().ReverseMap();
            CreateMap<TaskViewModel, ProjectTask>().ReverseMap();
        }

    }
}