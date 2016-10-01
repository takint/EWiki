using System;
using System.Threading.Tasks;

namespace EWiki.XF.Models
{
    public class LeftMenuItem
    {
        public LeftMenuItem()
        {
            CommandType = CommandType.Navigation;
        }
        public string Text { get; set; }
        public string Icon { get; set; }
        public bool IsImageIcon { get; set; }
        public string Command { get; set; }
        public CommandType CommandType { get; set; }
        public bool IsActived { get; set; }
        public Func<Task> Action { get; set; }
    }

    public enum CommandType
    {
        Navigation, Popup, Action
    }
}
