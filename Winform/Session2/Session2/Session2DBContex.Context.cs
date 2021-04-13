﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Session2
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Entity.Core.Objects;
    using System.Linq;
    
    public partial class Session2Entities : DbContext
    {
        public Session2Entities()
            : base("name=Session2Entities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<AssetGroup> AssetGroups { get; set; }
        public virtual DbSet<Asset> Assets { get; set; }
        public virtual DbSet<ChangedPart> ChangedParts { get; set; }
        public virtual DbSet<DepartmentLocation> DepartmentLocations { get; set; }
        public virtual DbSet<Department> Departments { get; set; }
        public virtual DbSet<EmergencyMaintenance> EmergencyMaintenances { get; set; }
        public virtual DbSet<Employee> Employees { get; set; }
        public virtual DbSet<Location> Locations { get; set; }
        public virtual DbSet<Part> Parts { get; set; }
        public virtual DbSet<Priority> Priorities { get; set; }
    
        public virtual int GetListEMbyAd()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("GetListEMbyAd");
        }
    
        public virtual ObjectResult<Nullable<long>> sp_GetAssetID(string assetSN)
        {
            var assetSNParameter = assetSN != null ?
                new ObjectParameter("AssetSN", assetSN) :
                new ObjectParameter("AssetSN", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<Nullable<long>>("sp_GetAssetID", assetSNParameter);
        }
    }
}
