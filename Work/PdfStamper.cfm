<cfscript>
	
	//writeDump(createPDF('C:\F\myPDF.pdf'));
	writeDump(addField('C:\Temp\pdfs\cl.pdf','C:\Temp\pdfs\cl_signature_field.pdf'));
	
	public void function createPdf(String filename) {
		//Prepare destination file to write to
		fileOutputStream = CreateObject("java", "java.io.FileOutputStream").init( filename );
		//Read the source
		//reader = createobject("java","com.lowagie.text.pdf.PdfReader").init( src );
		//Initialize the stamper
    	//stamper = createobject("java","com.lowagie.text.pdf.PdfStamper").init( reader, fileOutputStream);
    	// step 1: Create a Document
        document = createobject('java','com.lowagie.text.Document');//com.itextpdf.text.Document;
        // step 2: Open the Document
        document.open();
        // step 3: Create a PdfWriter
        PdfWriter = createobject("java","com.lowagie.text.pdf.PdfWriter");
      // writeDump(PdfWriter);
        writer = PdfWriter.getInstance(document, fileOutputStream);
       
        // step 4: Add content
        Paragraph = createobject("java","com.lowagie.text.Paragraph").init("Hello World!");
        document.add(Paragraph );
        
        // create a signature form field
        //com.itextpdf.text.pdf.PdfFormField;
        PdfFormField = createobject("java","com.lowagie.text.pdf.PdfFormField");
        
        field = PdfFormField.createSignature(writer);
        field.setFieldName("Signature1");
      
        // set the widget properties
       	//field.setPage();
        
        Rectangle = createobject("java","com.lowagie.text.Rectangle").init(10, 200, 10, 500);
        
       	PdfAnnotation = createobject("java","com.lowagie.text.pdf.PdfAnnotation");
       
        field.setWidget(Rectangle, PdfAnnotation.HIGHLIGHT_INVERT);
        field.setFlags(PdfAnnotation.FLAGS_PRINT);
         
        
       
        // add it as an annotation
        writer.addAnnotation(field);
         writeDump(writer);abort;
        // maybe you want to define an appearance
        PdfAppearance = createobject("java","com.lowagie.text.pdf.PdfAppearance");
         writeDump(PdfAppearance);abort;
        tp = PdfAppearance.createAppearance(writer, 72, 48);
        BaseColor = createobject("java","com.lowagie.text.BaseColor");
        tp.setColorStroke(BaseColor.BLUE);
        tp.setColorFill(BaseColor.LIGHT_GRAY);
        tp.rectangle(0.5, 0.5, 71.5, 47.5) ;
        tp.fillStroke();
        tp.setColorFill(BaseColor.BLUE);
        ColumnText = createobject("java","com.lowagie.text.pdf.ColumnText");
        ColumnText.showTextAligned(tp, Element.ALIGN_CENTER, new Phrase("SIGN HERE"), 36, 24, 25);
        field.setAppearance(PdfAnnotation.APPEARANCE_NORMAL, tp);
        // step 5: Close the Document
        document.close();
    }
    
    
    public void function addField(String src, String dest) {
    	reader = createobject('java','com.lowagie.text.pdf.PdfReader').init( src );
    	fileOutputStream = CreateObject("java", "java.io.FileOutputStream").init( dest );
    	stamper = createobject('java','com.lowagie.text.pdf.PdfStamper').init( reader, fileOutputStream );
        // create a signature form field
        PdfFormField = createobject("java","com.lowagie.text.pdf.PdfFormField");
        field = PdfFormField.createSignature( stamper.getWriter() );
        field.setFieldName("Signature1");
        // set the widget properties
        Rectangle = createobject("java","com.lowagie.text.Rectangle");
              
       	PdfAnnotation = createobject("java","com.lowagie.text.pdf.PdfAnnotation");
        field.setWidget(Rectangle.init(40, 273, 160, 238), PdfAnnotation.HIGHLIGHT_OUTLINE);
        field.setFlags(PdfAnnotation.FLAGS_PRINT);
        // add the annotation
        
        PdfAppearance = createobject("java","com.lowagie.text.pdf.PdfAppearance");
       // writeDump(PdfAppearance);
        
      //  tp = PdfAppearance.createAppearance(stamper.getWriter(), 72, 48);
      //  writeDump(tp);
       // BaseColor = createobject("java","com.lowagie.text.BaseColor");
       // tp.setColorStroke(BaseColor.BLUE);
        //tp.setColorFill(BaseColor.LIGHT_GRAY);
        //tp.rectangle(0.5, 0.5, 71.5, 47.5) ;
       /* tp.moveTo(0, 0);
    	tp.lineTo(99, 99);
    	tp.moveTo(0, 99);
    	tp.lineTo(99, 0);
       // tp.fillStroke();
        field.setAppearance(PdfAnnotation.APPEARANCE_NORMAL, tp);*/
        stamper.addAnnotation(field, 1);
        //tp.setColorFill(BaseColor.BLUE);
        // close the stamper
    	stamper.close();
    }
</cfscript>
