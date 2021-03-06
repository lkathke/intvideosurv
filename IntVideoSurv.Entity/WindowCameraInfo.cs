﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using Com.SS.Framework.Entity;

namespace IntVideoSurv.Entity
{
    [Serializable]
    public class WindowCameraInfo : EntityObject
    {

        #region construction
        public WindowCameraInfo() { }
        public WindowCameraInfo(IDataReader dataReader) : base(dataReader) { }
        public WindowCameraInfo(DataRow dataRow)
        {
            Id = Convert.ToInt32(dataRow["Id"]);
            CameraId = Convert.ToInt32(dataRow["CameraId"]);
            Row = Convert.ToInt32(dataRow["Row"]);
            Col = Convert.ToInt32(dataRow["Col"]);
        }
        #endregion

        [ColumnMapping()]
        public int Id { get; set; }

        [ColumnMapping()]
        public int Row { get; set; }

        [ColumnMapping()]
        public int Col { get; set; }

        [ColumnMapping()]
        public int CameraId { get; set; }

        public CameraInfo CameraInfo{ get; set; }
    }

}
