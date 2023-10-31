class Generator(BaseGenerator):
    def data(self):
        var_letter = "x" # choice(["x", "y", "h"])
        x = var(var_letter)
        problem_kind = randrange(1, 5)
        # pk = 1: sin nx / nx ; pk = 2: sin nx / x ; pk = 3: cos nx - 1 / x ; pk = 4 : sin(nx)^2 / (nx)^2
        if problem_kind == 1:
            n = randrange(2, 10)
            f = sin(n*x) / (n*x)
            lim = limit(f, x=0)
            package = {
                "f": f,
                "lim": lim,
                "place": 0,
                "x": x,
            }
        elif problem_kind == 2:
            n = randrange(2, 10)
            flip = randrange(0, 2)
            n_in_den = randrange(0, 2)
            if n_in_den:
                f = sin(n*x) / x
            else:
                f = sin(x) / (n * x)
            if flip:
                f = 1/f
            lim = limit(f, x=0)
            package = {
                "f": f,
                "lim": lim,
                "place": 0,
                "x": x,
            }
        elif problem_kind == 3:
            n = randrange(2, 10)
            f = (cos(n*x) - 1) / x
            place = choice([-pi/2, pi/2, -3*pi/2, 3*pi/2])
            lim = limit(f, x=place)
            package = {
                "f": f,
                "lim": lim,
                "x": x,
                "place": place
            }
        else: # pk == 4
            n = randrange(2, 10)
            f = (sin(n*x))^2 / (n*x)^2
            lim = limit(f, x=0)
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

