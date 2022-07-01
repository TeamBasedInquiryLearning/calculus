class Generator(BaseGenerator):
    def data(self):
        x=var("x")
        from sage.symbolic.integration.integral import indefinite_integral

        c1=randint(-5,5)
        c2=randint(-5,5)
        c3=randint(1,3)^2
        
        A=randint(1,5)*choice([-1,1])
        B=randint(1,5)*choice([-1,1])
        Cx=randint(1,5)*choice([-1,1])*x^choice([0,1])
        
        linear= B/(x+c2)
        
        if c2==c1:
            linear=B/(x+c2)^2
        
        
        f=A/(x+c1)+choice([linear, (Cx)/(x^2+c3)])
        
        f=f.simplify_full()
        
      
            
        pf=f.partial_fraction()
        
        F=indefinite_integral(f, x)

        return {
          "f": f,
          "pf": pf,
          "F": F,  
        }
