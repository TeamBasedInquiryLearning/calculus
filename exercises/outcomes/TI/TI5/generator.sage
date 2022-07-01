class Generator(BaseGenerator):
    def data(self):
        from sympy.calculus.singularities import singularities
        from sage.symbolic.integration.integral import indefinite_integral
        
        x = var("x")

        # define possible factors
        
        scenario=randint(0,10)
        
        c=randint(1,5)*choice([-1,1])
        a=randint(1,10)
        u=randint(1,10)*x
        du=u/x
        
        if scenario==0:
            f=c*du/(a^2+u^2)
        if scenario==1:
            f=c*du/sqrt(u^2+choice([-1,1])*a^2)    
        if scenario==2:
            f=c*du*sqrt(u^2+choice([-1,1])*a^2)     
        if scenario==3:
            f=c*du*u^2/sqrt(u^2+choice([-1,1])*a^2)     
        if scenario==4:
            f=c*du/(u*sqrt(u^2+a^2))     
        if scenario==5:
            f=c*du/(u*sqrt(u^2-a^2))    
        if scenario==6:
            f=c*du/sqrt(a^2-u^2)     
        if scenario==7:
            f=c*du*sqrt(a^2-u^2)
        if scenario==8:
            f=c*du*u^2/sqrt(a^2-u^2)    
        if scenario==9:
            f=c*du/(u*sqrt(a^2-u^2))    
        if scenario==10:
            f=c*du/(u^2*sqrt(a^2-u^2))
        
        
        F=indefinite_integral(f, x)
            
        
        
        

        return {
            "f": f,
            "F": F.simplify(),
        }
