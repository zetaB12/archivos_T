using System;
using System.Xml.Serialization;

namespace EN_MAESTROS
{
    [Serializable, XmlRoot]
    public class EN_Diagnostico
    {
        [XmlAttribute] public int DiagnosticoID { get; set; }
        [XmlAttribute] public int OdontologiaID { get; set; }
        [XmlAttribute] public int Codigo { get; set; }//puede ser int o varchar
        [XmlAttribute] public string Descripcion { get; set; }
        [XmlAttribute] public int Activo { get; set; }
        [XmlAttribute] public string UserId { get; set; }
        [XmlAttribute] public int TypeRegister { get; set; }
    }
}
