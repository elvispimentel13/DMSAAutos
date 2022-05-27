namespace DMSAAutos.API.Mappings
{
    public class DomainToResponseProfile : Profile
    {
        public DomainToResponseProfile()
        {
            CreateMap<Inventory, InventoryDto>()
                .ForMember(destinationMember: dest => dest.VehicleStatus,
                           memberOptions: opt => opt.MapFrom(mapExpression: src => src.DealerName.ToLower() == "dealer1" && src.AvailabilityDescription == "Active" ? "For Sale" : src.AvailabilityDescription));
            CreateMap<DealerOne, DealerDto>()
                .ForMember(destinationMember: dest => dest.VehicleStatus,
                           memberOptions: opt => opt.MapFrom(mapExpression: src => src.AvailabilityDescription == "Active" ? "For Sale" : src.AvailabilityDescription));
            CreateMap<DealerTwo, DealerDto>()
                .ForMember(destinationMember: dest => dest.VehicleStatus,
                           memberOptions: opt => opt.MapFrom(mapExpression: src => src.AvailabilityDescription));

            CreateMap<Inventory, DealerOne>();
            CreateMap<Inventory, DealerTwo>();
        }
    }
}
