### TO DO
# Check if backup was done that day ! Y/N Question to overwrite backup file ! 


# Backup all MYSQL databases
mysqldump --all-databases > /root/mysql_$( date '+%Y-%m-%d' ).sql -u root -p

# What to backup. 
#backup_files="/home /var/spool/mail /etc /root /boot /opt"
backup_files="--exclude=/var/mail --exclude=/var/log --exclude=/var/lib/apt --exclude=/var/lib/clamav --exclude=/var/cache --exclude=/var/backups /home /var /etc /root"

# Where to backup to.
#dest="/home"
dest="/backup"

# Create archive filename.
day=$(date '+%Y-%m-%d')
hostname=$(hostname -s)
archive_file="$hostname-$day.tar.gz"

# Print start status message.
echo "Backing up $backup_files to $dest/$archive_file"
date
echo

# Backup the files using tar.
tar -czf $dest/$archive_file $backup_files

# Print end status message.
echo
echo "Backup finished"
date

# Long listing of files in $dest to check file sizes.
ls -lh $dest

# SKASUJ PLIK Z BACKUPEM SQL !!!
# rm /root/backup/mysql-*


echo "scp -i ~/.ssh/[PRIVATE KEY] -P [PORT] user@domain.com:${dest}/* /users/[USER]/backup/${archive_file}"
