import { NestFactory } from '@nestjs/core';
import { ValidationPipe } from '@nestjs/common';
import { AppModule } from './app.module';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);
  
  // Enable CORS for Flutter app
  app.enableCors({
    origin: true,
    credentials: true,
  });

  // Enable validation pipe
  app.useGlobalPipes(new ValidationPipe({
    whitelist: true,
    forbidNonWhitelisted: true,
    transform: true,
  }));

  // Set API prefix
  app.setGlobalPrefix('api');

  const port = process.env.PORT || 3000;
  await app.listen(port);
  
  console.log(`🚀 Backend server is running on: http://localhost:${port}/api`);
  console.log(`📚 MongoDB URI: ${process.env.MONGODB_URI || 'mongodb://localhost:27017/flutter-tutorial'}`);
}

bootstrap();
