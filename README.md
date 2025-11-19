# Vidamia Shopify - Hydrogen Storefront

A Shopify Hydrogen storefront configured for deployment on Vercel.

## 🚀 Quick Start

**Requirements:**
- Node.js version 18.0.0 or higher

### Local Development

```bash
# Install dependencies
npm install

# Start development server
npm run dev
```

Visit [http://localhost:3000](http://localhost:3000) to see your storefront.

## 📦 What's Included

- **React Router 7** - Modern routing framework
- **Hydrogen** - Shopify's headless commerce toolkit
- **Vite** - Fast build tool and dev server
- **TypeScript** - Type-safe development
- **Shopify CLI** - Development and deployment tools
- **GraphQL Codegen** - Automated type generation
- **ESLint & Prettier** - Code quality tools

## 🛠️ Available Scripts

- `npm run dev` - Start development server
- `npm run build` - Build for production
- `npm run preview` - Preview production build locally
- `npm run lint` - Run ESLint
- `npm run typecheck` - Run TypeScript type checking
- `npm run codegen` - Generate GraphQL types

## 🌐 Deployment

This storefront is configured for easy deployment on **Vercel**.

See [DEPLOYMENT.md](./DEPLOYMENT.md) for detailed deployment instructions.

### Quick Deploy to Vercel

[![Deploy with Vercel](https://vercel.com/button)](https://vercel.com/new/clone?repository-url=https://github.com/holk26/vidamia-shopify)

## ⚙️ Configuration

### Environment Variables

Copy `.env` to create your local environment configuration:

```bash
cp .env .env.local
```

Required variables:
- `PUBLIC_STORE_DOMAIN` - Your Shopify store domain
- `PUBLIC_STOREFRONT_API_TOKEN` - Storefront API access token
- `SESSION_SECRET` - Secret for session management

See [DEPLOYMENT.md](./DEPLOYMENT.md) for complete environment variable list.

## 📚 Resources

- [Hydrogen Documentation](https://shopify.dev/docs/custom-storefronts/hydrogen)
- [React Router Documentation](https://reactrouter.com)
- [Shopify Storefront API](https://shopify.dev/docs/api/storefront)
- [Vercel Documentation](https://vercel.com/docs)

## 📝 License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.
