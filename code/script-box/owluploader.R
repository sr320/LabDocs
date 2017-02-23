if(!require(readr))   {
   install.packages("readr")
   library(readr)
} else {
  library(readr)
}

## The three lines below are user supplied. dataDir is where the data currently is located (either mounted FTP directory or 
## some temporary directory where you've copied the files to locally), facilityMD5FileName is the MD5 file supplied 
## by the sequencing facility, considered "correct" for the purposes of this script, and owlDir is the directory where files 
## will be copied to in Owl
dataDir <- "Input Data Dir Here"
facilityMD5FileName <- "File Name Here"
owlDir <- "Input Owl Directory Here"

## Main Logic loop, First three if statements are checks to make sure the user has updated the script with directories
## and the MD5 file to ensure correct operation. If any of the criteria are not met, script stops automatically.
if(dataDir == "Input Data Dir Here" )   {
  print("Update dataDir variable with where your data is")

} else if (owlDir == "Input Owl Directory Here")   {
  print("Update owlDir with where you want the files copied to Owl")

} else if (facilityMD5FileName == "File Name Here")   {
  print("Update Script with MD5 file provided by the facility")

## The else loop assumes that everything is correct and proceeds with the checking and copying process
} else {
  # Sets the working directory to dataDir
  setwd(dataDir)
  # Pulls in all of the files which match the .gz file extension. May want to add a user supplied option for compression
  #schemes other than gzip.
  filenames <- list.files(path = dataDir, pattern = "*.gz")

  # Rums MD5 checks on all of the files, saving them to the external file chksum2.txt. This is just temporary and is removed
  # during cleanup
  for(i in 1: length(filenames))   {
    system(paste0("md5sum ", filenames[i], " >> chksum2.txt"))
  }
  # reads in and formats the facility and local MD5 files, removing any NA spaces due to read_delim only using a single whitespace
  # character to delimit, but most MD5 files seem to have two. Then names columns appropriately
  facility.MD5s <- read_delim(paste0(dataDir,facilityMD5FileName), 
                              "  ", escape_double = FALSE, col_names = FALSE, 
                              trim_ws = TRUE)
  
  facility.MD5s <- facility.MD5s[,!apply(is.na(facility.MD5s),2,all)]
  colnames(facility.MD5s) <- c("md5", "name")
  
  file.MD5s <- read_delim(paste0(dataDir,"chksum2.txt"), 
                          "  ", escape_double = FALSE, col_names = FALSE, 
                          trim_ws = TRUE)
  
  file.MD5s <- file.MD5s[,!apply(is.na(file.MD5s),2,all)]
  colnames(file.MD5s) <- c("md5", "name")
  
  ## Logic loop for checking MD5s and initiationg copying if MD5s match.
  for(i in 1:nrow(facility.MD5s))   {
    setwd(owlDir)
    ## Checks if the number of files match between chksum2.txt and the facility file. Stops script if they don't
    if (nrow(facility.MD5s) != nrow(file.MD5s))   {
      print("Number of Facility entries does not match number of files, check if all files are present")
      break
    # This loop is for when MD5s match, and will first copy the file to the supplied Owl directory, then re-run
    # an MD5, comparing it to the facility file again, and if that matches append the MD5 checksum to the existing
    # MD5 file and add the file name to the readme.MD file in Owl. If it fails, then it prints that the copy has failed,
    # removes the file from owl, and then stops the script
    }else if(facility.MD5s$md5[which(facility.MD5s$name == file.MD5s$name[i])] == file.MD5s$md5[i]) {
      system(paste0("scp ", dataDir, file.MD5s$name[i], " ", owlDir))
      tempMD5 <- substr(system(paste0("md5sum ",owlDir, "/", filenames[i]), intern = TRUE),1 , 32)
      if (facility.MD5s$md5[which(facility.MD5s$name == file.MD5s$name[i])] == tempMD5)   {
        system(paste0("echo ", file.MD5s$name[i], " >> readme.MD"))
        system(paste0("echo ", tempMD5, "  ", file.MD5s$name[i] ,">> checksum.MD5"))
        print(paste(file.MD5s$name[i], "copied sucessfully"))
      }else   {
        print("Copy Failure. Produced incorrect MD5")
        system("rm ", owlDir, "/", file.MD5s$name[i], intern = FALSE)
        break
      }
    # This final if statement is for if the inital file checksum and facility checksums do not match, if that's
    # the case then it prints that they've failed, with the file name, and saves the file name to a MD5Mismatch
    # file for further consideration. This does not stop the loop however
    } else if(facility.MD5s$md5[which(facility.MD5s$name == file.MD5s$name[i])] != file.MD5s$md5[i])   {
      print(paste("MD5 mismatch between facility and copied file for file ", file.MD5s$name[i]))
      system(paste0("echo ", file.MD5s$name[i], " >> MD5Mismatch.txt"))
    }
  }  
setwd(dataDir)
system("rm chksum2.txt", intern = FALSE)
}
