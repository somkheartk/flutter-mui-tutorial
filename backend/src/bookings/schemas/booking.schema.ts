import { Prop, Schema, SchemaFactory } from '@nestjs/mongoose';
import { Document } from 'mongoose';

export type BookingDocument = Booking & Document;

@Schema({ timestamps: true })
export class Booking {
  @Prop({ required: true })
  customerName: string;

  @Prop({ required: true })
  email: string;

  @Prop({ required: true })
  phone: string;

  @Prop({ required: true })
  service: string;

  @Prop({ required: true })
  bookingDate: Date;

  @Prop({ required: true })
  bookingTime: string;

  @Prop({ default: 'pending' })
  status: string; // pending, confirmed, cancelled, completed

  @Prop()
  notes?: string;
}

export const BookingSchema = SchemaFactory.createForClass(Booking);
