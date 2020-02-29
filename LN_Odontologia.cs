using System;
using System.Collections.Generic;
using AD_MAESTROS;
using CO_Comun;
using EN_MAESTROS;
using CO_AccesoDatos;

namespace LN_MAESTROS
{
    public class LN_Odontologia
    {
        #region Singleton
        private static readonly Lazy<LN_Odontologia> instance = new Lazy<LN_Odontologia>(() => new LN_Odontologia());

        public LN_Odontologia() { }
        public static LN_Odontologia Instance
        {
            get
            {
                return instance.Value;
            }
        }
        #endregion

        public EN_Result Odontologia_CUD(EN_Odontologia Entidad)
        {
            try
            {
                return AD_Odontologia.Instance.Odontologia_CUD(Entidad.SerializeToXML());
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
