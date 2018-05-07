package com.zoubei.utils;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartFile;


/**
 * 
* @ClassName: FilesUtils  
* @Description: 上传文件工具类
* @date 2017年5月10日 上午9:06:09  
*
 */
public class FilesUtils {
	
    private FilesUtils() {
        throw new Error("The class Cannot be instance !");
    }

    /**
     * 
    * @Title: FilesUpload_Spring  
    * @Description: SpringMVC涓婁紶鏂囦欢
    * @param @param request
    * @param @param multipartFile
    * @param @param filePath
    * @param @return    璁惧畾鏂囦欢  
    * @return String    杩斿洖绫诲瀷  
    * @throws
     */
    public static String FilesUpload_Spring(HttpServletRequest request, MultipartFile multipartFile, String filePath) {
        if (multipartFile != null) {
            String suffix = multipartFile.getOriginalFilename().substring(multipartFile.getOriginalFilename().lastIndexOf("."));
            String UUIDName = getUUIDName(suffix);
            String path = getPath_xm(request, filePath, UUIDName);
            try {
                multipartFile.transferTo(new File(path));
                return path;
            } catch (IOException e) {
                e.printStackTrace();
                return null;
            }
        } else
            return null;
    }
    
    /**
     * 
    * @Title: FilesUpload_zd  
    * @Description: 鏂囦欢涓婁紶--鎸囧畾鏂囦欢澶�
    * @param @param request
    * @param @param multipartFile
    * @param @param filePath
    * @param @return    璁惧畾鏂囦欢  
    * @return String    杩斿洖绫诲瀷  
    * @throws
     */       // filePath   d://upload
    public static String FilesUpload_zd(HttpServletRequest request,MultipartFile multipartFile,String filePath) {
        if (multipartFile != null) {
        	 String suffix = multipartFile.getOriginalFilename().substring(multipartFile.getOriginalFilename().lastIndexOf("."));
             String UUIDName = getUUIDName(suffix);
             String path = getPath_zd(request, filePath, UUIDName);
            try{
                InputStream inputStream = multipartFile.getInputStream();
                FileOutputStream fileOutputStream = new FileOutputStream(path);
                byte buffer[] = new byte[4096];
                long fileSize = multipartFile.getSize();
                if(fileSize<=buffer.length){
                    buffer = new byte[(int)fileSize];
                }
                int line =0;
                while((line = inputStream.read(buffer)) >0 )
                {
                    fileOutputStream.write(buffer,0,line);
                }
                fileOutputStream.close();
                inputStream.close();
                return path;
            }catch (Exception e){
                e.printStackTrace();
            }
        } else
            return null;
        return null;
    }
    
    
    /**  
    * @Title: FilesUpload_xm  
    * @Description: 鏂囦欢涓婁紶--椤圭洰鏂囦欢澶�
    * @param @param request
    * @param @param multipartFile
    * @param @param filePath
    * @param @return    璁惧畾鏂囦欢  
    * @return String    杩斿洖绫诲瀷  
    * @throws  
    */
    public static String FilesUpload_xm(HttpServletRequest request,MultipartFile multipartFile,String filePath) {
        if (multipartFile != null) {
        	 // 鏂囦欢鍚庣紑  .png
        	 String suffix = multipartFile.getOriginalFilename().substring(multipartFile.getOriginalFilename().lastIndexOf("."));
        	 // uuid+鏂囦欢鍚庣紑   c22adcd5-841e-4129-9dae-ce164ab41d7d.jpg
             String UUIDName = getUUIDName(suffix);
             // 瀛樺叆纾佺洏鐨勮矾寰�
             String path = getPath_xm(request, filePath, UUIDName);
             
             // 鏁版嵁搴撳瓨鍌ㄨ矾寰�
             String dbUrl = getPath_db(request, filePath, UUIDName);
            try{
                InputStream inputStream = multipartFile.getInputStream();
                // 鍐欏叆鏈湴纾佺洏
                FileOutputStream fileOutputStream = new FileOutputStream(path);
                byte buffer[] = new byte[4096];
                long fileSize = multipartFile.getSize();
                if(fileSize<=buffer.length){
                    buffer = new byte[(int)fileSize];
                }
                int line =0;
                while((line = inputStream.read(buffer)) >0 )
                {
                    fileOutputStream.write(buffer,0,line);
                }
                fileOutputStream.close();
                inputStream.close();
                return dbUrl;
            }catch (Exception e){
            	
                e.printStackTrace();
            }
        } else
            return null;
        return null;
    }

