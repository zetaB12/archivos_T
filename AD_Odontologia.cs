using System;
using System.Collections.Generic;
using CO_AccesoDatos;
using CO_Comun;
using EN_MAESTROS;

namespace AD_MAESTROS
{
    public class AD_Odontologia
    {
        #region Singleton

        private static AD_Odontologia instance = null;
        protected AD_Odontologia() { }
        public static AD_Odontologia Instance
        {
            get
            {
                if (instance == null)
                    instance = new AD_Odontologia();

                return instance;
            }
        }

        #endregion

        public EN_Result Odontologia_CUD(string xmlDoc)
        {
            try
            {
                var parameters = new Dictionary<string, object>()
                {
                    { "EntidadXML", xmlDoc }
                };

                return SQLHelper.ExecuteQueryProcedureToXml<EN_Result>("[maestros].[svt_Odontologia_CUD]", parameters);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
