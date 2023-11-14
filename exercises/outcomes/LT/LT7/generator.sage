class Generator(BaseGenerator):
    def data(self):
        var_letter = "x" # choice(["x", "y", "h"])
        x = var(var_letter)
        problem_kind = randrange(1, 5)
        # pk = 1: sin mx / nx ; pk = 2: sin nx / x ; pk = 3: cos nx - 1 / x ; pk = 4 : sin(nx)^2 / (nx)^2
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
            # n = randrange(2, 10)
            # m = randrange(2, 10)
            # while m == n:
            #     m = randrange(2, 10)
            f = sin(n*x) / sin(m*x)
            lim = n/m
            package = {
                "f": f,
                "lim": lim,
                "place": 0,
                "x": x,
            }

        return package

      # scratch work
      # coeff1 = randrange(2,9)
      # coeff2 = randrange(2,9)
      # while coeff2 == coeff1:
      #   coeff2 = randrange(2,9)
      # top_list = [sin(coeff1*x), cos(coeff1*x) - 1, 1-cos(coeff1*x), coeff1*x]
      # bot_list = [sin(coeff2*x), coeff2*x]
      # top = choice(top_list)
      # bot = choice(bot_list)
      # while top == top_list[-1] and bot == bot_list[-1]:
      #   bot = choice(bot_list)
      # f = top/bot
      # # calculate limit
      # lim = limit(f, x=0)
      # package = [
      #   {
      #     "f": f,
      #     "lim": lim,
      #     "x": x,
      #   }
      # ]

