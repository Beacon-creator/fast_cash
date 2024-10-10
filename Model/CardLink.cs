using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Cashnal.Model
{
    public class CardLink
    {
        public int Id { get; set; }
        public string? CardHolderName { get; set; }
        public string? CardNumber { get; set; }
        public string? CVV { get; set; }
        public string? ExpiryDate { get; set; } // Format: MM/YY
    }
}
