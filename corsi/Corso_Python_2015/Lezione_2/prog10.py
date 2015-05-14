#!/usr/bin/env python3

print("\n".join("La parola {0} compare {1} volte".format(w, n) for w, n in sorted(__import__('functools').reduce(lambda d, w: dict(d, **{w: 1 if w not in d else d[w] + 1}), [x for x in [x.strip() for x in open("testo.txt").read().replace('\n', ' ').split(" ")] if x != ""], {}).items(), key=lambda x: x[1], reverse=True)))
