class Generator(BaseGenerator):
    def data(self):
        from sage.symbolic.integration.integral import definite_integral
        
        x=var("x")
        n=var("n")

        
        funct=choice(['sin', 'cos', 'exp', 'oneover'])
        
        #funct='oneover'
        
        a=Integer(randint(1,5)*choice([-1,1]))
        k=Integer(randint(2,5))
        m=Integer(randint(1,5))
        c=Integer(randint(1,5)*choice([-1,1]))
        
        if funct=='sin':
            f=sin(x)
            fak=sin(a*x^k)
            fm=x^m*sin(x)
            seq=(-1)^n*x^(2*n+1)/factorial(2*n+1)
            seqak=(-1)^n*(a*x^k)^(2*n+1)/factorial(2*n+1)
            seqm=(-1)^n*x^(2*n+1+m)/factorial(2*n+1)
            seqdiff=(-1)^n*x^(2*n)/factorial(2*n)
            seqint=(-1)^(n+1)*x^(2*n)/factorial(2*n)
            start=1
            
            
            
        if funct=='cos':
            f=cos(x)
            fak=cos(a*x^k)
            fm=x^m*cos(x)
            seq=(-1)^n*x^(2*n)/factorial(2*n)
            seqak=(-1)^n*(a*x^k)^(2*n)/factorial(2*n)
            seqm=(-1)^n*x^(2*n+m)/factorial(2*n)
            seqdiff=(-1)^(n+1)*x^(2*n+1)/factorial(2*n+1)
            seqint=(-1)^(n)*x^(2*n+1)/factorial(2*n+1)
            start=0
        
        if funct=='exp':
            f=e^x
            fak=e^(a*x^k)
            fm=x^m*e^x
            seq=x^(n)/factorial(n)
            seqak=(a*x^k)^(n)/factorial(n)
            seqm=x^(n+m)/factorial(n)
            seqdiff=x^(n)/factorial(n)
            seqint=x^(n)/factorial(n)
            start=1
            
        if funct=='oneover':
            f=(1-x).power(-1,hold=True)
            fak=(1-a*x^k).power(-1,hold=True)
            fm=x^m*(1-x).power(-1,hold=True)
            seq=x^(n)
            seqak=(a*x^k)^(n)
            seqm=x^(n+m)
            seqdiff=(n+1)*x^(n)
            seqint=x^n/n
            start=1
            
        
        
        
        prob=choice(['int', 'diff'])
        
        
        
        
        

        return {
            "f": f,
            "fak": fak,
            "fm": fm,
            "seq": seq,
            "seqak":seqak,
            "seqm":seqm,
            "seqdiff":seqdiff,
            "seqint":seqint,
            "start":start,
            "c":c,  
            prob:True,  
        }
