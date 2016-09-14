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
        public string Avatar => $"No{Number}";
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

        private string _move1;

        public string Move1
        {
            get { return _move1; }
            set { SetProperty(ref _move1, value); }
        }

        private string _move2;

        public string Move2
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
