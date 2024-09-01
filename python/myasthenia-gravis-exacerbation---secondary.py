# phekb, 2024.

import sys, csv, re

codes = [{"code":"45557252","system":"ICD10CM"},{"code":"45566900","system":"ICD10CM"},{"code":"45557252","system":"ICD10CM"},{"code":"45566900","system":"ICD10CM"},{"code":"44821861","system":"ICD10CM"},{"code":"44825351","system":"ICD10CM"},{"code":"44821861","system":"ICD10CM"},{"code":"44825351","system":"ICD10CM"},{"code":"43531560","system":"ICD10CM"},{"code":"43531561","system":"ICD10CM"},{"code":"43531560","system":"ICD10CM"},{"code":"43531561","system":"ICD10CM"},{"code":"45557252","system":"ICD10CM"},{"code":"45566900","system":"ICD10CM"},{"code":"45557252","system":"ICD10CM"},{"code":"45566900","system":"ICD10CM"},{"code":"44821861","system":"ICD10CM"},{"code":"44825351","system":"ICD10CM"},{"code":"44821861","system":"ICD10CM"},{"code":"44825351","system":"ICD10CM"},{"code":"43531560","system":"ICD10CM"},{"code":"43531561","system":"ICD10CM"},{"code":"43531560","system":"ICD10CM"},{"code":"43531561","system":"ICD10CM"}];
REQUIRED_CODES = 1;
with open(sys.argv[1], 'r') as file_in, open('myasthenia-gravis-potential-cases.csv', 'w', newline='') as file_out:
    csv_reader = csv.DictReader(file_in)
    csv_writer = csv.DictWriter(file_out, csv_reader.fieldnames + ["myasthenia-gravis-exacerbation---secondary-identified"])
    csv_writer.writeheader();
    codes_identified = 0;
    for row in csv_reader:
        newRow = row.copy();
        for cell in row:
            # Iterate cell lists (e.g. codes)
            for item in re.findall(r'\(([^,]*)\,', row[cell]):
                if(item in list(map(lambda code: code['code'], codes))): codes_identified+=1;
                if(codes_identified>=REQUIRED_CODES):
                    newRow["myasthenia-gravis-exacerbation---secondary-identified"] = "CASE";
                    break;
            if(codes_identified>=REQUIRED_CODES): break;
        if(codes_identified<REQUIRED_CODES):
            newRow["myasthenia-gravis-exacerbation---secondary-identified"] = "UNK";
        codes_identified=0;
        csv_writer.writerow(newRow)
