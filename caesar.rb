
def caesar(sentence, shift)
    new_sentence_array = sentence.each_byte.map{ |code|
        upcase_a_code = 65
        downcase_a_code = 97
        code_root = (code >= downcase_a_code) ? downcase_a_code : upcase_a_code  # So as to be case agnostic
        case_agnostic_code = code - code_root  # char code relative to root letters in alphabet
        (code_root + modolo(case_agnostic_code + shift, 26)).chr
        # NOTE TO LATER SELF: if you're tempted to put a return here, be wary that that exits the function, not only the block.
    }
    new_sentence_array.join("")
end

def modolo(a, b)
    # Quick implementation of real modolo that loops properly
    remainder = a % b
    return (remainder < 0) ? b + remainder : remainder
end

## TEST:
p caesar("ABCZz", 1)    # WORKS
p caesar("ålesund", 1)  # FAILS, non standard asci
p caesar("alesu😌d", 1) # FAILS, emojies