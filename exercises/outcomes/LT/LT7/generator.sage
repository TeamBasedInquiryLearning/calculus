class Generator(BaseGenerator):
    def data(self):
        var_letter = "x" # choice(["x", "y", "h"])
        x = var(var_letter)
        problem_kind = randrange(1, 5)
        if problem_kind == 1:
            n = randrange(2, 10)
            m = randrange(2, 10)
            flip = choice([True, False])
            f = sin(m*x) / (n*x)
            lim = m/n
            if flip:
                f = 1/f
                lim = 1/lim
            package = {
                "f": f,
                "lim": lim,
                "place": 0,
                "x": x,
            }
        elif problem_kind == 2:
            n = randrange(2, 10)
            flip = choice([True, False])
            n_in_den = choice([True, False])
            lim = n
            if n_in_den:
                f = sin(n*x) / x
            else:
                f = sin(x) / (n * x)
            if flip:
                f = 1/f
                lim = 1/n
            package = {
                "f": f,
                "lim": lim,
                "place": 0,
                "x": x,
            }
        elif problem_kind == 3:
            n = randrange(2, 10)
            f = (cos(n*x) - 1) / x
            place = choice([-pi/2, pi/2, 0, pi, -pi, -3*pi/2, 3*pi/2, -2*pi, 2*pi])
            lim = 0
            package = {
                "f": f,
                "lim": lim,
                "x": x,
                "place": place
            }
        else: # pk == 4
            n, m =  sample(range(2, 10), 2)
            f = sin(n*x) / sin(m*x)
            lim = n/m
            package = {
                "f": f,
                "lim": lim,
                "place": 0,
                "x": x,
            }

        return package

