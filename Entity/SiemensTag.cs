using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity
{
    public enum SiemensDataType
    {
        Boolean, Byte, Char, Word, Int, DWord, DInt, Real, String
    }

    public class SiemensTag
    {
        public string Name { get; set; }

        public SiemensDataType DataType { get; set; }

        public int DBNum { get; set; }
        public int Start { get; set; }
        public int Size { get; set; }

        public object Value { get; set; }
    }

}
