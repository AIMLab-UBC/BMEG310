## HW 1

VCF (Variant Call Format) is a standardized text file format that is used to store genetic variation calls such as SNPs or insertions/deletions. 
In the following first part of the exercise, we will explore how the information in a VCF is stored

# upload data
### First it is read the csv file

### Q1: How many indel variants do you see?


### Q2: Find the position of indels with read depth (DP) greater than 15.


### Q3: "QUAL" is the phred-scaled quality score, a measure for how likely it is that this site is indeed a variant. Lower QUAL scores indicate low probability of a polymorphism existing at that site. We can convert the confidence value QUAL to a probability value according to the formula:
### Probability = 1- 10 ^ -(QUAL/10)

### Write a function that takes a VCF file and appends the calculated probability value as an additional column to the original VCF file.


###  Q4: Write a function that gets an altered allele (ALT) for non indel variants then returns the name and frequency of reference alleles (REF). Report  your values for "T".


### Q5: How many variants have more than two deletions? Print the name of the associated reference allele (REF)
### * Altered allele (ALT) is shorter than Reference allele (REF)


