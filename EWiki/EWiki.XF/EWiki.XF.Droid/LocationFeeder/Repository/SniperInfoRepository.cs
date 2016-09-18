using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Android.Util;
using EWiki.XF.Droid.LocationFeeder.Helper;

namespace EWiki.XF.Droid.LocationFeeder.Repository
{
    public class SniperInfoRepository
    {
        private const int MinutesToKeepInCache = 20;
        private const int CleanUpInterval = 60 * 1000;

        public SniperInfoRepository()
        {
            StartCleanupThread();
        }

        private void StartCleanupThread()
        {
            Task.Factory.StartNew(async () =>
            {
                while (true)
                {
                    RemoveExpired();
                    await Task.Delay(CleanUpInterval);
                }
            }, TaskCreationOptions.LongRunning);
        }

        private readonly ConcurrentDictionary<SniperInfo, int> _sniperInfoSet =
            new ConcurrentDictionary<SniperInfo, int>();

        public SniperInfo Find(SniperInfo newSniperInfo)
        {
            return _sniperInfoSet.Keys.
                FirstOrDefault(x => x.GetHashCode() == newSniperInfo.GetHashCode()
                && x.Equals(newSniperInfo));
        }

        public List<SniperInfo> FindAllNew(long lastReceived, bool findNewVerified = false)
        {
            return _sniperInfoSet.Keys.
                Where(x => !IsExpired(x) && ToEpoch(x.ReceivedTimeStamp) > lastReceived
                    || (findNewVerified && ToEpoch(x.VerifiedOn) > lastReceived)).ToList();
        }

        public int Count()
        {
            return _sniperInfoSet.Count;
        }

        private static long ToEpoch(DateTime datetime)
        {
            return
                (long)
                    datetime.ToUniversalTime()
                        .Subtract(new DateTime(1970, 1, 1, 0, 0, 0, DateTimeKind.Utc))
                        .TotalMilliseconds;
        }

        public int Increase(SniperInfo sniperInfo)
        {
            int count = Remove(sniperInfo);
            count++;
            _sniperInfoSet.TryAdd(sniperInfo, count);
            return count;
        }

        public int Update(SniperInfo sniperInfo)
        {
            int count = Remove(sniperInfo);
            _sniperInfoSet.TryAdd(sniperInfo, count);
            return count;
        }

        public int Remove(SniperInfo toRemove)
        {
            int b = 0;
            _sniperInfoSet.TryRemove(toRemove, out b);
            return b;
        }

        public void RemoveExpired()
        {
            foreach (SniperInfo sniperInfo in _sniperInfoSet.Keys)
            {
                if (ShouldBeRemoved(sniperInfo))
                {
                    Log.Verbose("", "Expired: " + sniperInfo);
                    Remove(sniperInfo);
                }
            }
        }

        private static bool IsExpired(SniperInfo sniperInfo)
        {
            var xMinuteAgo = DateTime.Now.AddMinutes(-1 * MinutesToKeepInCache);
            return (sniperInfo.ExpirationTimestamp == default(DateTime) &&
                     sniperInfo.ReceivedTimeStamp < xMinuteAgo) ||
                    (sniperInfo.ExpirationTimestamp != default(DateTime)
                    && sniperInfo.ExpirationTimestamp < DateTime.Now);
        }

        private static bool ShouldBeRemoved(SniperInfo sniperInfo)
        {
            var xMinuteAgo = DateTime.Now.AddMinutes(-1 * MinutesToKeepInCache);
            return sniperInfo.ReceivedTimeStamp < xMinuteAgo;
        }
    }
}