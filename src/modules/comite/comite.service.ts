import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { ComiteEntity } from 'src/db/entities';
import { Repository } from 'typeorm';
import { CreateComiteDto, SendMailComiteDto, UpdateComiteDto } from './dto/comite.dto';
import { plainToClass } from 'class-transformer';
import * as nodemailer from 'nodemailer';

@Injectable()
export class ComiteService {
   constructor(@InjectRepository(ComiteEntity) private comiteService: Repository<ComiteEntity>) { }

   crearComite(comite: CreateComiteDto): Promise<ComiteEntity> {
      const newComite = this.comiteService.create(plainToClass(ComiteEntity, comite))
      return this.comiteService.save(newComite);
   }

   listarComites(): Promise<ComiteEntity[]> {
      return this.comiteService.find({
         relations: ["pcaComite.programaFormativo", "pcaComite.usuario"]
         // relations: ["pcaComite", "pcaComite.programaFormativo", "pcaComite.usuario"]
      })
   }

   getComiteByStatus(status: any): Promise<ComiteEntity[]> {
      return this.comiteService.find({
         where: { estadoComite: status },
         relations: ["pcaComite.programaFormativo", "pcaComite.usuario"]
      })
   }

   mostrarComite(codigoComite: any): Promise<ComiteEntity> {
      return this.comiteService.findOne({
         where: { codigoComite: codigoComite },
         relations: ["pcaComite.programaFormativo", "pcaComite.usuario"]
      })
   }

   async actualizarComite(codigoComite: any, comite: UpdateComiteDto) {
      const searchComite = await this.comiteService.findOne({
         where: { codigoComite: codigoComite },
      });

      if (!searchComite) {
         const error = {
            error: "Comité no encontrado",
            label: "",
            status: false
         }
         return error
      }

      const updateComite = this.comiteService.merge(plainToClass(ComiteEntity, searchComite), plainToClass(ComiteEntity, comite));
      const updated = await this.comiteService.save(updateComite);
      return {
         res: {
            status: 200,
            msg: "Comité actualizado correctamente",
         },
         data: updated
      }
   }

   
   async sendEmail(dataMail: SendMailComiteDto) {
      const transporter = nodemailer.createTransport({
         service: 'Gmail',
         auth: {
            user: 'senastionrgnl@gmail.com',
            pass: 'stbt trqr dhcg sgsg',
         },
      });

      const fechaDatetime = new Date(dataMail.fechaHoraInicio);
      const dias_semana = ["domingo", "lunes", "martes", "miércoles", "jueves", "viernes", "sábado"];
      const meses = ["enero", "febrero", "marzo", "abril", "mayo", "junio", "julio", "agosto", "septiembre", "octubre", "noviembre", "diciembre"];


      const dia_semana = dias_semana[fechaDatetime.getUTCDay()];
      const dia = fechaDatetime.getUTCDate();
      const mes = meses[fechaDatetime.getUTCMonth()];
      const año = fechaDatetime.getUTCFullYear();
      const hora = fechaDatetime.getUTCHours();
      const minutos = fechaDatetime.getUTCMinutes();

      const mailOptionsAprendiz = {
         from: 'senastionrgnl@gmail.com',
         to: dataMail.email,
         subject: 'Citación de Comité de Evaluación y Seguimiento',
         text: `
         Señor(a) ${dataMail.nombre} ${dataMail.apellidos}
         Ficha: ${dataMail.codigoFicha}
         Comité: ${dataMail.codigoComite}
         Centro de Servicios y Gestión Empresarial\n

         Estimado(a) Aprendiz,
         Conforme al artículo 33 del Reglamento del Aprendiz SENA, me complace convocarlo cordialmente al Comité de Evaluación y Seguimiento Virtual, programado 
         para el ${dataMail.fechaHoraInicio}.\n
         La sesión se llevará a cabo en línea y podrá acceder a través del siguiente enlace de la plataforma Teams: ${dataMail.link}`,
      };

      const mailOptionsInstructor = {
         from: 'senastionrgnl@gmail.com',
         to: dataMail.email,
         subject: 'Citación de Comité de Evaluación y Seguimiento',
         text: `
         Señor(a) ${dataMail.nombre} ${dataMail.apellidos}
         Comité: ${dataMail.codigoComite}
         Centro de Servicios y Gestión Empresarial\n

         Estimado(a) Instructor,
         Conforme al artículo 33 del Reglamento del Aprendiz SENA, me complace convocarlo cordialmente al Comité de Evaluación y Seguimiento Virtual, programado 
         para el ${dataMail.fechaHoraInicio}.\n
         La sesión se llevará a cabo en línea y podrá acceder a través del siguiente enlace de la plataforma Teams: ${dataMail.link}`,
      };
      
      // para el ${dia_semana} ${dia} de ${mes} de ${año} a las ${hora}:${minutos} horas.\n
      try {
         if (dataMail.mailNumberAccess === 1) {
            const info = await transporter.sendMail(mailOptionsAprendiz);
            const responseArray = info.response.split(' ');
   
            const jsonResponse = {
               code: responseArray[0],
               message: responseArray.slice(1, -2).join(' '),
               timestamp: responseArray[responseArray.length - 2],
               server: responseArray[responseArray.length - 1]
            };
            // console.log('Email sent: ' + JSON.stringify(info.response));
            return jsonResponse
         }
         
         if (dataMail.mailNumberAccess === 2) {
            const info = await transporter.sendMail(mailOptionsInstructor);
            const responseArray = info.response.split(' ');
   
            const jsonResponse = {
               code: responseArray[0],
               message: responseArray.slice(1, -2).join(' '),
               timestamp: responseArray[responseArray.length - 2],
               server: responseArray[responseArray.length - 1]
            };
            // console.log('Email sent: ' + JSON.stringify(info.response));
            return jsonResponse
         }

         return { msg: "algo paso, que no proceso y a consecuencia, no funcionó" }
      } catch (error) {
         console.error('Error sending email:', error);
         throw error;
      }
   }
}
