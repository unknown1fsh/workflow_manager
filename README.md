# 🚀 Workflow Manager

<div align="center">

![Workflow Manager](https://img.shields.io/badge/Workflow-Manager-blue?style=for-the-badge)
![Spring Boot](https://img.shields.io/badge/Spring%20Boot-3.x-brightgreen?style=for-the-badge&logo=spring)
![Angular](https://img.shields.io/badge/Angular-17-red?style=for-the-badge&logo=angular)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)

**Modern İş Akışı Yönetim Sistemi | Enterprise Workflow Management Platform**

[Features](#-özellikler--features) • [Quick Start](#-hızlı-başlangıç--quick-start) • [Tech Stack](#-teknoloji-yığını--tech-stack) • [API Docs](#-api-dokümantasyonu--api-documentation)

</div>

---

## 📋 İçindekiler | Table of Contents

- [Genel Bakış | Overview](#-genel-bakış--overview)
- [Özellikler | Features](#-özellikler--features)
- [Teknoloji Yığını | Tech Stack](#-teknoloji-yığını--tech-stack)
- [Hızlı Başlangıç | Quick Start](#-hızlı-başlangıç--quick-start)
- [Proje Yapısı | Project Structure](#-proje-yapısı--project-structure)
- [API Dokümantasyonu | API Documentation](#-api-dokümantasyonu--api-documentation)
- [Ekran Görüntüleri | Screenshots](#-ekran-görüntüleri--screenshots)
- [Katkıda Bulunma | Contributing](#-katkıda-bulunma--contributing)

---

## 🎯 Genel Bakış | Overview

**Workflow Manager**, iş süreçlerinizi dijitalleştirip optimize eden kurumsal bir platformdur. Spring Boot ve Angular 17 ile güvenli, ölçeklenebilir yapı sunar. Adım, durum ve görev yönetimini kolaylaştırır.

**Workflow Manager** is an enterprise platform that digitizes and optimizes your business processes. Built with Spring Boot and Angular 17, it provides a secure, scalable architecture. It simplifies step, status, and task management.

### ✨ Temel Özellikler | Key Features

- 🔐 **Güvenli Kimlik Doğrulama | Secure Authentication**: JWT-based authentication system
- 👥 **Rol Tabanlı Erişim | Role-Based Access**: Admin, Operator, Viewer roles
- 📊 **Dashboard & Analytics**: Real-time statistics and monitoring
- 🔄 **Workflow Management**: Create, update, and track workflows
- ✅ **Step Tracking**: Monitor workflow steps with status management
- 🎨 **Modern UI**: PrimeNG components with responsive design
- 📱 **Mobile Responsive**: Works seamlessly on all devices

---

## 🎨 Özellikler | Features

### 🔹 Kullanıcı Yönetimi | User Management
- Kullanıcı oluşturma, güncelleme ve silme
- Rol bazlı yetkilendirme (Admin, Operator, Viewer)
- Aktif/Pasif kullanıcı durumu yönetimi
- Create, update, and delete users
- Role-based authorization (Admin, Operator, Viewer)
- Active/Inactive user status management

### 🔹 İş Akışı Yönetimi | Workflow Management
- İş akışı oluşturma ve düzenleme
- Adım bazlı süreç takibi
- Durum yönetimi (Beklemede, Onaylandı, Reddedildi)
- Create and edit workflows
- Step-based process tracking
- Status management (Pending, Approved, Rejected)

### 🔹 Dashboard & İstatistikler | Dashboard & Statistics
- Gerçek zamanlı istatistikler
- Kullanıcı, iş akışı ve adım sayıları
- Hızlı erişim butonları
- Real-time statistics
- User, workflow, and step counts
- Quick access buttons

---

## 🛠 Teknoloji Yığını | Tech Stack

### Backend
- **Java 17**
- **Spring Boot 3.x**
- **Spring Security** - JWT Authentication
- **Spring Data JPA** - Database operations
- **MapStruct** - DTO mapping
- **MySQL** - Database
- **Swagger/OpenAPI** - API documentation
- **Maven** - Build tool

### Frontend
- **Angular 17**
- **TypeScript**
- **PrimeNG 17** - UI Component Library
- **PrimeFlex** - CSS Utility Framework
- **RxJS** - Reactive programming
- **Angular Material** - Additional UI components

---

## 🚀 Hızlı Başlangıç | Quick Start

### Gereksinimler | Requirements

- Java 17+
- Node.js 18+
- MySQL 8.0+
- Maven 3.6+

### Backend Kurulumu | Backend Setup

```bash
# Projeyi klonlayın | Clone the repository
git clone https://github.com/unknown1fsh/workflow_manager.git
cd workflow_manager/workflow-manager

# Veritabanı yapılandırması | Database configuration
# application.properties dosyasını düzenleyin | Edit application.properties
spring.datasource.url=jdbc:mysql://localhost:3306/workflow_db
spring.datasource.username=root
spring.datasource.password=your_password

# Uygulamayı çalıştırın | Run the application
./mvnw spring-boot:run
# veya Windows için | or for Windows
mvnw.cmd spring-boot:run
```

Backend `http://localhost:8080` adresinde çalışacaktır.

### Frontend Kurulumu | Frontend Setup

```bash
# Frontend dizinine gidin | Navigate to frontend directory
cd ../workflow-manager-ui

# Bağımlılıkları yükleyin | Install dependencies
npm install

# Development server'ı başlatın | Start development server
ng serve
```

Frontend `http://localhost:4200` adresinde çalışacaktır.

### Hızlı Başlatma | Quick Launch

Windows kullanıcıları için batch dosyaları:

```bash
# Backend'i başlat | Start backend
backend.bat

# Frontend'i başlat | Start frontend
frontend.bat

# Her ikisini birden başlat | Start both
fullstack.bat
```

---

## 📁 Proje Yapısı | Project Structure

```
workflow_manager/
├── workflow-manager/          # Backend (Spring Boot)
│   ├── src/
│   │   ├── main/
│   │   │   ├── java/
│   │   │   │   └── com/smartworkflow/workflow_manager/
│   │   │   │       ├── controller/     # REST Controllers
│   │   │   │       ├── service/        # Business Logic
│   │   │   │       ├── repository/     # Data Access
│   │   │   │       ├── entity/         # JPA Entities
│   │   │   │       ├── dto/           # Data Transfer Objects
│   │   │   │       ├── mapper/        # MapStruct Mappers
│   │   │   │       ├── config/        # Configuration
│   │   │   │       └── exception/     # Exception Handling
│   │   │   └── resources/
│   │   │       └── application.properties
│   │   └── test/
│   └── pom.xml
│
└── workflow-manager-ui/       # Frontend (Angular)
    ├── src/
    │   ├── app/
    │   │   ├── core/          # Core services, guards, interceptors
    │   │   ├── features/      # Feature modules
    │   │   │   ├── auth/      # Authentication
    │   │   │   ├── dashboard/ # Dashboard
    │   │   │   ├── users/     # User management
    │   │   │   ├── workflows/ # Workflow management
    │   │   │   └── steps/     # Step management
    │   │   └── shared/        # Shared components, models
    │   ├── assets/
    │   └── environments/
    └── package.json
```

---

## 📚 API Dokümantasyonu | API Documentation

Backend çalıştıktan sonra Swagger UI'ya erişebilirsiniz:

**Swagger UI**: http://localhost:8080/swagger-ui.html

**API Docs (JSON)**: http://localhost:8080/v3/api-docs

### API Endpoints

#### 👥 Kullanıcı İşlemleri | User Operations
- `GET /api/users` - Tüm kullanıcıları listele | Get all users
- `GET /api/users/{id}` - Kullanıcı detayı | Get user by ID
- `POST /api/users` - Yeni kullanıcı oluştur | Create new user
- `PUT /api/users/{id}` - Kullanıcı güncelle | Update user
- `DELETE /api/users/{id}` - Kullanıcı sil | Delete user

#### 🔄 İş Akışı İşlemleri | Workflow Operations
- `GET /api/workflows` - Tüm iş akışlarını listele | Get all workflows
- `GET /api/workflows/{id}` - İş akışı detayı | Get workflow by ID
- `POST /api/workflows` - Yeni iş akışı oluştur | Create new workflow
- `PUT /api/workflows/{id}` - İş akışı güncelle | Update workflow
- `DELETE /api/workflows/{id}` - İş akışı sil | Delete workflow

#### ✅ Adım İşlemleri | Step Operations
- `GET /api/steps` - Tüm adımları listele | Get all steps
- `GET /api/steps/{id}` - Adım detayı | Get step by ID
- `GET /api/steps/workflow/{workflowId}` - İş akışına ait adımlar | Get steps by workflow
- `POST /api/steps` - Yeni adım oluştur | Create new step
- `PUT /api/steps/{id}` - Adım güncelle | Update step
- `DELETE /api/steps/{id}` - Adım sil | Delete step

---

## 🎨 Ekran Görüntüleri | Screenshots

### 🏠 Dashboard
Modern ve kullanıcı dostu dashboard arayüzü ile tüm istatistiklere tek bakışta erişin.

Modern and user-friendly dashboard interface to access all statistics at a glance.

### 📋 İş Akışı Listesi | Workflow List
Tüm iş akışlarınızı görüntüleyin, düzenleyin ve yönetin.

View, edit, and manage all your workflows.

### 👤 Kullanıcı Yönetimi | User Management
Kullanıcıları kolayca yönetin, roller atayın ve yetkilendirin.

Easily manage users, assign roles, and authorize.

---

## 🔒 Güvenlik | Security

- **JWT Authentication**: Secure token-based authentication
- **Password Encryption**: BCrypt password hashing
- **CORS Configuration**: Cross-origin resource sharing setup
- **Role-Based Access Control**: Granular permission system
- **Input Validation**: Comprehensive validation on all endpoints

---

## 🧪 Test | Testing

```bash
# Backend testleri | Backend tests
cd workflow-manager
./mvnw test

# Frontend testleri | Frontend tests
cd workflow-manager-ui
npm test
```

---

## 📝 Lisans | License

Bu proje MIT lisansı altında lisanslanmıştır.

This project is licensed under the MIT License.

---

## 👥 Katkıda Bulunma | Contributing

Katkılarınızı bekliyoruz! Lütfen önce bir issue açın veya pull request gönderin.

Contributions are welcome! Please open an issue first or submit a pull request.

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

---

## 📧 İletişim | Contact

**Proje Sahibi | Project Owner**: unknown1fsh

**GitHub**: [https://github.com/unknown1fsh/workflow_manager](https://github.com/unknown1fsh/workflow_manager)

---

<div align="center">

**⭐ Bu projeyi beğendiyseniz yıldız vermeyi unutmayın! | If you liked this project, don't forget to give it a star! ⭐**

Made with ❤️ using Spring Boot & Angular

</div>
