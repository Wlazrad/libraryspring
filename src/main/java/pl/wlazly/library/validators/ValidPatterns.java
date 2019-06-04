package pl.wlazly.library.validators;

public class ValidPatterns {

    public static final String PASSWORD = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[\\p{Punct}])(?=\\S+$).{8,}$";
        /*^                  # start-of-string
        (?=.*[0-9])          # a digit must occur at least once
        (?=.*[a-z])          # a lower case letter must occur at least once
        (?=.*[A-Z])          # an upper case letter must occur at least once
        (?=.*[\\p{Punct}])   # a special character must occur at least once, one of: !"#$%&'()*+,-./:;<=>?@[\]^_`{|}~
        (?=\S+$)             # no whitespace allowed in the entire string
        .{8,}                # anything, at least eight places though
        $                    # end-of-string
        */

    public static final String EMAIL = "^[a-zA-z0-9]+[\\._a-zA-Z0-9]*@[a-zA-Z0-9]+{2,}\\.[a-zA-Z]{2,}[\\.a-zA-Z0-9]*$";

}
