//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Repository
{
    using System;
    using System.Collections.Generic;
    
    public partial class Company
    {
        public System.Guid Id { get; set; }
        public string CompanyName { get; set; }
        public string CompanyAddressLine { get; set; }
        public string CompanyCity { get; set; }
        public Nullable<int> CompanyProvinceId { get; set; }
        public string CompanyPostalCode { get; set; }
        public string CompanyPhone { get; set; }
        public string CompanyEmail { get; set; }
        public Nullable<decimal> SpendingAmountBalance { get; set; }
        public Nullable<bool> IsActive { get; set; }
    }
}
