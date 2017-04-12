package kr.co.finalEx.util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.jxls.transformer.XLSTransformer;
import org.apache.poi.ss.usermodel.Workbook;

public class MakeExcel{

    public MakeExcel() {}

    public String get_Filename() {
        SimpleDateFormat ft = new SimpleDateFormat("yyyyMMddmmmm");
        return ft.format(new Date());
    }

    public String get_Filename(String pre) {
        return pre + get_Filename();
    }
        
    public void download(HttpServletRequest request, HttpServletResponse response, Map<String , Object> beans, String filename, String templateFile) {
        String tempPath = request.getSession().getServletContext().getRealPath("/WEB-INF/templete") ;
        try {
            InputStream is = new BufferedInputStream(new FileInputStream(tempPath + "\\" + templateFile));
            XLSTransformer transformer = new XLSTransformer();
            Workbook resultWorkbook = transformer.transformXLS(is, beans);
            response.setContentType("application/octext-stream");
            response.setHeader("Content-Disposition", "attachment; filename=" + filename + ".xlsx");
            saveWorkbook(resultWorkbook, filename);
       } catch(Exception e) {
    	   e.getStackTrace();
       }
    }
    
    public void saveWorkbook(Workbook resultWorkbook, String filename) throws IOException{
    	OutputStream os = new BufferedOutputStream(new FileOutputStream(filename));
    	resultWorkbook.write(os);
    	os.flush();
    	os.close();    	
    }
}
