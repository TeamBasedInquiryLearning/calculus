class Generator(BaseGenerator):
    def data(self):
        x=var("x")
        y=var("y")
        from sage.symbolic.integration.integral import definite_integral

        
        
        
        scenario=randint(0,3)
        
        if scenario==0:
            m=randint(1,6)/2
            b=randint(0,3)
            f(x)=m*x+b
            
        if scenario==1:
            m=randint(1,6)/2
            b=randint(0,3)
            f(x)=m*x^2+b
            
        if scenario==2:
            m=randint(1,6)
            b=randint(0,3)
            f(x)=m*e^x+b
            
        if scenario==3:
            m=randint(1,6)
            b=randint(0,3)
            f(x)=sqrt(m*x+b)
        
        fp(x)=diff(f(x),x)
        
        a=randint(0,3)
        b=a+randint(1,4)
        

                        
        
                            
                            
        

        return {
            "f": f(x),
            "fp": fp(x),
            "a": a,
            "b": b,  
        }

