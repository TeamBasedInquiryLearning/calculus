class Generator(BaseGenerator):
    def data(self):
        from sage.symbolic.integration.integral import definite_integral
        
        t=var("t")

        linear=Integer(randint(1,5))*choice([-1,1])/Integer(randint(1,5))*t+Integer(randint(-5,5))
        
        funct=choice([
                Integer(randint(1,5))*choice([-1,1])/Integer(randint(1,5))*t+Integer(randint(-5,5)),
                Integer(randint(1,5))*choice([-1,1])/Integer(randint(1,5))*Integer(randint(2,4))^t,
                Integer(randint(1,5))*choice([-1,1])*sin(t)+Integer(randint(1,5))*choice([-1,1]),
                Integer(randint(1,5))*choice([-1,1])*cos(t)+Integer(randint(1,5))*choice([-1,1]),
            ])
        
        equations=[linear, funct]
        shuffle(equations)
        
        xt=equations[0]
        yt=equations[1]
        
        name=choice(['r', 's','k', 'g', 'z', 'm', 'v', 'w'])
        
        
        

        return {
            "xt": xt,
            "yt": yt,
            "name": name,  
            
        }
