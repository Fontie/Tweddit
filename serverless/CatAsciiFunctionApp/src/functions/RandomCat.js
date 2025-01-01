const { app } = require('@azure/functions');

app.http('RandomCat', {
    methods: ['GET'], // Restrict to GET method
    authLevel: 'anonymous', // No authorization required
    handler: async (request, context) => {
        context.log(`Http function processed request for url "${request.url}"`);

        // Array of ASCII cats
        const cats = [
            `https://i.imgur.com/CAqyyVv.jpeg`,
            `https://i.imgur.com/xvWsSmu.jpeg`,
            `https://i.imgur.com/KOKuypT.jpeg`
        ];

        // Randomly pick one
        const randomCat = cats[Math.floor(Math.random() * cats.length)];

        // Return the result as JSON
        return {
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ art: randomCat }) // Ensure the body is a stringified JSON
        };
    }
});
