aadharNum = input("Enter your Aadhar Number: ")

def mask_aadhar(aadharNum):
    substring1 = aadharNum[:4]

    
    result = "xxxxxxxx" + substring1
    print("Masked Aadhar Number: ", result)
    return result

masked_aadhar = mask_aadhar(aadharNum)


