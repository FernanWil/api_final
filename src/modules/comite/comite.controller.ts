import { Controller, Post, Get, Body, Param, ParseIntPipe, UploadedFile, UseInterceptors, Res } from '@nestjs/common';
import { ComiteService } from './comite.service';
import { CreateComiteDto, SendMailComiteDto, UpdateComiteDto } from './dto/comite.dto';
import { ApiTags } from '@nestjs/swagger';
import { FileInterceptor } from '@nestjs/platform-express';
import { diskStorage } from 'multer';
import * as path from 'path';
import { Response } from 'express';
import { plainToClass } from 'class-transformer';

@ApiTags("Comité")
@Controller('comite')
export class ComiteController {
   constructor(private comiteService: ComiteService) {}

   // http://localhost:3000/api/comite/
   @Post()
   async crearComite(@Body() comite: CreateComiteDto) {
      return await this.comiteService.crearComite(comite);
   }

   // http://localhost:3000/api/comite/
   @Get()
   async listarComites() {
      return await this.comiteService.listarComites();
   }

   // http://localhost:3000/api/comite/:id
   @Get(":id")
   async mostrarComite(@Param('id', ParseIntPipe) id: number) {
      return await this.comiteService.mostrarComite(id);
   }

   // http://localhost:3000/api/comite/status/:id
   @Get("status/:id")
   async getComiteByStatus(@Param('id', ParseIntPipe) id: number) {
      return await this.comiteService.getComiteByStatus(id);
   }

   // http://localhost:3000/api/comite/:id
   @Post(":id")
   async actualizarComite(@Param('id', ParseIntPipe) id: number, @Body() comite: UpdateComiteDto) {
      return await this.comiteService.actualizarComite(id, comite);
   }

   @UseInterceptors(
      FileInterceptor(
         "file",
         {
            storage: diskStorage({
               destination: "./uploads/comite/actas",
               filename: function(req, file, cb) {
                  cb(null, `${Date.now()}_${file.originalname}`);
               }
            })
         }
      )
   )
   @Post("upload/acta")
   async uploadActa(@UploadedFile() file: Express.Multer.File, @Body() comite: UpdateComiteDto) {
      const comiteUpdate = {
         acta: file.filename,
      }
      return await this.comiteService.actualizarComite(comite.codigoComite, comiteUpdate);
   }

   @UseInterceptors(
      FileInterceptor(
         "file",
         {
            storage: diskStorage({
               destination: "./uploads/comite/resoluciones",
               filename: function(req, file, cb) {
                  cb(null, `${Date.now()}_${file.originalname}`);
               }
            })
         }
      )
   )
   @Post("upload/resolucion")
   async uploadResolucion(@UploadedFile() file: Express.Multer.File, @Body() comite: UpdateComiteDto) {
      const comiteUpdate = {
         resolucion: file.filename,
         estadoComite: 2,
      }
      return await this.comiteService.actualizarComite(comite.codigoComite, comiteUpdate);
   }

   @Get("download/acta/:filename")
   async downloadActa(@Param('filename') filename: string, @Res() res: Response) {
      // const fileLocation = path.join(process.cwd(), 'senastion_api', 'uploads/spf', filename)
      const fileLocation = path.join(__dirname, '../../../',  'uploads', 'comite/actas', filename)
      // console.log("File: ", fileLocation)

      return res.download(fileLocation, filename)
   }

   @Get("download/resolucion/:filename")
   async downloadResolucion(@Param('filename') filename: string, @Res() res: Response) {
      // const fileLocation = path.join(process.cwd(), 'senastion_api', 'uploads/spf', filename)
      const fileLocation = path.join(__dirname, '../../../',  'uploads', 'comite/resoluciones', filename)
      // console.log("File: ", fileLocation)

      return res.download(fileLocation, filename)
   }

   
   @Post("sendMail/citados")
   async sendEmail(@Body() dataMail: SendMailComiteDto) {
      const dataConsole = { 
         email: dataMail.email, 
         apellidos: dataMail.apellidos, 
         codigoComite: dataMail.codigoComite, 
         codigoFicha: dataMail.codigoFicha, 
         fechaHoraInicio: dataMail.fechaHoraInicio, 
         link: dataMail.link, 
         nombre: dataMail.nombre,
         mailNumberAccess: dataMail.mailNumberAccess
      }
      return await this.comiteService.sendEmail(plainToClass(SendMailComiteDto, dataConsole));
   }
}
