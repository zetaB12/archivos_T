using System;
using System.Collections.Generic;
using System.Xml.Serialization;

namespace EN_MAESTROS
{
    [Serializable, XmlRoot]
    public class EN_Odontologia
    {
        [XmlAttribute] public int OdontologiaID { get; set; }
        [XmlAttribute] public int PiezasMalEstado { get; set; }
        [XmlAttribute] public int PiezasFaltantes { get; set; }
        [XmlAttribute] public string Detalle { get; set; }
        [XmlAttribute] public string Observaciones { get; set; }
        [XmlAttribute] public int Activo { get; set; }
        [XmlAttribute] public string UserId { get; set; }
        [XmlAttribute] public int TypeRegister { get; set; }

        public List<EN_Diagnostico> ListaDiagnosticos { get; set; }
    }
}
