# Vidamia - Diseño con Colores Pastel

Este documento describe la paleta de colores pastel personalizada para la marca Vidamia implementada en el tema Hydrogen.

## Paleta de Colores

### Colores Primarios Pastel

| Color | Código HEX | Variable CSS | Uso |
|-------|-----------|--------------|-----|
| 🌸 Rosa Pastel | `#ffd6e0` | `--pastel-pink` | Acentos, gradientes de header |
| 💜 Lavanda Pastel | `#e8d5f2` | `--pastel-lavender` | Header, color primario, botones |
| 💙 Azul Pastel | `#cce7ff` | `--pastel-blue` | Elementos secundarios, opciones de producto |
| 🌿 Menta Pastel | `#d4f1e8` | `--pastel-mint` | Footer, formularios de búsqueda |
| 🍑 Durazno Pastel | `#ffe5d4` | `--pastel-peach` | Resumen del carrito, acentos cálidos |
| 🌼 Amarillo Pastel | `#fff5cc` | `--pastel-yellow` | Fondo degradado, badges |

### Colores Secundarios Pastel

| Color | Código HEX | Variable CSS | Uso |
|-------|-----------|--------------|-----|
| 🌺 Rosa Intenso | `#ffc5d9` | `--pastel-rose` | Estados hover, variantes |
| 🔮 Púrpura Pastel | `#d9c3f0` | `--pastel-purple` | Enlaces hover, elementos activos |
| ☁️ Cielo Pastel | `#b8e0ff` | `--pastel-sky` | Estados hover de botones |
| 🍃 Salvia Pastel | `#c1e9dc` | `--pastel-sage` | Elementos naturales |
| 🪸 Coral Pastel | `#ffcdb8` | `--pastel-coral` | Badges, tags, etiquetas |
| 🍋 Limón Pastel | `#fff0a8` | `--pastel-lemon` | Destacados, notificaciones |

### Colores Base

| Color | Código HEX | Variable CSS | Uso |
|-------|-----------|--------------|-----|
| ⚫ Oscuro | `#2c2c2c` | `--color-dark` | Texto principal |
| ⚪ Claro | `#fef9f3` | `--color-light` | Fondos, tarjetas |
| 🎨 Borde | `#e8d9f0` | `--color-border` | Bordes de elementos |
| ✨ Sombra | `rgba(232, 213, 242, 0.3)` | `--color-shadow` | Sombras suaves |

## Implementación de Gradientes

### Header
```css
background: linear-gradient(135deg, var(--pastel-lavender) 0%, var(--pastel-pink) 100%);
```
Gradiente diagonal de lavanda a rosa - crea un efecto suave y acogedor.

### Footer
```css
background: linear-gradient(135deg, var(--pastel-mint) 0%, var(--pastel-blue) 100%);
```
Gradiente diagonal de menta a azul - transmite frescura y calma.

### Fondo del Body
```css
background: linear-gradient(to bottom, var(--color-light) 0%, var(--pastel-yellow) 100%);
```
Gradiente vertical de claro a amarillo suave - ambiente cálido y luminoso.

## Características del Diseño

### 🎨 Estética Visual
- **Suavidad**: Colores pastel que no cansan la vista
- **Feminidad**: Paleta predominantemente rosa-lavanda
- **Calidez**: Tonos melocotón y amarillo para acoger
- **Frescura**: Toques de menta y azul para equilibrio

### ✨ Efectos Interactivos
- **Botones**: Transformación y gradiente invertido al hover
- **Tarjetas**: Elevación con sombra pastel al hover
- **Inputs**: Borde lavanda y sombra suave al focus
- **Transiciones**: 0.3s ease para movimientos fluidos

### 🎯 Elementos Específicos

#### Botones
```css
background: linear-gradient(135deg, var(--pastel-lavender) 0%, var(--pastel-pink) 100%);
border: 2px solid var(--color-border);
border-radius: 8px;
```

#### Inputs y Formularios
```css
background: var(--color-light);
border: 2px solid var(--color-border);
border-radius: 8px;
```

#### Tarjetas de Producto
```css
border-radius: 12px;
box-shadow: 0 8px 20px var(--color-shadow);
```

## Guía de Uso

### Para Desarrolladores

**Usar colores primarios para:**
- Elementos principales de navegación
- Botones de acción primaria
- Headers y footers

**Usar colores secundarios para:**
- Estados hover
- Elementos activos/seleccionados
- Badges y etiquetas

**Usar colores base para:**
- Texto y contenido
- Fondos de secciones
- Bordes y separadores

### Accesibilidad

Los colores han sido seleccionados para:
- ✅ Contraste suficiente con texto oscuro
- ✅ Agradable a la vista durante períodos prolongados
- ✅ Diferenciación clara entre estados (normal/hover/active)
- ✅ Legibilidad en diferentes dispositivos

## Ejemplo de Componente Completo

```css
.vidamia-card {
  background: var(--color-light);
  border: 2px solid var(--color-border);
  border-radius: 12px;
  padding: 1.5rem;
  transition: all 0.3s ease;
}

.vidamia-card:hover {
  transform: translateY(-4px);
  box-shadow: 0 8px 20px var(--color-shadow);
}

.vidamia-card-header {
  background: linear-gradient(135deg, var(--pastel-lavender) 0%, var(--pastel-pink) 100%);
  padding: 1rem;
  border-radius: 8px;
  margin-bottom: 1rem;
}

.vidamia-badge {
  background: var(--pastel-coral);
  color: var(--color-dark);
  padding: 0.25rem 0.75rem;
  border-radius: 20px;
  font-size: 0.875rem;
  font-weight: 600;
}
```

## Personalización

Para ajustar los colores, edita las variables CSS en `app/styles/app.css`:

```css
:root {
  /* Cambia estos valores según necesites */
  --pastel-pink: #ffd6e0;
  --pastel-lavender: #e8d5f2;
  /* ... más colores ... */
}
```

## Compatibilidad

- ✅ Todos los navegadores modernos
- ✅ Responsive en móviles y tablets
- ✅ Compatible con modo oscuro (ajustar si es necesario)
- ✅ Optimizado para rendimiento

## Recursos Adicionales

- [Teoría del Color](https://www.shopify.com/blog/color-theory)
- [Psicología de Colores en E-commerce](https://www.shopify.com/blog/color-psychology)
- [Accesibilidad Web](https://www.w3.org/WAI/WCAG21/quickref/)

---

**Marca Vidamia** - Diseño pastel suave y acogedor para una experiencia de compra memorable. 🌸✨
