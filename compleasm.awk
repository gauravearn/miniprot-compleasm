#!/usr/bin/awk
# Author Gaurav Sablok
# University Potsdam
# Date 2024-3-22  
readfile () BEGIN {
    #if you want to see which are the duplicated genes then use this
  cat full_table.tsv | awk '/Duplicated/ { print $1"\t"$2"\t"$3"\t"$4 }'
  cat full_table.tsv | awk !'/Duplicated/ { print $1"\t"$2"\t"$3"\t"$4 }'
   #getting the unique duplicates genes out of the annotations.
  cat full_table.tsv | awk '/Duplicated/ { print $1"\t"$2"\t"$3"\t"$4 }' \
                                   | awk '{ print $3 }' | sort | uniq -c | wc -l
  cat full_table.tsv | awk '/Duplicated/ { print $1"\t"$2"\t"$3"\t"$4 }' \
                                      | awk '{ print $3 }' | sort | uniq -c | wc -l
  #getting the unique single genes out of the annotations.
  cat full_table.tsv | awk !'/Duplicated/ { print $1"\t"$2"\t"$3"\t"$4 }' \
                                         | awk '{ print $3 }' | sort | uniq -c | wc -l
  cat full_table.tsv | awk !'/Duplicated/ { print $1"\t"$2"\t"$3"\t"$4 }' \
                                          | awk '{ print $3 }' | sort | uniq -c | wc -l
}
END
