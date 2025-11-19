# Desplegar tu tienda Hydrogen en Vercel

Esta guía explica cómo desplegar tu proyecto Hydrogen en Vercel, una plataforma de hosting para aplicaciones web modernas.

## Requisitos previos

Antes de desplegar en Vercel, asegúrate de tener:

- Una cuenta en [Vercel](https://vercel.com) (puedes registrarte gratis)
- Tu proyecto Hydrogen funcionando localmente
- Tu proyecto conectado a Git (GitHub, GitLab, o Bitbucket)
- Tu tienda Shopify vinculada al proyecto (ver [guía de conexión](../connectStore/connectStore.md))

## Paso 1: Preparar tu proyecto

### 1.1 Configurar variables de entorno

Primero, obtén todas las variables de entorno de tu proyecto:

```bash
npx shopify hydrogen env pull
```

Este comando creará un archivo `.env` con todas las variables necesarias. Necesitarás estas variables para configurar Vercel.

### 1.2 Verificar la configuración de build

Asegúrate de que tu `package.json` tenga el script de build configurado:

```json
{
  "scripts": {
    "build": "shopify hydrogen build --codegen",
    "preview": "shopify hydrogen preview --build"
  }
}
```

## Paso 2: Conectar tu repositorio a Vercel

### 2.1 Importar proyecto

1. Ve a [vercel.com/new](https://vercel.com/new)
2. Selecciona "Import Git Repository"
3. Elige tu proveedor de Git (GitHub, GitLab, Bitbucket)
4. Autoriza a Vercel para acceder a tus repositorios
5. Selecciona el repositorio de tu proyecto Hydrogen

### 2.2 Configurar el proyecto

Vercel detectará automáticamente que es un proyecto de React Router. Configura:

**Framework Preset**: React Router (o Remix si aparece)
**Root Directory**: `./` (raíz del proyecto)
**Build Command**: `npm run build`
**Output Directory**: `build/client` (Vercel lo detecta automáticamente)

## Paso 3: Configurar variables de entorno

En la sección "Environment Variables" de Vercel, agrega las siguientes variables desde tu archivo `.env`:

### Variables requeridas:

```
PUBLIC_STOREFRONT_API_TOKEN=tu-token-aqui
PUBLIC_STORE_DOMAIN=tu-tienda.myshopify.com
PUBLIC_STOREFRONT_ID=gid://shopify/HydrogenStorefront/tu-id
SESSION_SECRET=tu-secret-aqui
```

### Variables opcionales:

```
PUBLIC_CUSTOMER_ACCOUNT_API_CLIENT_ID=tu-client-id
PUBLIC_CUSTOMER_ACCOUNT_API_URL=https://shopify.com/tu-shop-id
```

**Importante**: No incluyas el prefijo `PUBLIC_` en Vercel para variables que no sean públicas como `SESSION_SECRET`.

## Paso 4: Ajustar configuración de Vercel

### 4.1 Crear archivo vercel.json

En la raíz de tu proyecto, crea un archivo `vercel.json`:

```json
{
  "buildCommand": "npm run build",
  "devCommand": "npm run dev",
  "installCommand": "npm install",
  "framework": null,
  "outputDirectory": "build/client"
}
```

### 4.2 Configurar para Oxygen Runtime (Opcional)

Si tu proyecto usa características específicas de Oxygen, considera usar el adaptador de Vercel:

```bash
npm install @vercel/remix
```

Actualiza tu `vite.config.ts` si es necesario para compatibilidad con Vercel Edge Functions.

## Paso 5: Desplegar

### Primer despliegue

Después de configurar todo:

1. Haz clic en "Deploy" en Vercel
2. Espera a que termine el proceso de build (generalmente 2-5 minutos)
3. Vercel te dará una URL de producción (ej: `tu-proyecto.vercel.app`)

### Despliegues automáticos

Vercel desplegará automáticamente:
- **Production**: Cada push a la rama `main` o `master`
- **Preview**: Cada push a otras ramas o pull requests

## Paso 6: Verificar el despliegue

1. Visita la URL proporcionada por Vercel
2. Verifica que la tienda cargue correctamente
3. Prueba las funciones principales:
   - Navegación de productos
   - Carrito de compras
   - Búsqueda
   - Cuenta de cliente (si está habilitada)

## Solución de problemas

### Error: "Build failed"

**Problema**: El build falla en Vercel pero funciona localmente.

**Solución**:
1. Verifica que todas las variables de entorno estén configuradas
2. Asegúrate de que `package-lock.json` esté en tu repositorio
3. Revisa los logs de build en Vercel para el error específico

### Error: "Module not found"

**Problema**: Vercel no encuentra módulos después del despliegue.

**Solución**:
1. Verifica que todas las dependencias estén en `dependencies` (no solo en `devDependencies`)
2. Ejecuta `npm install` localmente y confirma que `package-lock.json` está actualizado
3. Haz commit y push de los cambios

### Error: "Environment variable not defined"

**Problema**: Variables de entorno no están disponibles.

**Solución**:
1. Ve a Settings → Environment Variables en Vercel
2. Asegúrate de agregar las variables para todos los entornos (Production, Preview, Development)
3. Redespliega el proyecto

### Problemas de rendimiento

**Problema**: El sitio es lento en Vercel.

**Solución**:
1. Activa el caché de Vercel para recursos estáticos
2. Optimiza las imágenes usando `@shopify/hydrogen` image optimization
3. Considera usar Vercel Edge Functions para mejor rendimiento global
4. Revisa el uso de `defer` y `await` en tus loaders

## Dominios personalizados

### Agregar un dominio

1. Ve a Settings → Domains en tu proyecto Vercel
2. Haz clic en "Add Domain"
3. Ingresa tu dominio (ej: `www.vidamia.com`)
4. Sigue las instrucciones para configurar DNS:
   - **Para subdominios**: Agrega un registro CNAME apuntando a `cname.vercel-dns.com`
   - **Para dominios raíz**: Agrega un registro A con la IP de Vercel

### Configurar Customer Account API con dominio personalizado

Si usas Customer Account API, actualiza la configuración en Shopify:

1. Ve a tu Shopify Admin
2. Settings → Customer Accounts → Hydrogen storefronts
3. Actualiza la URL de producción con tu dominio personalizado
4. Ejecuta: `npx shopify hydrogen customer-account push --dev-origin https://tu-dominio.com`

## Optimizaciones para producción

### 1. Configurar caché

Agrega headers de caché en `vercel.json`:

```json
{
  "headers": [
    {
      "source": "/build/(.*)",
      "headers": [
        {
          "key": "Cache-Control",
          "value": "public, max-age=31536000, immutable"
        }
      ]
    }
  ]
}
```

### 2. Habilitar compresión

Vercel habilita compresión automáticamente, pero asegúrate de:
- Minimizar el tamaño del bundle
- Usar code splitting
- Lazy loading para componentes grandes

### 3. Monitoreo

Configura monitoreo en Vercel:
1. Ve a Analytics en tu proyecto
2. Habilita Web Vitals tracking
3. Configura alertas para errores

## Comparación: Vercel vs Oxygen

| Característica | Vercel | Oxygen |
|---------------|--------|--------|
| Integración Shopify | Manual | Nativa |
| Despliegue | Git-based | Git-based + CLI |
| Variables de entorno | Manual | Auto-inyectadas |
| Edge Network | Global | Shopify CDN |
| Precio | Gratis + planes pagos | Incluido con Shopify |
| Soporte Hydrogen | Compatible | Optimizado |

**Recomendación**: Oxygen es la opción recomendada para proyectos Hydrogen en producción por su integración nativa. Usa Vercel para:
- Desarrollo y testing
- Proyectos que requieren features específicas de Vercel
- Integración con otros servicios de Vercel

## Desplegar en Oxygen (Alternativa recomendada)

Para desplegar en Oxygen (plataforma oficial de Shopify):

```bash
npx shopify hydrogen deploy
```

Oxygen ofrece:
- Integración automática con tu Hydrogen storefront
- Variables de entorno auto-inyectadas
- Sin configuración adicional
- Optimizado para Shopify

## Próximos pasos

Después de desplegar exitosamente:

1. **Configurar Analytics**: Integra Google Analytics o Shopify Analytics
2. **Optimizar SEO**: Configura meta tags y sitemap
3. **Monitorear rendimiento**: Usa Vercel Analytics o herramientas externas
4. **Configurar CI/CD**: Automatiza tests antes del despliegue
5. **Backup**: Mantén backups de tu configuración

## Recursos adicionales

- [Documentación de Vercel](https://vercel.com/docs)
- [Hydrogen Deployment Guide](https://shopify.dev/docs/custom-storefronts/hydrogen/deployment)
- [React Router on Vercel](https://vercel.com/docs/frameworks/react-router)
- [Vercel Environment Variables](https://vercel.com/docs/concepts/projects/environment-variables)
- [Oxygen vs Other Platforms](https://shopify.dev/docs/custom-storefronts/hydrogen/deployment#oxygen-vs-other-platforms)

## Soporte

- **Vercel**: [support@vercel.com](mailto:support@vercel.com) o [comunidad](https://github.com/vercel/vercel/discussions)
- **Hydrogen**: [Discord de Shopify](https://discord.gg/shopifydevs)
- **Documentación**: [shopify.dev/hydrogen](https://shopify.dev/custom-storefronts/hydrogen)
