interface diffDocs {
    void getdoctype();
}

class WordDocument implements diffDocs {
    public void getdoctype() {
        System.out.println("This document is Word Document");
    }
}

class PdfDocument implements diffDocs {
    public void getdoctype() {
        System.out.println("This document is PDF Document");
    }
}

class ExcelDocument implements diffDocs {
    public void getdoctype() {
        System.out.println("This document is Excel Document");
    }
}

abstract class DocumentFactory {
    public diffDocs getdoc() {
        diffDocs diff = createDocument();
        diff.getdoctype();
        return diff;
    }

    public abstract diffDocs createDocument();
}

class WordDoc extends DocumentFactory {
    @Override
    public diffDocs createDocument() {
        return new WordDocument();
    }
}

class PdfDoc extends DocumentFactory {
    @Override
    public diffDocs createDocument() {
        return new PdfDocument();
    }
}

class ExcelDoc extends DocumentFactory {
    @Override
    public diffDocs createDocument() {
        return new ExcelDocument();
    }
}


public class Main {
    public static void main(String[] args) {

        DocumentFactory word = new WordDoc();
        word.getdoc();

        DocumentFactory pdf = new PdfDoc();
        pdf.getdoc();

        DocumentFactory excel = new ExcelDoc();
        excel.getdoc();
    }
}
