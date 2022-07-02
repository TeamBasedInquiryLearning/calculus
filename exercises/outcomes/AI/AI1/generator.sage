class Generator(BaseGenerator):
    def data(self):
        # FIXME very slow!
        x=var("x")
        from sage.symbolic.integration.integral import definite_integral

        
        
        
        functions=[
            randint(1, 5)*choice([-1,1])*e^(randint(1, 5)*choice([-1,1])*x),
            randint(1, 5)*choice([-1,1])*sin(randint(1, 5)*choice([-1,1])*x*pi/randint(2,4)),
            randint(1, 5)*choice([-1,1])*cos(randint(1, 5)*choice([-1,1])*x*pi/randint(2,4)),
            
        ]
        
        f(x)=choice(functions)+randint(-5, 5)*x^2+randint(-5, 5)*x+randint(-5, 5)
        
        a=randint(0,3)
        b=a+randint(1,4)
        
        fint=definite_integral(f(x),x,a,b)
        favg=fint/(b-a)

        return {
          "f": f(x),
          "favg": favg,
          "a": a,
          "b": b,  
        }
