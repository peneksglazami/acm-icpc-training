/**************************
 Problem: 382 - Perfection
 Solved by Andrey Grigorov
 **************************/

import java.io.*;
import java.util.*;

class Main {

    static String ReadLn(int maxLg) {
        byte lin[] = new byte[maxLg];
        int lg = 0, car = -1;
        String line = "";

        try {
            while (lg < maxLg) {
                car = System.in.read();
                if ( (car < 0) || (car == '\n')) {
                    break;
                }
                lin[lg++] += car;
            }
        }
        catch (IOException e) {
            return (null);
        }
        if ( (car < 0) || (lg == 0)) {
            return (null);
        }
        return (new String(lin, 0, lg));
    }

    public static void main(String args[]) {
        Main MyWork = new Main();
        MyWork.Begin();
    }

    int Sum(int n) {
        int i, s = 0;

        for (i = 1; i < n; i++) {
            if (n % i == 0) {
                s += i;
            }
        }
        return s;
    }

    void Begin() {
        int n;
        boolean ok = true;
        System.out.println("PERFECTION OUTPUT");
        while (ok) {
            StringTokenizer Str = new StringTokenizer(ReadLn(10000));
            n = Integer.parseInt(Str.nextToken());
            while (n > 0) {
                String St = new Integer(n).toString();
                while (St.length() < 5) {
                    St = new String(" " + St);
                }
                System.out.print(St + "  ");
                if (n == Sum(n)) {
                    System.out.println("PERFECT");
                }
                else
                if (n > Sum(n)) {
                    System.out.println("DEFICIENT");
                }
                else {
                    System.out.println("ABUNDANT");
                }
                if (Str.countTokens() > 0) {
                    n = Integer.parseInt(Str.nextToken());
                }
                else {
                    break;
                }
            }
            ok = ! (n == 0);
        }
        System.out.println("END OF OUTPUT");
    }
}