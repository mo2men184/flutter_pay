const functions = require('firebase-functions');
const express = require('express');
const app = express();
const cors = require('cors');
const bodyParser = require('body-parser');

app.use(cors({ origin: true }));
app.use(bodyParser.json());

// Endpoint to handle Stripe webhook events
app.post('/stripe-webhook', async (req, res) => {
  // Verify the webhook signature from Stripe (optional but recommended)
  // Example: Verify signature
  const webhookSecret = 'your_stripe_webhook_secret';
  const stripe = require('stripe')('your_stripe_secret_key');
  
  let event;
  try {
    event = stripe.webhooks.constructEvent(
      req.rawBody,
      req.headers['stripe-signature'],
      webhookSecret
    );
  } catch (err) {
    console.error('Webhook signature verification failed.', err.message);
    return res.status(400).send(`Webhook Error: ${err.message}`);
  }

  // Handle the event based on its type
  switch (event.type) {
    case 'payment_intent.succeeded':
      // Handle successful payment intent event
      console.log('Payment intent succeeded:', event.data.object);
      // Implement your business logic here
      break;
    case 'payment_intent.payment_failed':
      // Handle payment failure event
      console.log('Payment intent failed:', event.data.object);
      // Implement your business logic here
      break;
    default:
      console.log(`Unhandled event type: ${event.type}`);
  }

  // Return a response to acknowledge receipt of the event
  res.json({ received: true });
});

// Endpoint to handle PayPal webhook events
app.post('/paypal-webhook', async (req, res) => {
  // Handle PayPal webhook events
  // Example: Handle PayPal webhook events
  console.log('PayPal webhook received:', req.body);
  
  // Implement your business logic here

  // Return a response to acknowledge receipt of the event
  res.json({ received: true });
});

// Endpoint to handle Square webhook events
app.post('/square-webhook', async (req, res) => {
  // Handle Square webhook events
  // Example: Handle Square webhook events
  console.log('Square webhook received:', req.body);

  // Implement your business logic here

  // Return a response to acknowledge receipt of the event
  res.json({ received: true });
});

// Create an HTTPS function that will be triggered by HTTP requests
exports.paymentWebhooks = functions.https.onRequest(app);
