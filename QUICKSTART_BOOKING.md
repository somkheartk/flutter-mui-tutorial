# Quick Start Guide - Booking App

## 🚀 Quick Start (5 minutes)

### Step 1: Start MongoDB (1 min)
```bash
# Option 1: Using Docker (recommended)
docker run -d -p 27017:27017 --name mongodb mongo:6

# Option 2: Local MongoDB
mongod
```

### Step 2: Start Backend (2 min)
```bash
cd backend
npm install
npm run start:dev
```

You should see:
```
🚀 Backend server is running on: http://localhost:3000/api
📚 MongoDB URI: mongodb://localhost:27017/flutter-tutorial
```

### Step 3: Test API (1 min)
```bash
# Create a test booking
curl -X POST http://localhost:3000/api/bookings \
  -H "Content-Type: application/json" \
  -d '{
    "customerName": "สมชาย ใจดี",
    "email": "somchai@example.com",
    "phone": "081-234-5678",
    "service": "Haircut",
    "bookingDate": "2024-12-25",
    "bookingTime": "14:00"
  }'

# Get all bookings
curl http://localhost:3000/api/bookings
```

### Step 4: Run Flutter App (1 min)
```bash
cd flutter-apps/app-11-booking
flutter pub get
flutter run
```

## 📱 Using the Flutter App

### 1. View Bookings
- App opens to booking list screen
- Pull down to refresh
- Tap filter icon to filter by status

### 2. Create Booking
- Tap the blue "+" button (bottom right)
- Fill in the form:
  - Customer Name: "สมชาย ใจดี"
  - Email: "somchai@example.com"
  - Phone: "081-234-5678"
  - Service: Select from dropdown
  - Date: Tap to open date picker
  - Time: Select from dropdown
  - Notes: Optional
- Tap "Create Booking" button
- You'll see success message and return to list

### 3. Edit Booking
- Tap on any booking card
- Modify any fields
- Change status if needed
- Tap "Update Booking"

### 4. Delete Booking
- Tap three-dot menu on booking card
- Select "Delete"
- Confirm in dialog

## 🧪 Sample Data for Testing

### Sample Booking 1
```json
{
  "customerName": "สมชาย ใจดี",
  "email": "somchai@example.com",
  "phone": "081-234-5678",
  "service": "Haircut",
  "bookingDate": "2024-12-25",
  "bookingTime": "14:00",
  "notes": "ต้องการตัดผมสั้น"
}
```

### Sample Booking 2
```json
{
  "customerName": "สมหญิง สวยงาม",
  "email": "somying@example.com",
  "phone": "082-345-6789",
  "service": "Spa Treatment",
  "bookingDate": "2024-12-26",
  "bookingTime": "15:00",
  "notes": "ขอนวดด้วย"
}
```

### Sample Booking 3
```json
{
  "customerName": "สมศักดิ์ มั่งมี",
  "email": "somsak@example.com",
  "phone": "083-456-7890",
  "service": "Massage",
  "bookingDate": "2024-12-27",
  "bookingTime": "10:00"
}
```

## 🔧 API URL Configuration

### For Android Emulator
Edit `lib/services/booking_service.dart`:
```dart
static const String baseUrl = 'http://10.0.2.2:3000/api';
```

### For iOS Simulator
```dart
static const String baseUrl = 'http://localhost:3000/api';
```

### For Physical Device
Find your IP address:
```bash
# macOS/Linux
ifconfig | grep inet

# Windows
ipconfig
```

Then update:
```dart
static const String baseUrl = 'http://YOUR_IP:3000/api';
```

Example: `http://192.168.1.100:3000/api`

## 🐛 Troubleshooting

### Backend Issues

#### MongoDB not connecting
```
Error: MongooseServerSelectionError
```
**Solution**: 
```bash
# Check if MongoDB is running
docker ps  # for Docker
# or
ps aux | grep mongod  # for local installation
```

