class Generator(BaseGenerator):
    def data(self):
        from sage.symbolic.integration.integral import definite_integral
        
        x=var("x")
        n=var("n")

        numerator=choice([randint(2,5)^n+randint(-5,5), randint(2,5)*n+randint(-5,5) ])
        denominator=factorial(randint(1,3)*n)
        
        s(n)=numerator/denominator
        
        k=randint(2,3)
        
        pk(x)=0
        
        for i in range(k+1):
            pk(x)=pk(x)+s(i)*x^i
        
        c=randint(1,3)*choice([-1,1])    
        a=randint(-5,5)    
        b=a+randint(1,5)
        
        
        pint=definite_integral(pk(x),x,a,b)
        
        pkc=pk(c)
        
        

        return {
            "sn": s(n),
            "k": k,
            "pk": pk(x),
            "pkc": pkc,
            "pint":pint,
            "a":a,
            "b":b,  
            "c":c,  
        }
