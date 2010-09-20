#region License, Terms and Author(s)
//
// ELMAH - Error Logging Modules and Handlers for ASP.NET
// Copyright (c) 2004-9 Atif Aziz. All rights reserved.
//
//  Author(s):
//
//      James Driscoll
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
#endregion

using System.Web;

[assembly: Elmah.Scc("$Id: EnvironmentHelper.cs 703 2010-01-18 00:00:18Z jamesdriscoll@btinternet.com $")]

namespace Elmah
{
    #region Imports

    using System;
    using System.Security;

    #endregion

    internal class EnvironmentHelper
    {
        public static string GetMachineName(HttpContext context)
        {
            try
            {
                // in certain Medium trust environments,
                // permissions for this call are denied
                return Environment.MachineName;
            }
            catch (SecurityException)
            {
            }

            if (context != null)
            {
                try
                {
                    return context.Server.MachineName;
                }
                catch (SecurityException)
                {
                }
            }

            return "Unknown";
        }
    }
}
