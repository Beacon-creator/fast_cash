using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Fast_Cash.Model
{
    public class BankLink
    {
        public int Id { get; set; }
        public string? AccountOwnerName { get; set; }
        public string? AccountNumber { get; set; }
        public string? BVN { get; set; }
    }
}
