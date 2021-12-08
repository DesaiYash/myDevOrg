trigger pdfGenerator on Case (before update) {
    for(Case cs : Trigger.new)
        PDFGenerator.generatePDF(cs.Id);
}