#### Port 3000 already in use
```
Error: listen EADDRINUSE :::3000
```
**Solution**:
```bash
# Find process using port 3000
lsof -i :3000  # macOS/Linux
netstat -ano | findstr :3000  # Windows

# Kill the process or change PORT in .env
```

### Flutter Issues

#### Cannot connect to API
**Check**:
1. Backend is running (`npm run start:dev`)
2. Correct API URL in `booking_service.dart`
3. Network permissions in Android manifest

#### Packages not found
```bash
flutter pub get
flutter clean
flutter pub get
```

#### Android cleartext traffic
Add to `android/app/src/main/AndroidManifest.xml`:
```xml
<application
  android:usesCleartextTraffic="true"
  ...>
```

## 📊 Testing Scenarios

### Scenario 1: Basic CRUD
1. Create 3 bookings with different services
2. View all bookings in the list
3. Edit one booking to change status to "confirmed"
4. Delete one booking
5. Verify only 2 bookings remain

### Scenario 2: Status Filtering
1. Create bookings with different statuses
2. Filter by "pending"
3. Filter by "confirmed"
4. Reset to "all"

### Scenario 3: Form Validation
1. Try to create booking without name → Should show error
2. Try invalid email format → Should show error
3. Try to submit with all required fields → Should succeed

### Scenario 4: Date and Time
1. Select future date
2. Select different time slots
3. Create booking
4. Verify date/time display correctly in list

## 🎯 Expected Results

### After Creating First Booking
- Backend logs show POST request
- MongoDB has new document
- Flutter shows success SnackBar
- List shows new booking card with orange status icon

### After Filtering by Status
- Only bookings with selected status shown
- Counter updates
- Pull to refresh still works

### After Updating Status
- Status color changes in list
- Updated timestamp changes
- Backend logs show PATCH request

### After Deleting
- Confirmation dialog appears
- After confirm, booking removed from list
- Backend logs show DELETE request
- Success message appears

## 🎨 UI Elements to Notice

### Colors
- Primary: Blue (Material Design)
- Pending: Orange
- Confirmed: Green
- Cancelled: Red
- Completed: Blue

### Icons
- Pending: schedule (clock)
- Confirmed: check_circle
- Cancelled: cancel (X)
- Completed: done_all (double check)

### Interactions
- Tap card → Edit booking
- Long press → (same as tap)
- Three-dot menu → Edit/Delete options
- Pull down → Refresh
- FAB (+) → New booking
- Filter icon → Status filter

## 📝 Notes

1. **Date Format**: The app uses ISO 8601 format for API calls but displays user-friendly format in UI
2. **Time Zones**: All times are treated as local time
3. **Validation**: Both client and server-side validation are implemented
4. **Error Messages**: Friendly messages shown to users via SnackBar
5. **Loading States**: Spinner shown during API calls

## ✅ Success Indicators

You'll know everything is working when:
- ✅ Backend starts without errors
- ✅ MongoDB connection successful
- ✅ Can create booking via cURL
- ✅ Flutter app connects to API
- ✅ Can perform all CRUD operations
- ✅ UI updates reflect API changes
- ✅ No console errors

## 🎓 Next Steps

After basic testing:
1. Try filtering by different statuses
2. Create bookings on different dates
3. Test form validation
4. Try pull-to-refresh
5. Test on different devices/emulators
6. Read the documentation in `docs/11-booking.md`
7. Explore the code structure
8. Try modifying services or time slots
9. Add your own features
10. Review backend testing guide in `backend/TESTING.md`

## 🌟 Tips

- Keep backend running in one terminal
- Keep Flutter app running in another terminal
- Use `npm run start:dev` for auto-reload on backend changes
- Use hot reload (r) in Flutter for UI changes
- Check backend console for API logs
- Check Flutter console for errors
- Use Flutter DevTools for debugging

Happy coding! 🚀
