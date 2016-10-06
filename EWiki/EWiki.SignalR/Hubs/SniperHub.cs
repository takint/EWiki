using EWiki.SignalR.Hubs.Models;
using Microsoft.AspNet.SignalR;
using Newtonsoft.Json;

namespace EWiki.SignalR.Hubs
{
    public class SniperHub : Hub
    {
        public void SendMessage(SniperMessage message)
        {
            Clients.Client(Context.ConnectionId).GetMessage(JsonConvert.SerializeObject(message));
        }

        public void SniperMessage(string message)
        {
            var snipeRq = JsonConvert.DeserializeObject<SnipeRq>(message);
        }
    }
}
