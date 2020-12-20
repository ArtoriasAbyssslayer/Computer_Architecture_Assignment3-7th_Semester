# -Computer_Architecture_Assignment3-7th_Semester-
## ΑΡΧΙΤΕΚΤΟΝΙΚΗ ΠΡΟΗΓΜΕΝΩΝ ΥΠΟΛΟΓΙΣΤΩΝ

#### Αναφορά 3ου Εργαστηρίου 

### Συγγραφείς : Σακελλαρίου Βασίλειος ΑΕΜ: 9400, Φίλης Χάρης ΑΕΜ:9449


### Βήμα 1 


**1)Dynamic Power και Leakage**</br>

Η σπατάλη/διασκορπισμός ισχύος στα κυκλώματα CMOS, έχει τρείς βασικές μορφές: την δυναμική ισχύ, την κοντού-κυκλώματος(συγκεντρωμένη) ισχύ και την ισχύ διαρροής.</br>

Τα κυκλώματα σπαταλούν/διασκορπίζουν δυναμική ισχύ όταν φορτίζουν και ξεφορτίζουν τα χωρητικά φορτία για να αλλάξουν κατάσταση οι λογικές πύλες. Η δυναμική ισχύς είναι ανάλογη της συνολικής χωριτικότητας του φορτίου, της παρεχόμενης τάσης, της ταλάντωσης τάσης κατά την διάρκεια της αλλαγής κατάστασης, της συχνότητας του ρολογιού και του παράγοντα εργασιών(activity factor). O οποίος υπολογίζεται από στατιστικά που παρέχονται από προσομοίωση της συγκεκριμένης αρχιτεκτονικής, μαζι με τις ιδιότητες του κυκλώματος (π.χ. διαστάσεις τρανζίστορ).</br>
Τα τρανζίστορ στα κυκλώματα παρουσιάζουν διαρροές, διασκορπίζοντας στατική ισχύ. Η διαρροή ρεύματος εξαρτάται από το εύρος/πλάτος των τρανζίστορ και την τοπική κατάσταση των συσκευών. Δύο μορφές μηχανισμών διαρροής είναι οι: subthreshold leakage, gate leakage. </br>
Η διαρροή Subthreshold συμβαίνει  επειδή ένα μικρό ρεύμα περνά μετάξύ της πηγής και της εκρροής των κλειστών τρανζίστορ.</br>
Η διαρροή Gate είναι το ρεύμα που διαρρέει μέσα από τον ακροδέκτη της βάσης του τρανζίστορ, και κυμαίνεται αρκετά με την κατάσταση του τρανζίστορ.

Όσον αφορά το δεύτερο ερώτημα, το leakage δεν επηρεάζεται για συγκεκριμένη αρχιτεκτονική(ίδιο processor area etc.) όμως αλλάζει το dynamic power(αυτό το επιβεβαιώσαμε με τα πειράματα του εργαστηρίου 2 που τρέξαμε). Όσον αφορά το μέγεθος του προγράμματος (χρόνο,cpi) επειδή το dynamic power είναι ανάλογο της συχνότητας του επεξεργαστή, είναι αντιστρόφως ανάλογο του χρόνου εκτέλεσης του προγράμματος.

**2)4W vs 40W**</br>
Η ενέργεια που περικλείει και δίνει μια μπαταρία είναι συγκεκριμένη. Την ενέργεια αυτή καταναλώνει ο επεξεργαστής για τις διάφορες λειτουργίες του. Η ενέργεια είναι το γινόμενο Ισχύς x Χρόνο, οπότε εκτός από την κατανάλωση ισχύος ενός επεξεργαστή παίζει ρόλο και ο χρόνος λειτουργίας του.Έτσι υπάρχει περίπτωση ο δεύτερος επεξεργαστής(40W) να δίνει στο σύστημα μεγαλύτερη διάρκεια μπαταρίας.</br>
Το McPAT μας δίνει αποτελέσματα μονο για την κατανάλωση ισχύος μέσα σε έναν επεξεργαστή.Θα χρειαζόμασταν και τον χρόνο εκτέλεσης για να απαντήσουμε.

