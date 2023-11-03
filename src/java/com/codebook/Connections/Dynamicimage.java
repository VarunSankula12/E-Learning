package com.codebook.Connections;

import org.apache.commons.fileupload.FileItem;
import java.util.List;
 import java.io.*;
import java.sql.*;

public class Dynamicimage {
    
    public static Blob getBlob(List<FileItem> items){
        Blob blob=null;
         byte[] fileData=null;
        try {
            for (FileItem item : items) {
                if (!item.isFormField()) {
                        
                        InputStream inputStream = item.getInputStream();
                        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
                        byte[] buffer = new byte[4096];
                        int bytesRead;
                        while ((bytesRead = inputStream.read(buffer)) != -1) {
                            outputStream.write(buffer, 0, bytesRead);
                        }
                         fileData = outputStream.toByteArray();
          
                        // Create a Blob object from the byte array
                         blob= new javax.sql.rowset.serial.SerialBlob(fileData);
                }
                }
            }catch(Exception e){
                    e.printStackTrace();
                   }
                    return blob;
            }
     public static Blob getBlobResume(FileItem items){
        Blob blob=null;
         byte[] fileData=null;
        try {
            
                if (!items.isFormField()) {
                        
                        InputStream inputStream = items.getInputStream();
                        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
                        byte[] buffer = new byte[4096];
                        int bytesRead;
                        while ((bytesRead = inputStream.read(buffer)) != -1) {
                            outputStream.write(buffer, 0, bytesRead);
                        }
                         fileData = outputStream.toByteArray();
          
                        // Create a Blob object from the byte array
                         blob= new javax.sql.rowset.serial.SerialBlob(fileData);
                }
                
            }catch(Exception e){
                    e.printStackTrace();
                   }
                    return blob;
            }
}