class Generator(BaseGenerator):
    def data(self):
        #from sympy.calculus.singularities import singularities
        from sage.symbolic.integration.integral import definite_integral
        
        x = var("x")

        # define possible factors
        
        out(x)=0
        u(x)=0
        
        f=x
        
            
        while(out(x)==u(x) or derivative(f, x, 2)==0):
            outfactors = [
                x^randint(2,5),
                sqrt(x),
                log(x),
                e^x,
                cos(x),
                sin(x),
                1/sqrt(x),
            ]
            
            ufactors = [
                x^randint(2,5)+randint(-5,5),
                log(x),
                e^x,
                cos(x),
                sin(x),
            ]
            shuffle(outfactors)
            shuffle(ufactors)
            
            out(x)=outfactors[0]
            u(x)=ufactors[0]
        
            k=randint(1,5)*choice([-1,1])
        
        
            f=k*out(u(x))
        
        
        dfdx=f.diff()
        
        scenario=randint(0,2)
        
        if scenario==0:
            n=randint(1,3)
            c=randint(1,4)
            a=randint(0,5)
            b=randint(a+1, a+6)
            g(x)=e^(c*x^n)*x^(n-1)
            defint=definite_integral(g(x),x,a,b)
            
        if scenario==1:
            c=randint(2,5)/choice([2,3,4,6])
            a0=randint(0,5)/choice([2,3,4,6])
            b0=randint(6, 10)
            a=(a0*pi/c)
            b=(b0*pi/c)
            
            g(x)=sin(c*x)
            defint=definite_integral(g(x),x,a,b)
        
        if scenario==2:
            c=randint(2,5)
            a0=randint(0,5)/choice([2,3,4,6])
            b0=randint(6, 10)/choice([2,3,4,6])
            a=(a0*pi/c)
            b=(b0*pi/c)
            
            g(x)=cos(c*x)
            defint=definite_integral(g(x),x,a,b)
            
        
        
        

        return {
            "f": f.simplify(),
            "dfdx": dfdx.simplify(),
            "g": g(x),
            "a": a,
            "b": b,
            "defint": defint,
        }