**3)Ενεργειακή αποδοτικότητα επεξεργαστών Xeon, Arm A9** </br>
Τρέξαμε το mcpat για τον Xeon και τον ARM a9:
  * [Xeon](https://github.com/harryfilis/Computer_Architecture_Assignment3-7th_Semester/blob/master/mcpat_output_txt/Xeon.txt)
  * [ArmA9](https://github.com/harryfilis/Computer_Architecture_Assignment3-7th_Semester/blob/master/mcpat_output_txt/arm_A9.txt)</br>

Θεωρήσαμε ότι για έστω Τ αυθαίρετη μονάδα χρόνου, ο Xeon τρέχει το πρόγραμμα σε 1xT seconds και ο arm_A9 σε 40xT seconds(εφόσον ο Xeon είναι 40 φορές γρηγορότερος του Arm).</br>

Λαμβάνοντας σαν ισχύ που καταναλώνει ο επεξεργαστής για να τρέξει το πρόγραμμα το Runtime Dynamic(προσθέτουμε και το total leakage που είναι η διαρροή κατα την λειτουργία των επεξεργαστών) βρίσκουμε οτι:</br>
    
   * W_Xeon = (RuntimeDynamic+TotalLeakage) * Time = (72.92+36.83) * T  =  109.75T[J](Ενέργεια του Xeon)</br>
   * W_Arm = (RuntimeDynamic+TotalLeakage) * Time = (2.96+0.1) * 40T = 122.4T[J] (Η ενέργεια του Arm)</br>

O λόγος τους είναι : W_Xeon/W_Arm = 0.896 που αυτο αφορά όμως μόνο τον χρόνο εκτέλεσης του προγράμματος(εδώ Xeon πιο αποδοτικός).</br>
Ωστόσο στον υπόλοιπο χρόνο που τρέχει ο Arm (39Τ) ο Xeon μπαίνει σε idle mode και με βάση την έρευνα που κάναμε στην βιβλίογραφία:[xeon_stats_link](https://techreport.com/news/13036/new-xeons-bring-dramatically-lower-idle-power/) o Xeon έχει μέση idle ισχύ γύρω στα 50Watt(σε αυτό περιέχεται και το total leakage και μια μικρή δυναμική ισχύς).</br>

Ετσι η συνολική ενέργεια είναι:</br>
    
   * W_Xeon = 109.75 * Τ + 50 * 39T =  2059.75T[J] (run + idle mode)</br>
   * W_Arm  = 122.4 * Τ[J]  (run mode)</br>

Έτσι ο Xeon δεν μπορεί να είναι ενεργειακά αποδοτικότερος απο το Arm Α9.</br>

### Βήμα 2 gem5 + McPAT: αναζητώντας τη βελτιστοποίηση του γινομένου EDP


| TEST_TYPE | l1_dsize | l1_isize | l2_size | l1d_assoc | l1i_assoc | l2_assoc | cacheline_size |
|-|-|-|-|-|-|-|-|
| A | 64KB | 64KB | 512KB | 2 | 2 | 8 | 256 | 
| B | 128KB | 128KB | 1MB | 2 | 2 | 8 | 256 | 
| C | 128KB | 128KB | 2MB | 2 | 2 | 8 | 256 |
| D | 128KB | 128KB | 4MB | 2 | 2 | 8 | 256 |
| A1 | 128KB | 128KB | 4MB | 1 | 1 | 8 | 256 |
| B1 | 128KB | 128KB | 4MB | 4 | 4 | 8 | 256 | 
| C1 | 128KB | 128KB | 4MB | 8 | 8 | 8 | 256 |
| D1 | 128KB | 128KB | 4MB | 8 | 8 | 16| 256 |


'Oσον αφορά το peak power, αυτό βγαίνει το ίδιο σε κάθε benchmark για τις αρχιτεκτονικές που τρέξαμε γιατι εξαρτάται απο την αρχιτεκτονική.Το γράφημα για κάθε τύπο test είναι το εξής:</br>
![SpecPeakPower](https://github.com/harryfilis/Computer_Architecture_Assignment3-7th_Semester/blob/master/peak_power.png)

Kαι συγκριτικά με το processor area έχουμε το εξής γράφημα:</br>
![SpecArea](https://github.com/harryfilis/Computer_Architecture_Assignment3-7th_Semester/blob/master/area.png)

**Εnergy Delay Product**

Μας εδνιαφέρει το γινόμενο ενέργειας * delay(runtime). Η ενέργεια μεγαλώνει καθώς ανεβάζουμε οποιοδήποτε παράγοντα όμως δραματικές πτώσεις runtime έχουμε μόνο όταν ανεβάζουμε το cache line size (και οχι πάντα). Οπότε παίρνουμε την αρχιτεκτονική που έχει την μεγαλύτερη πτώση runtime(που δηλ δεν είναι αμελητέα) που όπως είδαμε στην δεύτερη εργασία εξάρτάται απο το cache line size  και θέλουμε να επιτύχουμε μικρότερη ενέργεια.
Το associativity μειώνει πάρα πολύ λίγο το runtime και αυξάνει την ενέργεια με την αύξησή του οπότε παίρνουμε το default και δεν το χρησιμοποιούμε στα γραφήμτα.
Επίσης από μεγέθη μνημών παίρνουμε το test type A το οποίο χρησιμοποιεί μικρότερη L2 και μειώνει το EDP αλλά και το EDA(Energy Delay Area).

![specbzipEDP](https://github.com/harryfilis/Computer_Architecture_Assignment3-7th_Semester/blob/master/EDP%20plots/specbzipEDP.png)
![spechmmerEDp](https://github.com/harryfilis/Computer_Architecture_Assignment3-7th_Semester/blob/master/EDP%20plots/spechmmerEDP.png)
![speclibmEDP](https://github.com/harryfilis/Computer_Architecture_Assignment3-7th_Semester/blob/master/EDP%20plots/speclibmEDP.png)
![specmcfEDP](https://github.com/harryfilis/Computer_Architecture_Assignment3-7th_Semester/blob/master/EDP%20plots/specmcfEDP.png)
![specsjengEDP](https://github.com/harryfilis/Computer_Architecture_Assignment3-7th_Semester/blob/master/EDP%20plots/specsjengEDP.png)
### Πηγές 



### Κριτική Εργασίας

1. Υπήρχε πρόβλημα με ορισμένες εντολές που έτρεχαν σε python 2 και έπρεπε να αλλάξουν.

### Τέλος Αναφοράς 

