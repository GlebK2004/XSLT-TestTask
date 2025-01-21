package org.example;

import javax.xml.transform.*;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;
import java.io.File;

// Для считывания XML-файла и применения к нему XSLT я использовал JAXB
// Файлы XSL находятся в папке tasks, результаты задач сохраняются в XML-файлы в папке output

public class Main {

    public static void main(String[] args) {
        String xmlFile = "src/data.xml"; //Исходные данные

        transformXML(xmlFile, "src/tasks/Task1.xsl", "src/output/Result_Task1.xml");
        transformXML(xmlFile, "src/tasks/Task2.xsl", "src/output/Result_Task2.xml");
        transformXML(xmlFile, "src/tasks/Task3.xsl", "src/output/Result_Task3.xml");
        transformXML(xmlFile, "src/tasks/Task4.xsl", "src/output/Result_Task4.xml");
        transformXML(xmlFile, "src/tasks/Task5.xsl", "src/output/Result_Task5.xml");

        System.out.println("Готово!");
    }


    public static void transformXML(String xmlInputPath, String xsltPath, String outputPath) {
        try {
            TransformerFactory factory = TransformerFactory.newInstance();
            Source xslt = new StreamSource(new File(xsltPath));
            Transformer transformer = factory.newTransformer(xslt);

            Source xml = new StreamSource(new File(xmlInputPath));
            transformer.transform(xml, new StreamResult(new File(outputPath)));

            System.out.println("Трансформация " + xsltPath + " завершена");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
