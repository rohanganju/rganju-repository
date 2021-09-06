 ```bash
   #!/bin/bash
   sudo du -h /home >> ~/backups/diskuse/disk_usage.txt
   df -h >> ~/backups/freedisk/free_disk.txt
   free -h >> ~/backups/freemem/free_mem.txt
   lsof >> ~/backups/openlist/open_list.txt
 
   ```
