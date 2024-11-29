using System.ComponentModel.DataAnnotations;

namespace TweetService.Models
{
    public class TweetDto
    {
        [Required(ErrorMessage = "The tweet content is required.")]
        [MaxLength(280, ErrorMessage = "The tweet cannot exceed 280 characters.")]
        public string Tweet { get; set; }

        //public DateTime CreatedAt { get; set; } = DateTime.UtcNow;

        //public string UserName { get; set; }
    }
}