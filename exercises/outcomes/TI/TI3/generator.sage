class Generator(BaseGenerator):
    def data(self):
        from sage.symbolic.integration.integral import definite_integral
        
        x=var("x")

        
        even=2*randint(1,6)
        
        odd=2*randint(0,2)+1
        
        powers=[even, odd]
        shuffle(powers)
        n=powers[0]
        m=powers[1]
        
        f=randint(1,5)*(sin(x))^n*(cos(x))^m
        
        F=f.integral(x)
        

        return {
          "f": f,
          "F": F, 
        }
