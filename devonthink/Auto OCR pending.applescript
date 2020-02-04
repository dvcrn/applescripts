on performSmartRule(theRecords)
    tell application id "DNtp"
        set ib to inbox

        repeat with theRecord in theRecords
            do shell script "mkdir -p /tmp/abbyy/"
            do shell script "mkdir -p /tmp/abbyy/mrc/"
            
            set itemPath to path of theRecord
            set itemName to name of theRecord
            
            set pdfPath to "/tmp/abbyy/" & itemName & ".pdf"
            set pdfMRCPath to "/tmp/abbyy/mrc/" & itemName & ".pdf"
            
            tell application "FineReader"
                repeat while is busy
                    delay 1
                end repeat
                
                --- create normal pdf file
                export to pdf pdfPath from file itemPath image quality high quality ocr languages enum [Japanese, English]
                
                repeat while is busy
                    delay 1
                end repeat
            end tell

            --- import normal pdf file
            set newRecord to import pdfPath to ib
            tell newRecord
                set tags to text items of ["ocr_done"]
            end tell

            tell application "FineReader"
                repeat while is busy
                    delay 1
                end repeat

                --- create mrc pdf file
                export to pdf pdfMRCPath from file itemPath image quality high quality ocr languages enum [Japanese, English] with use mrc

                repeat while is busy
                    delay 1
                end repeat                
            end tell

            --- import mrc pdf file
            set newRecord to import pdfMRCPath to ib
            tell newRecord
                set tags to text items of ["ocr_done", "mrc"]
            end tell

        end repeat
    end tell
end performSmartRule
