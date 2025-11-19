# Deploying to Vercel

This Hydrogen storefront is configured for deployment on Vercel.

## Prerequisites

- A Vercel account (sign up at [vercel.com](https://vercel.com))
- A Shopify store with Storefront API access
- Node.js 18.0.0 or higher

## Environment Variables

Before deploying, you'll need to configure the following environment variables in your Vercel project settings:

### Required Variables

```bash
# Shopify Store Configuration
PUBLIC_STORE_DOMAIN=your-store.myshopify.com
PUBLIC_STOREFRONT_API_TOKEN=your_storefront_api_token
PUBLIC_STOREFRONT_API_VERSION=2025-07

# Customer Account API (optional, for account features)
PUBLIC_CUSTOMER_ACCOUNT_API_CLIENT_ID=your_client_id
PUBLIC_CUSTOMER_ACCOUNT_API_URL=https://shopify.com/XXXXXX

# Checkout Configuration
PUBLIC_CHECKOUT_DOMAIN=your-store.myshopify.com

# Session Secret (generate a random string)
SESSION_SECRET=your_random_session_secret_here
```

## Deployment Steps

### 1. Deploy via Vercel Dashboard

1. Go to [vercel.com/new](https://vercel.com/new)
2. Import your GitHub repository
3. Vercel will automatically detect the configuration from `vercel.json`
4. Add the environment variables in the "Environment Variables" section
5. Click "Deploy"

### 2. Deploy via Vercel CLI

```bash
# Install Vercel CLI
npm i -g vercel

# Login to Vercel
vercel login

# Deploy to production
vercel --prod
```

### 3. Configure Environment Variables via CLI

```bash
# Set environment variables
vercel env add PUBLIC_STORE_DOMAIN production
vercel env add PUBLIC_STOREFRONT_API_TOKEN production
vercel env add SESSION_SECRET production
# ... add all other variables
```

## Build Configuration

The build is configured in `vercel.json`:

- **Build Command**: `npm run build`
- **Install Command**: `npm install`
- **Framework**: None (custom React Router setup)
- **Region**: `iad1` (US East)

## Local Development

To test the app locally:

```bash
# Install dependencies
npm install

# Start development server
npm run dev
```

The app will be available at `http://localhost:3000`

## Troubleshooting

### Build Fails

- Check that all environment variables are set correctly
- Ensure Node.js version is 18.0.0 or higher
- Review build logs in Vercel dashboard

### Runtime Errors

- Verify Shopify API credentials are correct
- Check that PUBLIC_STORE_DOMAIN matches your Shopify store
- Ensure API version is supported (currently 2025-07)

### Session Issues

- Make sure SESSION_SECRET is set and is a long random string
- Do not commit SESSION_SECRET to version control

## Post-Deployment

After successful deployment:

1. Configure your custom domain in Vercel dashboard (optional)
2. Test all functionality including cart, checkout, and search
3. Set up Vercel Analytics for monitoring (optional)
4. Configure caching rules if needed

## Resources

- [Vercel Documentation](https://vercel.com/docs)
- [Hydrogen Documentation](https://shopify.dev/docs/custom-storefronts/hydrogen)
- [Shopify Storefront API](https://shopify.dev/docs/api/storefront)
