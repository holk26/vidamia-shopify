# Connecting Your Shopify Store to Hydrogen

# Conectar tu tienda Shopify a Hydrogen

This guide explains how to connect your Hydrogen project to a Shopify store, enabling you to fetch products, collections, and other store data.

_Esta guía explica cómo conectar tu proyecto Hydrogen a una tienda Shopify, permitiéndote obtener productos, colecciones y otros datos de la tienda._

## Prerequisites / Requisitos previos

Before connecting your store, make sure you have:

_Antes de conectar tu tienda, asegúrate de tener:_

- A Shopify store (you can create a free development store at [shopify.com/partners](https://shopify.com/partners))
- Node.js version 18.0.0 or higher installed
- A Hydrogen project created with `npm create @shopify/hydrogen@latest`

_- Una tienda Shopify (puedes crear una tienda de desarrollo gratuita en [shopify.com/partners](https://shopify.com/partners))_
_- Node.js versión 18.0.0 o superior instalado_
_- Un proyecto Hydrogen creado con `npm create @shopify/hydrogen@latest`_

## Connecting Your Store / Conectar tu tienda

### Step 1: Link Your Hydrogen Project to a Storefront

### Paso 1: Vincular tu proyecto Hydrogen a una tienda

Run the link command in your project directory:

_Ejecuta el comando link en el directorio de tu proyecto:_

```bash
npm run shopify hydrogen link
# or / o
npx shopify hydrogen link
```

This command will:

1. Prompt you to log in to your Shopify Partner account
2. Ask you to select a store from your account
3. Show you a list of existing Hydrogen storefronts or allow you to create a new one

_Este comando:_

1. _Te pedirá que inicies sesión en tu cuenta de Shopify Partner_
2. _Te pedirá que selecciones una tienda de tu cuenta_
3. _Te mostrará una lista de storefronts Hydrogen existentes o te permitirá crear uno nuevo_

### Step 2: Choose or Create a Storefront

### Paso 2: Elegir o crear un Storefront

You have two options:

_Tienes dos opciones:_

**Option A: Link to an existing storefront**  
_Opción A: Vincular a un storefront existente_

Select an existing Hydrogen storefront from the list. This is useful if you're working on a project that already has a storefront configured.

_Selecciona un storefront Hydrogen existente de la lista. Esto es útil si estás trabajando en un proyecto que ya tiene un storefront configurado._

**Option B: Create a new storefront**  
_Opción B: Crear un nuevo storefront_

Choose "Create a new storefront" and provide a name for it. Shopify will automatically:

- Create a new Hydrogen storefront in your shop
- Generate necessary API tokens (Storefront API access token)
- Configure permissions

_Elige "Crear un nuevo storefront" y proporciona un nombre. Shopify automáticamente:_

- _Creará un nuevo storefront Hydrogen en tu tienda_
- _Generará los tokens API necesarios (token de acceso a Storefront API)_
- _Configurará los permisos_

### Step 3: Verify the Connection

### Paso 3: Verificar la conexión

After linking, your project will have a `.shopify` directory with a configuration file containing your storefront information.

_Después de vincular, tu proyecto tendrá un directorio `.shopify` con un archivo de configuración que contiene la información de tu storefront._

To verify the connection is working, start your development server:

_Para verificar que la conexión funciona, inicia tu servidor de desarrollo:_

```bash
npm run dev
```

Your Hydrogen app will now automatically use your linked storefront's environment variables, including the Storefront API access token.

_Tu aplicación Hydrogen ahora usará automáticamente las variables de entorno de tu storefront vinculado, incluyendo el token de acceso a Storefront API._

## Understanding Environment Variables / Entender las variables de entorno

When you link a storefront, Shopify automatically injects these environment variables at runtime:

_Cuando vinculas un storefront, Shopify inyecta automáticamente estas variables de entorno en tiempo de ejecución:_

- `PUBLIC_STOREFRONT_API_TOKEN` - Your Storefront API access token
- `PUBLIC_STORE_DOMAIN` - Your store's domain (e.g., "my-shop.myshopify.com")
- `PUBLIC_STOREFRONT_ID` - Your Hydrogen storefront ID

_- `PUBLIC_STOREFRONT_API_TOKEN` - Tu token de acceso a Storefront API_
_- `PUBLIC_STORE_DOMAIN` - El dominio de tu tienda (ej: "mi-tienda.myshopify.com")_
_- `PUBLIC_STOREFRONT_ID` - Tu ID de storefront Hydrogen_

These variables are automatically configured and you don't need to set them manually in development. The Hydrogen context (in `app/lib/context.ts`) uses these variables to configure the Storefront API client.

_Estas variables se configuran automáticamente y no necesitas establecerlas manualmente en desarrollo. El contexto de Hydrogen (en `app/lib/context.ts`) usa estas variables para configurar el cliente de Storefront API._

## Managing Environment Variables / Gestionar variables de entorno

### Viewing Environment Variables / Ver variables de entorno

To see all environment variables for your linked storefront:

_Para ver todas las variables de entorno de tu storefront vinculado:_

```bash
npx shopify hydrogen env list
```

### Pulling Environment Variables / Obtener variables de entorno

To download environment variables to a local `.env` file:

_Para descargar las variables de entorno a un archivo `.env` local:_

```bash
npx shopify hydrogen env pull
```

This is useful for:

- Production deployments outside of Oxygen
- Sharing environment variables with team members
- Backing up your configuration

_Esto es útil para:_

- _Despliegues de producción fuera de Oxygen_
- _Compartir variables de entorno con miembros del equipo_
- _Respaldar tu configuración_

### Pushing Environment Variables / Enviar variables de entorno

To update environment variables in your Hydrogen storefront:

_Para actualizar las variables de entorno en tu storefront Hydrogen:_

```bash
npx shopify hydrogen env push
```

## Switching Between Stores / Cambiar entre tiendas

If you need to link to a different store or storefront:

_Si necesitas vincular a una tienda o storefront diferente:_

```bash
npx shopify hydrogen link --force
```

The `--force` flag will skip the confirmation prompt and allow you to select a different storefront.

_La bandera `--force` omitirá el mensaje de confirmación y te permitirá seleccionar un storefront diferente._

## Unlinking a Store / Desvincular una tienda

To unlink your project from the current storefront:

_Para desvincular tu proyecto del storefront actual:_

```bash
npx shopify hydrogen unlink
```

This removes the local configuration but doesn't delete the storefront from your Shopify admin.

_Esto elimina la configuración local pero no borra el storefront de tu administración de Shopify._

## Troubleshooting / Solución de problemas

### "No shop found in local config"

### "No se encontró tienda en configuración local"

If you see this error, run `npx shopify hydrogen link` to connect your project to a store.

_Si ves este error, ejecuta `npx shopify hydrogen link` para conectar tu proyecto a una tienda._

### "Storefront API access token is missing"

### "Falta el token de acceso a Storefront API"

This usually means:

1. You haven't linked your project (`npx shopify hydrogen link`)
2. Your linked storefront wasn't created successfully (try running `npx shopify hydrogen link --force` to link again)

_Esto generalmente significa:_

1. _No has vinculado tu proyecto (`npx shopify hydrogen link`)_
2. _Tu storefront vinculado no se creó correctamente (intenta ejecutar `npx shopify hydrogen link --force` para vincular de nuevo)_

### Development server can't connect to Shopify

### El servidor de desarrollo no puede conectarse a Shopify

1. Verify your internet connection
2. Check that your store domain is correct: `npx shopify hydrogen env list`
3. Ensure your Storefront API token is valid
4. Try relinking: `npx shopify hydrogen link --force`

_1. Verifica tu conexión a internet_
_2. Verifica que el dominio de tu tienda sea correcto: `npx shopify hydrogen env list`_
_3. Asegúrate de que tu token de Storefront API sea válido_
_4. Intenta volver a vincular: `npx shopify hydrogen link --force`_

## Using Mock.shop for Development / Usar Mock.shop para desarrollo

If you don't have a Shopify store yet or want to use sample data, Hydrogen provides [Mock.shop](https://mock.shop) - a demo store with sample products and data.

_Si aún no tienes una tienda Shopify o quieres usar datos de ejemplo, Hydrogen proporciona [Mock.shop](https://mock.shop) - una tienda demo con productos y datos de ejemplo._

Mock.shop is automatically configured in new Hydrogen projects and doesn't require linking. However, to connect to your own store, you'll need to follow the steps above.

_Mock.shop está configurado automáticamente en nuevos proyectos Hydrogen y no requiere vinculación. Sin embargo, para conectarte a tu propia tienda, necesitarás seguir los pasos anteriores._

## Next Steps / Próximos pasos

After connecting your store:

_Después de conectar tu tienda:_

1. **Start developing**: Run `npm run dev` to start your local development server
2. **Explore your data**: Visit your routes to see products, collections, and other store data
3. **Customize queries**: Modify GraphQL queries in your routes to fetch the data you need
4. **Deploy to Oxygen**: When ready, deploy your Hydrogen app to Shopify's Oxygen hosting platform

_1. **Comienza a desarrollar**: Ejecuta `npm run dev` para iniciar tu servidor de desarrollo local_
_2. **Explora tus datos**: Visita tus rutas para ver productos, colecciones y otros datos de la tienda_
_3. **Personaliza consultas**: Modifica las consultas GraphQL en tus rutas para obtener los datos que necesitas_
_4. **Despliega a Oxygen**: Cuando estés listo, despliega tu aplicación Hydrogen a la plataforma de hosting Oxygen de Shopify_

## Additional Resources / Recursos adicionales

- [Hydrogen Documentation](https://shopify.dev/custom-storefronts/hydrogen)
- [Storefront API Reference](https://shopify.dev/api/storefront)
- [Shopify CLI for Hydrogen](https://shopify.dev/docs/api/shopify-cli/hydrogen)
- [Hydrogen Discord Community](https://discord.gg/shopifydevs)

_- [Documentación de Hydrogen](https://shopify.dev/custom-storefronts/hydrogen)_
_- [Referencia de Storefront API](https://shopify.dev/api/storefront)_
_- [CLI de Shopify para Hydrogen](https://shopify.dev/docs/api/shopify-cli/hydrogen)_
_- [Comunidad Discord de Hydrogen](https://discord.gg/shopifydevs)_
