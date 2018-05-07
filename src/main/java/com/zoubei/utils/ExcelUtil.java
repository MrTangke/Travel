package com.zoubei.utils;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.web.multipart.MultipartFile;

import com.zoubei.entity.scene.Scene;

public class ExcelUtil{
	
    public static String NO_DEFINE = "no_define";//未定义的字段
    public static String DEFAULT_DATE_PATTERN="yyyy年MM月dd日";//默认日期格式
    public static int DEFAULT_COLOUMN_WIDTH = 17;
           
	/**
	 * 	导出Excel文件
	 */
    public static String exportExcel_f(HttpServletRequest request,  HttpServletResponse response, List<Scene> list){
    	
    	String str = "0";
    	try {
    		//  这是上下文的绝对路径
    		/* E:\AAA学习资料\A12_实训二\02_自己练习\workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\maven_travel\ upload\excel*/
    		@SuppressWarnings("deprecation")
			String basePath=request.getRealPath("/upload/excel");

    		SimpleDateFormat dateStr=new SimpleDateFormat("_yyyy_MM_dd");
    	    SimpleDateFormat sdf=new SimpleDateFormat("\\yyyy\\");
    	    
    		Date date=new Date();
    		String subPath=sdf.format(date);
    		String dateStrPath=dateStr.format(date);
    	
    		File dir=new File(basePath+subPath);
    			if(!dir.exists()){
    			dir.mkdirs();
    		}
    			
    		String filePath = basePath + subPath ;
    		
    		
    		Workbook wb = new XSSFWorkbook();
    		//为空的工作簿创建工作表
    		Sheet sheet = wb.createSheet("景点信息表");
    		//创建合并单元格对象 ，将这个对象覆给工作表
    		CellRangeAddress cellRangeAddress = new CellRangeAddress(0, 0, 0, 8);
    		sheet.addMergedRegion(cellRangeAddress);
    		
    		//获取第一行
    		Row row1 = sheet.createRow(0);
    		Cell cell_1 = row1.createCell(0);
    		cell_1.setCellValue("景点信息");
    		
    		//创建一个样式     头 给标题设置样式
    		CellStyle styleHead = wb.createCellStyle();
			styleHead.setAlignment(XSSFCellStyle.ALIGN_CENTER);
			styleHead.setVerticalAlignment(XSSFCellStyle.ALIGN_CENTER);
			Font fontHead = wb.createFont();
			fontHead.setBoldweight(Font.BOLDWEIGHT_BOLD);
			fontHead.setFontHeightInPoints((short)20);
			styleHead.setFont(fontHead);
			
			//将样式赋予单元格
			cell_1.setCellStyle(styleHead);
    		
			//创建一个样式对象  列头
			CellStyle style = wb.createCellStyle();
			style.setAlignment(XSSFCellStyle.ALIGN_CENTER);
			style.setVerticalAlignment(XSSFCellStyle.ALIGN_CENTER);
			Font font = wb.createFont();
			font.setBoldweight(Font.BOLDWEIGHT_BOLD);
			style.setFont(font);
			
			//每一列头的名称
			String[] titles = {"景点编号","景点名称","景点地址","景点简介","景点等级","门票价格","景点联系方式","景点路线" } ;
			Row row2 = sheet.createRow(1);
			for (int i = 0; i < titles.length; i++) {
				Cell cell = row2.createCell(i);
				cell.setCellValue(titles[i]);
				cell.setCellStyle(style);
			}
			
			//循环导出用户列表数据
			for (int i = 0; i < list.size(); i++) {
				Scene scene = list.get(i);
				//从第三行开始 获得第三行
				Row row = sheet.createRow(i+2);
				row.createCell(0).setCellValue(scene.getSceneId());
				row.createCell(1).setCellValue(scene.getSceneName());
				row.createCell(2).setCellValue(scene.getSceneAddress());
				row.createCell(3).setCellValue(scene.getSceneContent());
				row.createCell(4).setCellValue(scene.getSceneLevel());
				row.createCell(5).setCellValue(scene.getScenePrice());
				row.createCell(6).setCellValue(scene.getScenePhone());
				row.createCell(7).setCellValue(scene.getSceneLine());

				str = "1";
			}
			
			// 保存Excel文件
			String uid = UUID.randomUUID().toString().substring(0, 3);
	        OutputStream outputStream = new FileOutputStream(filePath + "景点信息表_" +dateStrPath+uid+".xls");
	        wb.write(outputStream);
	        outputStream.close();

    	} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
    	return str ;
    }	    

    /**
	 * 	导出Excel文件
	 */
    @SuppressWarnings("rawtypes")
	public static List importExcel(HttpServletRequest request, MultipartFile file){
    	//String str = FilesUtils.FilesUpload_xm(request, file, "/upload");
    	String str = file.getOriginalFilename();
    	
    	String fname = str.substring(str.lastIndexOf("."));
    	Workbook wb = null ;
    	
		try {
			//判断文件的格式 版本
			if (fname.equals(".xls")) {
				wb = new HSSFWorkbook(file.getInputStream());
			}else if(fname.equals(".xlsx")){
				wb = new XSSFWorkbook(file.getInputStream());
			}else {
				return null;
			}	
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		Sheet sheet = wb.getSheetAt(0);
		
		List<Scene> list = new ArrayList<Scene>();
		int lastRowNum = sheet.getLastRowNum();
		for (int i=sheet.getFirstRowNum()+2; i<sheet.getLastRowNum()+1; i++) {
			Row row = sheet.getRow(i);
			if(row == null){
				continue;
			}
			
			int rowNum = row.getRowNum();
			if (rowNum > 0) {
				// String sceneId = row.getCell(0).getStringCellValue();
				
				short lastCellNum = row.getLastCellNum();
				for(int n=0; n<row.getLastCellNum(); n++){
					row.getCell(n).setCellType(Cell.CELL_TYPE_STRING);
				}
				
				String sceneName = row.getCell(1).getStringCellValue();
				String areaId = row.getCell(2).getStringCellValue();
				String sceneAddress = row.getCell(3).getStringCellValue();
				String sceneContent = row.getCell(4).getStringCellValue();
				String sceneLevel = row.getCell(5).getStringCellValue();
				String scenePrice = row.getCell(6).getStringCellValue();
				String scenePhone = row.getCell(7).getStringCellValue();
				String sceneLine = row.getCell(8).getStringCellValue();
				String typeId = row.getCell(9).getStringCellValue();
				
				Scene scene = new Scene();
				scene.setSceneName(sceneName);
				scene.setAreaId(Integer.parseInt(areaId));
				scene.setSceneAddress(sceneAddress);
				scene.setSceneContent(sceneContent);
				scene.setSceneLevel(Integer.parseInt(sceneLevel));
				scene.setScenePrice(Integer.parseInt(scenePrice));
				scene.setScenePhone(scenePhone);
				scene.setSceneLine(sceneLine);
				scene.setTypeId(Integer.parseInt(typeId));
				// 总票数		默认1000
				scene.setSceneNums(1000);
				
				list.add(scene);
			}
		}
		
    	return list;
    }
		    
    /*
	 * 判断cells是否为空	    
	 */
    public static boolean isRowEmpty(Row row) {
	   for (int c = row.getFirstCellNum(); c < row.getLastCellNum(); c++) {
	       Cell cell = row.getCell(c);
	       if (cell != null && cell.getCellType() != Cell.CELL_TYPE_BLANK){
	           return false;
	       }
	   }
	   return true;
	} 	    
		    
		    
		    
		    
		    
		    
		    
		    

}