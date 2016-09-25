using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Threading.Tasks;
using ModernHttpClient;
using Newtonsoft.Json;

namespace EWiki.XF.Service
{
    internal class WebApiClient
    {
        readonly string _basedUri;
        private WebApiClient(string basedUri)
        {
            _basedUri = basedUri;
        }

        private static WebApiClient _instance;

        internal static WebApiClient Instance
        {
            get { return _instance ?? (_instance = new WebApiClient("[Base API uri here]")); }
        }

        internal async Task<T> GetAsync<T>(string action, string authToken = null, Dictionary<string, object> parameters = null)
        {
            using (var httpClient = GetHttpClient(authToken))
            {
                var url = BuildActionUri(action, parameters);

                var httpResponse = await httpClient.GetAsync(url);
                httpResponse.EnsureSuccessStatusCode();
                string responeJson = await httpResponse.Content.ReadAsStringAsync();
                if (responeJson != "null")
                {
                    try
                    {
                        return JsonConvert.DeserializeObject<T>(responeJson);
                    }
                    catch (Exception ex)
                    {
                        //Common.Logging.LoggerFactory.CreateLog().LogError(ex, new Dictionary<string, string>
                        //{
                        //    {"jsonResult", responeJson }
                        //});
                    }
                }


                return default(T);
            }

        }

        //internal async Task PutAsync<T>(string action, T data, string authToken = null)
        //{
        //    using (var httpClient = GetHttpClient(authToken))
        //    {
        //        var url = BuildActionUri(action);
        //        var httpResponse = await httpClient.PutAsJsonAsync(url, data);
        //        httpResponse.EnsureSuccessStatusCode();
        //    }
        //}

        //internal async Task PostAsync<T>(string action, T data, string authToken = null)
        //{
        //    using (var httpClient = GetHttpClient(authToken))
        //    {
        //        var url = BuildActionUri(action);
        //        var httpResponse = await httpClient.PostAsJsonAsync(url, data);
        //        httpResponse.EnsureSuccessStatusCode();
        //    }
        //}

        //internal async Task<TResult> PostReturnValueAsync<TResult, T>(string action, T data, string authToken = null)
        //{
        //    using (var httpClient = GetHttpClient(authToken))
        //    {
        //        var url = BuildActionUri(action);
        //        var httpResponse = await httpClient.PostAsJsonAsync(url, data);
        //        httpResponse.EnsureSuccessStatusCode();

        //        string responseJson = await httpResponse.Content.ReadAsStringAsync();
        //        if (responseJson != "null")
        //            return JsonConvert.DeserializeObject<TResult>(responseJson);
        //        return default(TResult);
        //    }
        //}

        internal async Task<Stream> DownloadAsync(string action, string authToken = null)
        {
            try
            {
                using (var httpClient = GetHttpClient(authToken))
                {
                    var url = BuildActionUri(action);
                    var response = await httpClient.GetAsync(url);
                    response.EnsureSuccessStatusCode();

                    var stream = await response.Content.ReadAsStreamAsync();
                    return stream;
                }
            }
            catch (Exception ex)
            {
                //var extraData = new Dictionary<string, string> {
                //    { "action", action}
                //};
                //Common.Logging.LoggerFactory.CreateLog().LogError(ex, extraData);
            }
            return null;
        }


        internal async Task<TResult> UploadAsync<TResult>(string action, string fileName, string contentType, byte[] data, string authToken = null)
        {
            using (var httpClient = GetHttpClient(authToken))
            {
                var url = BuildActionUri(action);
                var requestContent = new MultipartFormDataContent();
                var imageContent = new ByteArrayContent(data);
                imageContent.Headers.ContentType = MediaTypeHeaderValue.Parse(contentType);

                requestContent.Add(imageContent, Path.GetFileNameWithoutExtension(fileName), fileName);
                var httpResponse = await httpClient.PostAsync(url, requestContent);
                httpResponse.EnsureSuccessStatusCode();

                string responseJson = await httpResponse.Content.ReadAsStringAsync();
                return JsonConvert.DeserializeObject<TResult>(responseJson);
            }
        }

        internal async Task<TResult> UploadAsync<TResult>(string action, string fileName, string contentType, Stream data, string authToken = null)
        {
            using (var httpClient = GetHttpClient(authToken))
            {
                var url = BuildActionUri(action);
                var requestContent = new MultipartFormDataContent();
                var imageContent = new StreamContent(data);
                imageContent.Headers.ContentType = MediaTypeHeaderValue.Parse(contentType);

                requestContent.Add(imageContent, Path.GetFileNameWithoutExtension(fileName), fileName);
                var httpResponse = await httpClient.PostAsync(url, requestContent);
                httpResponse.EnsureSuccessStatusCode();

                string responseJson = await httpResponse.Content.ReadAsStringAsync();
                return JsonConvert.DeserializeObject<TResult>(responseJson);
            }
        }

        private HttpClient GetHttpClient(string authToken = null)
        {
            var client = new HttpClient(new NativeMessageHandler());
            client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
            client.DefaultRequestHeaders.Add("RequestSource", "Mobile");

            if (!string.IsNullOrWhiteSpace(authToken))
            {
                string bearerToken = string.Format("Bearer {0}", authToken);
                client.DefaultRequestHeaders.Authorization = AuthenticationHeaderValue.Parse(bearerToken);
            }

            return client;
        }

        private string BuildActionUri(string action, Dictionary<string, object> parameters = null)
        {
            var url = _basedUri + action;
            if (parameters != null)
                url = AddUrlParams(url, parameters);

            return url;
        }

        private static string AddUrlParams(string url, Dictionary<string, object> parameters)
        {
            var stringBuilder = new StringBuilder(url);
            var hasFirstParam = url.Contains("?");

            foreach (var parameter in parameters)
            {
                var format = hasFirstParam ? "&{0}={1}" : "?{0}={1}";
                stringBuilder.AppendFormat(format, Uri.EscapeDataString(parameter.Key),
                    Uri.EscapeDataString(parameter.Value.ToString()));
                hasFirstParam = true;
            }

            return stringBuilder.ToString();
        }
    }
}
