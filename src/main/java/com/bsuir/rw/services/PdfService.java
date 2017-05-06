package com.bsuir.rw.services;

import com.bsuir.rw.model.domain.Tickets;
import com.itextpdf.text.*;
import com.itextpdf.text.pdf.*;


import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

/**
 * Created by USER on 30.04.2017.
 */
public class PdfService {

    public void createPdf(Tickets ob){

        Document document = new Document(PageSize.A4, 50, 50, 50, 50);
        try {
            PdfWriter writer = PdfWriter.getInstance(document,new FileOutputStream("D:\\"+ob.getTicketNumber()+".pdf"));

        } catch (DocumentException e) {
            e.printStackTrace();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }

        document.open();
        BaseFont bf = null; //подключаем файл шрифта, который поддерживает кириллицу
        try {
            try {
                bf = BaseFont.createFont("C:\\Windows\\Fonts\\Calibri.TTF", BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
            } catch (DocumentException e) {
                e.printStackTrace();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        Font font = new Font(bf);
        Paragraph title1 = new Paragraph("Бланк электронного проездного документа с электронной регистрацией",
                font);
        Chapter chapter1 = new Chapter(title1, 1);


        chapter1.setNumberDepth(0);

        Paragraph title11 = new Paragraph("Form of electronic ticket with electronic registration",
                FontFactory.getFont(FontFactory.HELVETICA, 12, Font.ITALIC,
                        new CMYKColor(255, 255, 255,255)));
        Section section1 = chapter1.addSection(title11);
        section1.setNumberDepth(0);

        Paragraph someSectionText = new Paragraph("Электронный проездной документ номер ",font);
        someSectionText.setSpacingBefore(10);
        section1.add(someSectionText);
        someSectionText = new Paragraph("E-TICKET number",FontFactory.getFont(FontFactory.HELVETICA, 12, Font.ITALIC,
                new CMYKColor(0, 200, 255,56)));
        section1.add(someSectionText);
        someSectionText = new Paragraph(ob.getTicketNumber());
        section1.add(someSectionText);

        PdfPTable t = new PdfPTable(8);
        t.setSpacingBefore(10);
        t.setSpacingAfter(10);
        t.setWidthPercentage(100);
        PdfPCell c1 = new PdfPCell(new Phrase("Отправление/Departure",font));
        t.addCell(c1);

        PdfPCell c2 = new PdfPCell(new Phrase("Маршрут/Rout",font));
        t.addCell(c2);

        PdfPCell c3 = new PdfPCell(new Phrase("Прибытие/Arrival",font));
        t.addCell(c3);

        PdfPCell c4 = new PdfPCell(new Phrase("Пассажир/Passanger",font));
        t.addCell(c4);

        PdfPCell c5 = new PdfPCell(new Phrase("Поезд/Train",font));
        t.addCell(c5);

        PdfPCell c6 = new PdfPCell(new Phrase("Вагон/Coach",font));
        t.addCell(c6);
        PdfPCell c7 = new PdfPCell(new Phrase("Место/Seat",font));
        t.addCell(c7);
        PdfPCell c8 = new PdfPCell(new Phrase("Стоимость (BYN)/Fare",font));
        t.addCell(c8);

        t.addCell(ob.getDateDeparture()+" "+ob.getTimeDeparture());
        t.addCell((new Phrase(ob.getRout(),font)));
        t.addCell(ob.getDateDeparture()+" "+ob.getTimeArrive());
        ob.getTimeArrive();
        t.addCell(new Phrase(ob.getPassangerSurname()+ob.getPassangerName(),font));
        t.addCell(new Phrase(ob.getTrainNumber(),font));
        t.addCell(String.valueOf(ob.getCarriageNumber()));
        t.addCell(String.valueOf(ob.getPlaceNumber()));
        t.addCell(String.valueOf(ob.getPrice()));
        section1.add(t);

        someSectionText = new Paragraph("Дата и время оформления",font);
        section1.add(someSectionText);

        someSectionText = new Paragraph("Date and Time of Booking",FontFactory.getFont(FontFactory.HELVETICA, 12, Font.ITALIC,
                new CMYKColor(255, 255, 255,255)));
        section1.add(someSectionText);

        someSectionText = new Paragraph(new Phrase(ob.getDatetimeCreation()));
        section1.add(someSectionText);

        someSectionText = new Paragraph("Отмена электронной регистрации возможна до",font);
        section1.add(someSectionText);

        someSectionText = new Paragraph("Cancel of e-registration available",FontFactory.getFont(FontFactory.HELVETICA, 12, Font.ITALIC,
                new CMYKColor(255, 255, 255,255)));
        section1.add(someSectionText);

        someSectionText = new Paragraph(new Phrase(ob.getDatetimeCancel()));
        section1.add(someSectionText);

        someSectionText = new Paragraph("Счастливого пути!",font);
        someSectionText.setSpacingBefore(10);
        section1.add(someSectionText);

        try {
            document.add(chapter1);
        } catch (DocumentException e) {
            e.printStackTrace();
        }
        document.close();
    }
}
