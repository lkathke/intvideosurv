﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data;
using IntVideoSurv.Entity;

namespace IntVideoSurv.DataAccess
{
    public class TaskDataAccess
    {
        public static bool IsTaskExisted(Database db, int taskId)
        {
            string cmdText = string.Format("select count(*) from IVS_TaskInfo where TaskId={0}",taskId);
            try
            {
                return int.Parse(db.ExecuteScalar(CommandType.Text, cmdText).ToString())>0;

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public static int Insert(Database db, TaskInfo taskInfo)
        {

            StringBuilder sbField = new StringBuilder();
            StringBuilder sbValue = new StringBuilder();
            sbField.Append("INSERT INTO  IVS_TaskInfo(");
            sbValue.Append("values(");
            sbField.Append("TaskId");
            sbValue.AppendFormat("{0}", taskInfo.TaskId);
            sbField.Append(",CameraId");
            sbValue.AppendFormat(",{0}", taskInfo.CameraId);
            sbField.Append(",DecoderId");
            sbValue.AppendFormat(",{0}", taskInfo.DecoderId);
            sbField.Append(",Status");
            sbValue.AppendFormat(",{0}", taskInfo.Status);
            sbField.Append(",HappenDateTime");

            if (DataBaseParas.DBType == MyDBType.SqlServer)
            { 
                sbValue.AppendFormat(",'{0}')", taskInfo.HappenDateTime == null ? DateTime.Now : taskInfo.HappenDateTime);

            }
            else if (DataBaseParas.DBType == MyDBType.Oracle)
            {
                sbValue.AppendFormat(",to_date('{0}','YYYY/MM/DD HH24:MI:SS'))", taskInfo.HappenDateTime == null ? DateTime.Now : taskInfo.HappenDateTime);
            }

            string cmdText = sbField.ToString() + " " + sbValue.ToString();
            try
            {
                cmdText = cmdText.Replace("\r\n", "");
                return db.ExecuteNonQuery(CommandType.Text, cmdText);

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public static int Update(Database db, int taskId, int status)
        {

            StringBuilder sbValue = new StringBuilder();
            sbValue.Append("update IVS_TaskInfo set ");

            sbValue.AppendFormat("Status={0}", status);
            if (DataBaseParas.DBType == MyDBType.SqlServer)
            {
                sbValue.AppendFormat(",HappenDateTime='{0}'", DateTime.Now);

            }
            else if (DataBaseParas.DBType == MyDBType.Oracle)
            {
                sbValue.AppendFormat(",to_date('{0}','YYYY/MM/DD HH24:MI:SS'))", DateTime.Now);
            }
            
            sbValue.AppendFormat(" where TaskId={0}", taskId);
            string cmdText = sbValue.ToString();
            try
            {
                return db.ExecuteNonQuery(CommandType.Text, cmdText);

            }
            catch (Exception ex)
            {

                throw ex;
            }


        }
        public static int Delete(Database db, int taskId)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("delete from IVS_TaskInfo ");
            sb.AppendFormat(" where TaskId={0}", taskId);
            string cmdText = sb.ToString();
            try
            {
                return db.ExecuteNonQuery(CommandType.Text, cmdText);

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}
