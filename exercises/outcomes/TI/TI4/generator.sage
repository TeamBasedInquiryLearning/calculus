class Generator(BaseGenerator):
    def data(self):
        x=var("x")
        theta=var("theta")

        subtype=choice(["sin", "tan"])
        
        outfactors = [
            sqrt(x),
            1/x,
            1/sqrt(x),
        ]
        
        shuffle(outfactors)
        out(x)=outfactors[0]
        
        k=randint(1,5)
        
        if(subtype=="sin"):
            u(x)=k^2-x^2
            trigsub=k*sin(theta)
            trigsimp=(k*cos(theta))^2
            dxsub=k*cos(theta)
            
        if(subtype=="tan"):
            u(x)=k^2+x^2
            trigsub=k*tan(theta)
            trigsimp=(k*sec(theta))^2
            dxsub=k*(sec(theta))^2
            
            
        f=out(u(x))
        fsub=out(u(trigsub))*dxsub
        fsubsimp=out(trigsimp)*dxsub
        
        return {
        "f": f,
        "fsub": fsub,
        "fsubsimp": fsubsimp.simplify(),
        "trigsub": trigsub,
        "dxsub": dxsub,  
        }
