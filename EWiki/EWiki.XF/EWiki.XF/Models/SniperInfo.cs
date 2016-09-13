using System;
using EWiki.XF.Models.Enum;
using Prism.Commands;
using Prism.Mvvm;
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
        public string Avatar {
            get {
                return $"No{Number}";
            }
        }
        public ulong EncounterId { get; set; }
        public DateTime ExpirationTimestamp { get; set; }

        private int _expirationSeconds;
        public int ExpirationSeconds
        {
            get { return _expirationSeconds; }
            set { SetProperty(ref _expirationSeconds, value); }
        }


        public double Latitude { get; set; }
        public double Longitude { get; set; }
        public PokemonId Id { get; set; }
        public string SpawnPointId { get; set; } = null;
        public PokemonMove Move1 { get; set; }
        public PokemonMove Move2 { get; set; }
        public double IV { get; set; }
        public string VerifyIcon => Verified ? "md-check-circle" : "md-help-outline";
        public Color VerifyColor => Verified ? Color.FromHex("009688") : Color.FromHex("212121");
        public bool Verified { get; set; } = false;
        public DateTime VerifiedOn { get; set; } 
        public string ChannelName { get; set; }
        public DateTime ReceivedTimeStamp { get; set; }
        public bool NeedVerification { get; set; } = false;


        public DelegateCommand SnipCommand { get; set; }
        public DelegateCommand OpenMapCommand { get; set; }

        public SniperInfo()
        {
            SnipCommand = new DelegateCommand(ExecuteSnipCommand);
            OpenMapCommand = new DelegateCommand(ExecuteOpenMapCommand);
        }

        public void ExecuteSnipCommand()
        {
            Device.OpenUri(new Uri($"pokesniper2://{Name}/{Latitude},{Longitude}"));
        }

        public void ExecuteOpenMapCommand()
        {
            Device.OpenUri(new Uri($"http://maps.google.com/maps?q=loc:{Latitude},{Longitude}"));
        }
    }
}
