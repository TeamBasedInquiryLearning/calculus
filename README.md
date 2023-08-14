# Calculus for Team-Based Inquiry Learning

Materials for teaching single-variable calculus using
Team-Based Inquiry Learning, authored in
[PreTeXt](https://pretextbook.org/). This is a part of the
[TBIL Resource Library](http://library.tbil.org). This work was
funded in part by the National Science Foundation
[DUE #2011807](https://nsf.gov/awardsearch/showAward?AWD_ID=2011807).

[Steven Clontz](https://clontz.org) and
[Drew Lewis](http://drew-lewis.com) are the maintainers
of this project.

## Getting started

These materials are hosted at <http://calculus.tbil.org>.

Learn more at [TBIL.org](http://tbil.org) and join our community of instructors
and contributors!

## Copyright and Licensing

See [source/meta/copyright.ptx](source/meta/copyright.ptx).

## Authoring

The project is set up to use [GitHub Codespaces](https://github.com/features/codespaces)
to supporting authoring within the web browser, or a locally installed VS Code application.

Our codespace is set up to allow the authoring of our web and print targets using
the PreTeXt authoring toolkit described
[in the PreTeXt Guide](https://pretextbook.org/doc/guide/html/tutorial-github.html).

## Building exercise bank

Currently CheckIt is not set up to work with Codespaces, but the bank can still be
built.

```bash
/workspaces/linear-algebra# python scripts/bank.py
```

## Deploying to the public

These steps should be followed from the `main` branch only to ensure
only the accepted changes to the book are deployed to the public
at <http://calculus.tbil.org>.

1. `build web` target using PreTeXt
2. `build print` target using PreTeXt 
3. Build bank using `python scripts/bank.py`
    - One liner: `pretext build web && pretext build print && python scripts/bank.py`
4. `deploy` using PreTeXt
    - `pretext deploy --stage-only` can be used to stage what deployment will look like in `output/stage`
