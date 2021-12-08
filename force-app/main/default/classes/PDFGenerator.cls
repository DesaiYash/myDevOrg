public class PDFGenerator {
    
    @Future(callout=true)
    public static void generatePDF(Id caseId) {
        PageReference pdfVf = Page.PDFGenerator;
        Attachment att = new Attachment();
        att.ParentId = caseId;
        att.Body = pdfVf.getContent();
        att.Name = 'Test.pdf';
        insert att;
    }

}