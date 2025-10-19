import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectModel } from '@nestjs/mongoose';
import { Model } from 'mongoose';
import { Booking, BookingDocument } from './schemas/booking.schema';
import { CreateBookingDto } from './dto/create-booking.dto';
import { UpdateBookingDto } from './dto/update-booking.dto';

@Injectable()
export class BookingsService {
  constructor(
    @InjectModel(Booking.name) private bookingModel: Model<BookingDocument>,
  ) {}

  async create(createBookingDto: CreateBookingDto): Promise<Booking> {
    const createdBooking = new this.bookingModel(createBookingDto);
    return createdBooking.save();
  }

  async findAll(): Promise<Booking[]> {
    return this.bookingModel.find().sort({ bookingDate: -1 }).exec();
  }

  async findOne(id: string): Promise<Booking> {
    const booking = await this.bookingModel.findById(id).exec();
    if (!booking) {
      throw new NotFoundException(`Booking with ID ${id} not found`);
    }
    return booking;
  }

  async findByStatus(status: string): Promise<Booking[]> {
    return this.bookingModel.find({ status }).sort({ bookingDate: -1 }).exec();
  }

  async findByDate(date: Date): Promise<Booking[]> {
    const startDate = new Date(date);
    startDate.setHours(0, 0, 0, 0);
    const endDate = new Date(date);
    endDate.setHours(23, 59, 59, 999);
    
    return this.bookingModel
      .find({
        bookingDate: {
          $gte: startDate,
          $lte: endDate,
        },
      })
      .sort({ bookingTime: 1 })
      .exec();
  }

  async update(id: string, updateBookingDto: UpdateBookingDto): Promise<Booking> {
    const updatedBooking = await this.bookingModel
      .findByIdAndUpdate(id, updateBookingDto, { new: true })
      .exec();
    
    if (!updatedBooking) {
      throw new NotFoundException(`Booking with ID ${id} not found`);
    }
    return updatedBooking;
  }

  async remove(id: string): Promise<void> {
    const result = await this.bookingModel.findByIdAndDelete(id).exec();
    if (!result) {
      throw new NotFoundException(`Booking with ID ${id} not found`);
    }
  }
}
