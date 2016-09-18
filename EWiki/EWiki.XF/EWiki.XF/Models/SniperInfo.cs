using System;
using System.Threading.Tasks;
using EWiki.XF.Models.Enum;
using EWiki.XF.Services;
using Prism.Commands;
using Prism.Mvvm;
using WebSocket4Net;
using Xamarin.Forms;

namespace EWiki.XF.Models
{
    public class SniperInfo : BindableBase
    {
        public string Name { get; set; }
        public string Number
        {
            get
            {
                var number = "";
                for (var i = 0; i < 3 - ((int)Id).ToString().Length; i++)
                {
                    number += "0";
                }
                return $"{number}{(int)Id}";
            }
        }
        public string Avatar => $"No{Number}";
        public ulong EncounterId { get; set; }
        public DateTime ExpirationTimestamp { get; set; }

        private bool _trueExpirationTimestamp;

        public bool TrueExpirationTimestamp
        {
            get { return _trueExpirationTimestamp; }
            set { SetProperty(ref _trueExpirationTimestamp, value); }
        }

        private string _expirationSeconds;
        public string ExpirationSeconds
        {
            get { return _expirationSeconds; }
            set { SetProperty(ref _expirationSeconds, value); }
        }


        public double Latitude { get; set; }
        public double Longitude { get; set; }
        public PokemonId Id { get; set; }
        public string SpawnPointId { get; set; } = null;

        private PokemonMove _move1;

        public PokemonMove Move1
        {
            get { return _move1; }
            set { SetProperty(ref _move1, value); }
        }

        private PokemonMove _move2;

        public PokemonMove Move2
        {
            get { return _move2; }
            set { SetProperty(ref _move2, value); }
        }

        private double _IV;

        public double IV
        {
            get { return _IV; }
            set { SetProperty(ref _IV, value); }
        }

        private bool _verified;

        public bool Verified
        {
            get { return _verified; }
            set { SetProperty(ref _verified, value); }
        }

        public DateTime VerifiedOn { get; set; } 
        public string ChannelName { get; set; }
        public DateTime ReceivedTimeStamp { get; set; }
        public bool NeedVerification { get; set; } = false;
        public DateTime CreatedDate { get; set; }


        public DelegateCommand SnipCommand { get; set; }
        public DelegateCommand OpenMapCommand { get; set; }

        public SniperInfo()
        {
            CreatedDate = DateTime.Now;
            SnipCommand = DelegateCommand.FromAsyncHandler(ExecuteSnipCommand);
            OpenMapCommand = new DelegateCommand(ExecuteOpenMapCommand);
        }

        public async Task ExecuteSnipCommand()
        {
            try
            {
                var service = DependencyService.Get<ISniperService>();
                await service.Snipe(Id, Latitude, Longitude);
                //Device.OpenUri(new Uri($"pokesniper2://{Name}/{Latitude},{Longitude}"));
            }
            catch (Exception exception)
            {
                // ignored
            }
        }

        public void ExecuteOpenMapCommand()
        {
            Device.OpenUri(new Uri($"http://maps.google.com/maps?q=loc:{Latitude},{Longitude}"));
        }
    }
}
