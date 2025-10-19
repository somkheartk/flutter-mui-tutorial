import { IsEmail, IsNotEmpty, IsOptional, IsString, IsDateString } from 'class-validator';

export class CreateBookingDto {
  @IsString()
  @IsNotEmpty()
  customerName: string;

  @IsEmail()
  @IsNotEmpty()
  email: string;

  @IsString()
  @IsNotEmpty()
  phone: string;

  @IsString()
  @IsNotEmpty()
  service: string;

  @IsDateString()
  @IsNotEmpty()
  bookingDate: Date;

  @IsString()
  @IsNotEmpty()
  bookingTime: string;

  @IsString()
  @IsOptional()
  status?: string;

  @IsString()
  @IsOptional()
  notes?: string;
}
