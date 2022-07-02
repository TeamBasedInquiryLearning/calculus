class Generator(BaseGenerator):
    def data(self):
        n=var("n")

        #define an arithmetic sequence
        initialA1=randint(1,5)*(-1)^randint(0,1)
        diffA1=randint(2,5)*(-1)^randint(0,1)
        A1(n)=initialA1+diffA1*n
        coeffA1=1
        tailA1=diffA1
        Seq1={
            "Formula":A1(n),
            "t0":A1(0),
            "t1":A1(1),
            "t2":A1(2),
            "t3":A1(3),
            "t4":A1(4),
            "t5":A1(5),
            "t6":A1(6),
            "t7":A1(7),
            "c":coeffA1,
            "tail":tailA1,
        }
        
        #define a geometric sequence
        initialA2=randint(1,5)*(-1)^randint(0,1)
        ratioA2list=[randint(2,4), 1/randint(2,4)]
        shuffle(ratioA2list)
        ratioA2=ratioA2list[0]*(-1)^randint(0,1)
        A2(n)=initialA2*ratioA2^n
        coeffA2=ratioA2
        tailA2=0
        Seq2={
            "Formula":A2(n),
            "t0":A2(0),
            "t1":A2(1),
            "t2":A2(2),
            "t3":A2(3),
            "t4":A2(4),
            "t5":A2(5),
            "t6":A2(6),
            "t7":A2(7),
            "c":coeffA2,
            "tail":tailA2,
        }
        
        #define a 'quadratic' sequence
        initialA3=randint(0,5)
        aA3=1
        A3(n)=aA3*n^2+initialA3
        m=aA3*2
        k=-aA3
        coeffA3=1
        tailA3=m*n+k
        Seq3={
            "Formula":A3(n),
            "t0":A3(0),
            "t1":A3(1),
            "t2":A3(2),
            "t3":A3(3),
            "t4":A3(4),
            "t5":A3(5),
            "t6":A3(6),
            "t7":A3(7),
            "c":coeffA3,
            "tail":tailA3,
        }
        
        Sequences = [Seq1, Seq2, Seq3]
        shuffle(Sequences)
        
        #Shuffle the sequences with terms given
        Given = Sequences[0]
        
        #Shuffle the sequences with closed forms given
        Closed = Sequences[1]
        
        Recursive = Sequences[2]
        
        
        
        

        return {
            "Closed": Closed,
            "Given": Given,
            "Recursive": Recursive,  
        }
