# Booking App - Flutter with API Integration

แอพจองคิวอย่างง่ายพร้อม API Integration ใช้ NestJS Backend และ MongoDB

## Features

- ✅ Create bookings
- ✅ View all bookings
- ✅ Update booking details
- ✅ Delete bookings
- ✅ Filter by status (pending, confirmed, cancelled, completed)
- ✅ Beautiful Material Design UI
- ✅ API Integration with backend

## Prerequisites

- Flutter SDK 3.0+
- Backend server running (see backend/README.md)
- MongoDB running

## Setup

1. Install dependencies:
```bash
flutter pub get
```

2. Make sure backend is running:
```bash
cd ../../backend
npm run start:dev
```

3. Update API URL in `lib/services/booking_service.dart` if needed:
```dart
static const String baseUrl = 'http://localhost:3000/api';
```

For Android emulator use: `http://10.0.2.2:3000/api`
For iOS simulator use: `http://localhost:3000/api`
For real device use: `http://YOUR_IP_ADDRESS:3000/api`

## Run

```bash
flutter run
```

## Features Details

### Booking Form
- Customer name, email, phone
- Service selection (Haircut, Spa, Massage, etc.)
- Date and time picker
- Status management
- Optional notes

### Booking List
- View all bookings
- Filter by status
- Edit/Delete bookings
- Pull to refresh
- Material Design cards

### API Integration
- RESTful API calls
- Error handling
- Loading states
- Success/Error messages

## API Endpoints Used

- `GET /api/bookings` - Get all bookings
- `GET /api/bookings?status=pending` - Filter by status
- `GET /api/bookings/:id` - Get single booking
- `POST /api/bookings` - Create booking
- `PATCH /api/bookings/:id` - Update booking
- `DELETE /api/bookings/:id` - Delete booking

## Screenshots

[Add screenshots here]

## Learn More

See [docs/11-booking.md](../../docs/11-booking.md) for detailed documentation.
