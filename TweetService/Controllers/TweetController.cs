using Microsoft.AspNetCore.Mvc;
using RabbitMQ.Client;
using System.Text;

namespace TweetService.Controllers
{
    [ApiController]
    [Route("api/tweets")]
    public class TweetController : ControllerBase
    {
        private const string QUEUE_NAME = "tweet_sent";

        [HttpPost]
        public IActionResult PostTweet([FromBody] string tweet)
        {
            // TODO:: Logic to save tweet in database

            // Send message to RabbitMQ
            SendToQueue(tweet);

            return Ok("Tweet posted successfully!");
        }

        private void SendToQueue(string message)
        {
            var factory = new ConnectionFactory() { HostName = "localhost" };
            
            using var connection = factory.CreateConnection();
            using var channel = connection.CreateModel();
            
            channel.QueueDeclare(queue: QUEUE_NAME,
                                durable: false,
                                exclusive: false,
                                autoDelete: false,
                                arguments: null);

            var body = Encoding.UTF8.GetBytes(message);
            
            channel.BasicPublish(exchange: "",
                                routingKey: QUEUE_NAME,
                                basicProperties: null,
                                body: body);
                                
        }

    }
}
