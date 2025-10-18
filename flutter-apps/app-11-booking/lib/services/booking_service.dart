import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/booking.dart';

class BookingService {
  // Change this to your backend URL
  static const String baseUrl = 'http://localhost:3000/api';
  
  Future<List<Booking>> getBookings({String? status}) async {
    try {
      final url = status != null 
        ? Uri.parse('$baseUrl/bookings?status=$status')
        : Uri.parse('$baseUrl/bookings');
      
      final response = await http.get(url);
      
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) => Booking.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load bookings');
      }
    } catch (e) {
      throw Exception('Error fetching bookings: $e');
    }
  }

  Future<Booking> getBooking(String id) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/bookings/$id'),
      );
      
      if (response.statusCode == 200) {
        return Booking.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load booking');
      }
    } catch (e) {
      throw Exception('Error fetching booking: $e');
    }
  }

  Future<Booking> createBooking(Booking booking) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/bookings'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(booking.toJson()),
      );
      
      if (response.statusCode == 201) {
        return Booking.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to create booking');
      }
    } catch (e) {
      throw Exception('Error creating booking: $e');
    }
  }

  Future<Booking> updateBooking(String id, Booking booking) async {
    try {
      final response = await http.patch(
        Uri.parse('$baseUrl/bookings/$id'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(booking.toJson()),
      );
      
      if (response.statusCode == 200) {
        return Booking.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to update booking');
      }
    } catch (e) {
      throw Exception('Error updating booking: $e');
    }
  }

  Future<void> deleteBooking(String id) async {
    try {
      final response = await http.delete(
        Uri.parse('$baseUrl/bookings/$id'),
      );
      
      if (response.statusCode != 200) {
        throw Exception('Failed to delete booking');
      }
    } catch (e) {
      throw Exception('Error deleting booking: $e');
    }
  }
}
