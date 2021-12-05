#!/usr/bin/bash

if [ -d cronbackup/ ]; then
  :
else
  mkdir cronbackup
fi
if [[ -f cronbackup/nativepkg_list.txt && -f cronbackup/foreignpkg_list.txt ]]; then
  pacman -Qn > cronbackup/plaho1.txt #placeholder1 for new info
  pacman -Qm > cronbackup/plaho2.txt #placeholder2
  paste cronbackup/plaho1.txt > cronbackup/nativepkg_list.txt
  paste cronbackup/plaho2.txt > cronbackup/foreignpkg_list.txt
  rm cronbackup/plaho1.txt && rm cronbackup/plaho2.txt #removing placeholders
else
    pacman -Qn > cronbackup/nativepkg_list.txt # creates a list of all native packages
    pacman -Qm > cronbackup/foreignpkg_list.txt # creates a list of all foreign packages
  fi
tar -cjf cronbackup/pacman_database_backup.tar.bz2 /var/lib/pacman/local
