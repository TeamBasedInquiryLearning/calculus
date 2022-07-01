class Generator(BaseGenerator):
    def data(self):
        from sage.symbolic.integration.integral import definite_integral
        import random # SB: this is needed for the c vs. d thing in partials
        
        x=var("x")

        
        #U-Sub
        out(x)=0
        u(x)=0
        
        while(out(x)==u(x)):
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
        f=(k*out(u(x)))
        dfdx=(f.diff()).simplify()
        
        usub=[dfdx, 'Substitution']
        
        #Parts
        
        g=randint(1,5)*choice([-1,1])*choice([cos(x), sin(x), e^x])*x^(2*randint(0,3)+1)
        
        parts=[g, 'Integration by parts']
        
        a=randint(1,5)*choice([-1,1])
        b=randint(1,5)*choice([-1,1])
        # SB: If a = -b and c = d, then h works out to be 0.
        # Fix: Force c != d. 
        #c=randint(-5,5)
        #d=randint(-5,5)
        [c, d] = random.sample(range(-5, 5), 2)
        
        h=(a*(x-d)+b*(x-c))/((x-c)*(x-d))
        
        partial=[h, 'Partial fractions']
        
        ftrig=choice([
                1/(x^2+randint(1,5)^2), #SB EDIT: used to be x, now is x^2
                sqrt(randint(1,5)^2-x^2),
                sqrt(x^2-randint(1,5)^2),
            ])
        
        trigsub=[ftrig, 'Trigonometric substitution']
        
        integrals=[usub, parts, partial, trigsub]
        
        shuffle(integrals)
        
        f1=(integrals[0])[0]
        a1=(integrals[0])[1]
        
        f2=(integrals[1])[0]
        a2=(integrals[1])[1]
        
        f3=(integrals[2])[0]
        a3=(integrals[2])[1]
        
        f4=(integrals[3])[0]
        a4=(integrals[3])[1]
        

        return {
        "f1": f1,
        "a1": a1,
        "f2": f2,
        "a2": a2,
        "f3": f3,
        "a3": a3,
        "f4": f4,
        "a4": a4,  
        }
