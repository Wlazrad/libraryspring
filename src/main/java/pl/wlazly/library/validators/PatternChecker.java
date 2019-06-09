package pl.wlazly.library.validators;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class PatternChecker {

    public static boolean check(String pattern, String input) {

        Pattern p = Pattern.compile(pattern);
        Matcher m = p.matcher(input);
        return m.matches();
    }
}
