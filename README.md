# ecommerce_riverpod_flutter (en proceso...)

Flutter + Riverpod + REST API

Aplicación móvil de e-commerce desarrollada en Flutter utilizando Riverpod para el manejo de estado y consumo de una API REST real.

El proyecto implementa autenticación, gestión de productos y validaciones avanzadas siguiendo una arquitectura modular y escalable.

---

## ✨ Características principales

✅ Autenticación (Login / Registro)  
✅ Validación avanzada de formularios con Formz  
✅ Consumo de API REST real  
✅ Manejo de estado con Riverpod  
✅ Arquitectura por features  
✅ Manejo de errores de red  
✅ Navegación con GoRouter  
✅ UI responsive  

---

## 🧱 Tecnologías utilizadas

- Flutter
- Dart
- Riverpod
- GoRouter
- Formz
- Dio (en proceso..)
- REST API (en proceso...)

---

## 🏗️ Arquitectura

El proyecto está estructurado siguiendo el patrón **feature-first**, separando cada módulo en:

- lib/
- ├── config/
- │ ├── router/
- │ └── theme/
- ├── features/
- │ ├── auth/
- │ │ ├── domain/
- │ │ ├── infrastructure/
- │ │ └── presentation/
- │ ├── products/
- │ └── shared/
- └── main.dart

Se aplica separación de responsabilidades:

- **Presentation:** UI + Providers
- **Domain:** Entidades y contratos
- **Infrastructure:** Implementaciones API

---

## 🌐 Integración API

La aplicación consume una API REST real para:

- Registro de usuarios
- Autenticación
- Obtención de productos
- (Opcional: carrito / órdenes si lo implementas)

Se manejan:

- Estados de carga
- Errores de red
- Respuestas HTTP
- Parsing de modelos

---

## 🚀 Instalación

### Clonar repositorio

```bash
git clone https://github.com/Zetien/ecomerce_riverpod_flutter.git
cd ecomerce_riverpod_flutter
flutter pub get
flutter run

```

---

## 📈 Objetivo del proyecto (En proceso...)

Este proyecto fue desarrollado como práctica avanzada para reforzar:

Arquitectura limpia en Flutter

Manejo de estado moderno con Riverpod

Integración real con backend

Buenas prácticas en desarrollo móvil

---

## 👨‍💻 Autor

Jorge Zetien
Ingeniero de Sistemas
Flutter Mobile Developer

GitHub: https://github.com/Zetien

---