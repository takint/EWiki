using System;
using System.Linq.Expressions;

namespace EWiki.DataAccess.Helpers
{
    public static class ServiceResponseCodesHelper
    {
        // Uses lambda expressions to extract the name of the supplied property, which is the same as the error code.
        // Reference from Veebs
        private static string GetResponseCode<T>(Expression<Func<T>> exp)
        {
            return (((MemberExpression)(exp.Body)).Member).Name;
        }
    }
}
