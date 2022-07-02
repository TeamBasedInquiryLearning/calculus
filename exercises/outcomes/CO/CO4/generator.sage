class Generator(BaseGenerator):
    def data(self):
        from sage.symbolic.integration.integral import definite_integral
        
        theta = var('t', latex_name=r"\theta")
        r=var("r")
        x=var("x")
        y=var("y")

        
        #graphs=['through', 'horizontal']
        graphs=['through', 'horizontal', 'vertical', 'tanx', 'tany']
        
        
        shuffle(graphs)
        
        graph1=graphs[0]
        graph2=graphs[1]
        
        if graph1=='through':
            lhs1=y
            m=randint(1,5)*choice([-1,1])
            rhs1=m*x
            lhsa1=theta
            rhsa1=arctan(m)
        
        if graph1=='horizontal':
            lhs1=y
            a=randint(1,5)*choice([-1,1])
            rhs1=a
            lhsa1=r
            rhsa1=a*csc(theta)
        
        if graph1=='vertical':
            lhs1=x
            a=randint(1,5)*choice([-1,1])
            rhs1=a
            lhsa1=r
            rhsa1=a*sec(theta)
        
        if graph1=='tanx':
            c=randint(1,5)*choice([-1,1])
            lhs1=(x-c)^2+y^2
            rhs1=c^2
            lhsa1=r
            rhsa1=c*cos(theta)
            
        if graph1=='tany':
            c=randint(1,5)*choice([-1,1])
            lhs1=(x)^2+(y-c)^2
            rhs1=c^2
            lhsa1=r
            rhsa1=c*sin(theta)
            
        
            
        if graph2=='through':
            lhs2=theta
            th=choice([-1,1, -2, 2])*choice([pi/6, pi/4, pi/3])    
            rhs2=th
            lhsa2=y
            rhsa2=tan(th)
        
        if graph2=='horizontal':
            a=randint(1,5)*choice([-1,1])
            lhs2=r
            rhs2=a*csc(theta)
            lhsa2=y
            rhsa2=a
        
        if graph2=='vertical':
            a=randint(1,5)*choice([-1,1])
            lhsa2=x
            rhsa2=a
            lhs2=r
            rhs2=a*sec(theta)
        
        if graph2=='tanx':
            c=randint(1,5)*choice([-1,1])
            lhsa2=(x-c)^2+y^2
            rhsa2=c^2
            lhs2=r
            rhs2=c*cos(theta)
            
        if graph2=='tany':
            c=randint(1,5)*choice([-1,1])
            lhsa2=(x)^2+(y-c)^2
            rhsa2=c^2
            lhs2=r
            rhs2=c*sin(theta)    

        return {
            "lhs1": lhs1,
            "rhs1": rhs1, 
            "lhsa1": lhsa1,
            "rhsa1": rhsa1,
            "lhs2": lhs2,
            "rhs2": rhs2, 
            "lhsa2": lhsa2,
            "rhsa2": rhsa2,  
        }
