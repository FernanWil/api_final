import { IsDateString, IsEmail, IsNotEmpty, IsString, IsUrl } from 'class-validator';
import { ApiProperty, PartialType } from '@nestjs/swagger';

export class CreateComiteDto {
   @IsNotEmpty()
   @ApiProperty()
   fechaHoraInicio: Date

   @IsNotEmpty()
   @ApiProperty()
   fechaHoraFin: Date
   
   @IsNotEmpty()
   @ApiProperty()
   codigoComite: string;

   @IsNotEmpty()
   @ApiProperty()
   pcaComite: number;

   @IsNotEmpty()
   @ApiProperty()
   link: string;

   @ApiProperty()
   estadoComite?: number;
   
   @ApiProperty()
   acta?: string;
   
   @ApiProperty()
   resolucion?: string;
}

export class UpdateComiteDto extends PartialType(CreateComiteDto) {
}


export class SendMailComiteDto {
   @IsEmail()
   email: string;
 
   @IsString()
   @IsNotEmpty()
   nombre: string;
 
   @IsString()
   @IsNotEmpty()
   apellidos: string;
 
   @IsString()
   @IsNotEmpty()
   codigoFicha: string;
 
   @IsString()
   @IsNotEmpty()
   codigoComite: string;
   
   // @IsDateString()
   @IsNotEmpty()
   fechaHoraInicio: string;
 
   @IsUrl()
   link: string;

   @IsNotEmpty()
   mailNumberAccess: number;

}