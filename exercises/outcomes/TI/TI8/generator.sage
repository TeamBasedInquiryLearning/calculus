class Generator(BaseGenerator):
    def data(self):
        x=var("x")
        from sage.symbolic.integration.integral import indefinite_integral

        n=randint(2,5)
        c=randint(-3,3)
        
        f=choice([1/(x-c)^n, 1/(x-c)^(1/n)])
        
        F(x)=indefinite_integral(f, x)
        Fsymb=indefinite_integral(f, x)
        
        a=c+randint(2,6)
        
        Int1=0
        Int2=0
        
        Limit1=F.limit(x=c, dir='right')
        Converge1=False
        if Limit1 <oo and Limit1>-oo:
            Converge1=True
            Int1=F(a)
        
        Limit2=F.limit(x=oo)
        Converge2=False
        if Limit2 <oo and Limit2>-oo:
            Converge2=True
            Int2=-1*F(a)
        
        
        
        Problem1={
            "Limit":Int1,
            "Converge":Converge1,
        }
        
        Problem2={
            "Limit":Int2,
            "Converge":Converge2,
        }

        return {
        "f": f,
        "F": Fsymb,  
        "a": a,
        "c": c,
        "Problem1": Problem1,
        "Problem2": Problem2,  
        }
