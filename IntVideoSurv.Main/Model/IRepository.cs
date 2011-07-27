﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DevExpress.Xpo;

namespace CameraViewer.Model
{
    public class Repository
    {
        private Dictionary<string, Camera> _cameras = new Dictionary<string, Camera>();
        private List<TOG_DEVICE> _togCameras;
        private XPCollection<Department> _departments;
        private XPCollection<TogTollgate> _tollgates;
        private XPCollection<AORG> _organizations;
        private static Repository _instance;

        public IList<TOG_DEVICE> GetTogCameras()
        {
            if (_togCameras == null)
            {
                _togCameras = new XPCollection<TOG_DEVICE>().Where(t => t.SBLX == "1" || t.SBLX == "2").OrderBy(t=>int.Parse(t.SBBH)).ToList();
            }

            return _togCameras;
        }

        public Camera GetCamera(string cameraId)
        {
            if (_cameras.ContainsKey(cameraId))
            {
                return _cameras[cameraId];
            }

            var query = string.Format(
                "select a.kkbh, a.kkmc, b.kkbh fxbh, b.kkmc fxmc, c.kkbh cdbh, c.kkmc cdmc,a.dlbh, a.dlmc, a.lkdm, a.lkmc,a.dwbh, a.xzqh, a.kkwz, c.sxjbh from tog_tollgate a, tog_tollgate b, tog_tollgate c where a.kkbh=b.kkfbh and b.kkbh=c.kkfbh and a.kkbh<>'moniroot' and c.sxjbh = '{0}'", cameraId);
            var res = DevExpress.Xpo.XpoDefault.Session.ExecuteQuery(query);
            if (res.ResultSet.Length > 0)
            {
                if (res.ResultSet[0].Rows.Length >= 0)
                {
                    var c = new Camera()
                                {
                                    No = cameraId,

                                    KaKouNo = res.ResultSet[0].Rows[0].Values[0].ToString(),
                                    KakouName = res.ResultSet[0].Rows[0].Values[1].ToString(),

                                    DirectionNo = res.ResultSet[0].Rows[0].Values[2].ToString(),
                                    DirectionName = res.ResultSet[0].Rows[0].Values[3].ToString(),

                                    LaneNo = res.ResultSet[0].Rows[0].Values[4].ToString(),
                                    LaneName = res.ResultSet[0].Rows[0].Values[5].ToString(),

                                    RegionNo = res.ResultSet[0].Rows[0].Values[11].ToString(),
                                    OrgNo = res.ResultSet[0].Rows[0].Values[10].ToString()
                                };
                    _cameras.Add(cameraId, c);
                    return c;
                }
            }

            return null;
        }

        public Department GetDepartment(string departmentId)
        {
            if (_departments == null)
            {
                _departments = new XPCollection<Department>();
            }

            return _departments.FirstOrDefault(d => d.XZQHDM == departmentId);
        }

        public TogTollgate GetTollGate(string tollgateId)
        {
            if (_tollgates == null)
            {
                _tollgates = new XPCollection<TogTollgate>();
            }

            return _tollgates.FirstOrDefault(t => t.KKBH == tollgateId);
        }

        public AORG GetOrganization(string organizationId)
        {
            if (_organizations == null)
            {
                _organizations = new XPCollection<AORG>();
            }

            return _organizations.FirstOrDefault(o => o.ORGID == organizationId);
        }

        public static Repository Instance
        {
            get
            {
                if (_instance == null)
                {
                    _instance = new Repository();
                }

                return _instance;
            }
        }
    }
}