    /**
     * 
    * @Title: FilesDownload_zd  
    * @Description: 鏂囦欢涓嬭浇
    * @param @param request
    * @param @param response
    * @param @param filePath    璁惧畾鏂囦欢  
    * @return void    杩斿洖绫诲瀷  
    * @throws
     */
    public static void FilesDownload(HttpServletRequest request, HttpServletResponse response, String filePath) {
    	// getServerPath(request, "")     D:\\work\\workspace\\ssm_Final\\WebContent
    	// File.separator \\
    	// filePath  upload\20170510\3c9573c9-2c2a-4c7b-8dcc-615b3a938791.jpg
    	// 鑾峰彇鏈湴纾佺洏璺緞
    	filePath = getServerPath(request, "") + File.separator + filePath;
        File file = new File(filePath);
        String filenames = file.getName();
        InputStream inputStream;
        try {
            inputStream = new BufferedInputStream(new FileInputStream(file));
            byte[] buffer = new byte[inputStream.available()];
            inputStream.read(buffer);
            inputStream.close();
            response.reset();
            // 鍏堝幓鎺夋枃浠跺悕绉颁腑鐨勭┖鏍�,鐒跺悗杞崲缂栫爜鏍煎紡涓簎tf-8,淇濊瘉涓嶅嚭鐜颁贡鐮�,杩欎釜鏂囦欢鍚嶇О鐢ㄤ簬娴忚鍣ㄧ殑涓嬭浇妗嗕腑鑷姩鏄剧ず鐨勬枃浠跺悕
            response.addHeader("Content-Disposition", "attachment;filename=" + new String(filenames.replaceAll(" ", "").getBytes("utf-8"), "iso8859-1"));
            response.addHeader("Content-Length", "" + file.length());
            OutputStream os = new BufferedOutputStream(response.getOutputStream());
            response.setContentType("application/octet-stream");
            os.write(buffer);// 杈撳嚭鏂囦欢
            os.flush();
            os.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    /**
     * 
    * @Title: getServerPath  
    * @Description: 鑾峰彇椤圭洰璺緞
    * @param @param request
    * @param @param filePath
    * @param @return    璁惧畾鏂囦欢  
    * @return String    杩斿洖绫诲瀷  
    * @throws
     */
    public static String getServerPath(HttpServletRequest request, String filePath) {
    	return request.getSession().getServletContext().getRealPath(filePath);
    }

    /**
     * 
    * @Title: getDataPath  
    * @Description: 鑾峰彇褰撳墠鏃ユ湡
    * @param @return    璁惧畾鏂囦欢  
    * @return String    杩斿洖绫诲瀷  
    * @throws
     */
    public static String getDataPath() {
        return new SimpleDateFormat("yyyyMMdd").format(new Date());
    }

    /**
     * 
    * @Title: checkDir  
    * @Description: 妫�鏌ユ枃浠舵槸鍚﹀瓨鍦�
    * @param @param savePath    璁惧畾鏂囦欢  
    * @return void    杩斿洖绫诲瀷  
    * @throws
     */
    public static void checkDir(String savePath) {
        File dir = new File(savePath);
        if (!dir.exists() || !dir.isDirectory()) {
            dir.mkdir();
        }
    }

    /**
     * 
    * @Title: getUUIDName  
    * @Description: 闅忔満鐢熸垚UUID鍚嶇О
    * @param @param suffix
    * @param @return    璁惧畾鏂囦欢  
    * @return String    杩斿洖绫诲瀷  
    * @throws
     */
    public static String getUUIDName(String suffix) {
        return UUID.randomUUID().toString() + suffix;
    }

    /**
     * 
    * @Title: getPath_zd  
    * @Description: 鑾峰彇瀛樺偍璺緞--鎸囧畾璺緞
    * @param @param request
    * @param @param filePath
    * @param @param UUIDName
    * @param @return    璁惧畾鏂囦欢  
    * @return String    杩斿洖绫诲瀷  
    * @throws
     */
    public static String getPath_zd(HttpServletRequest request, String filePath, String UUIDName) {
    	String savePath = filePath + File.separator + getDataPath() + File.separator;
        checkDir(savePath);//妫�鏌ユ枃浠舵槸鍚﹀瓨鍦�
        return savePath + UUIDName;
    }
    
    /**
     * 
    * @Title: getPath_xm  
    * @Description: 鑾峰彇瀛樺偍璺緞--椤圭洰璺緞
    * @param @param request
    * @param @param filePath
    * @param @param UUIDName
    * @param @return    璁惧畾鏂囦欢  
    * @return String    杩斿洖绫诲瀷  
    * @throws
     */
    public static String getPath_xm(HttpServletRequest request, String filePath, String UUIDName) {
    	//D:\\work\\workspace\\ssm_Final\\WebContent\\upload\\20170510\\c22adcd5-841e-4129-9dae-ce164ab41d7d.jpg
    	
    	// getServerPath(request, filePath)         D:\\work\\workspace\\ssm_Final\\WebContent\\upload
    	// File.separator   \\
    	// getDataPath()    20170510
    	// File.separator   \\
    	// UUIDName         c22adcd5-841e-4129-9dae-ce164ab41d7d.jpg
    	String savePath = getServerPath(request, filePath) + File.separator + getDataPath() + File.separator;
        checkDir(savePath);//妫�鏌ユ枃浠跺す鏄惁瀛樺湪
        return savePath + UUIDName;
    }
    
    /**
     * 
    * @Title: getPath_db  
    * @Description: 鏁版嵁搴撳瓨鍌ㄨ矾寰�
    * @param @param request
    * @param @param filePath
    * @param @param UUIDName
    * @param @return    璁惧畾鏂囦欢  
    * @return String    杩斿洖绫诲瀷  
    * @throws
     */
    public static String getPath_db(HttpServletRequest request, String filePath, String UUIDName) {
    	//\\upload\\20170510\\c22adcd5-841e-4129-9dae-ce164ab41d7d.jpg

    	// File.separator   \\
    	// getDataPath()    20170510
    	// File.separator   \\
    	// UUIDName         c22adcd5-841e-4129-9dae-ce164ab41d7d.jpg
    	
    	String savePath = filePath.substring(1) + File.separator + getDataPath() + File.separator;
        checkDir(savePath);//妫�鏌ユ枃浠跺す鏄惁瀛樺湪
        return savePath + UUIDName;
    }
    
    /**
     * 
    * @Title: FileDelete  
    * @Description: 鏂囦欢鍒犻櫎
    * @param @param request
    * @param @param filePath
    * @param @return    璁惧畾鏂囦欢  
    * @return boolean    杩斿洖绫诲瀷  
    * @throws
     */
    public static boolean FileDelete(HttpServletRequest request,String filePath) {
    	// D:\\work\\workspace\\ssm_Final\\WebContent\\upload\\20170515\\97c1042c-3e08-4643-a731-1282f069a3e4.png
    	String fileRealPath = getServerPath(request, "") + File.separator + filePath;
    	File file = new File(fileRealPath);
    	return file.delete();
    }

}
