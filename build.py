import logging, subprocess, shutil
from checkit.bank import Bank

print('generating assets')
subprocess.run(["pretext", "generate", "-t", "web", '--all-formats'])
subprocess.run(["pretext", "generate", "-t", "print", '--all-formats'])
print('building web')
subprocess.run(["pretext", "build", 'web'])
print('building instructor')
subprocess.run(["pretext", "build", 'web-instructor'])
print('building print')
subprocess.run(["pretext", "build", 'print'])

# FIXME
# print("regenerating exercises (no diagrams)")
# b = Bank("exercises")
# b.write_json(regenerate=True)
# print("building checkit viewer")
# b.build_viewer()
# shutil.copytree("exercises/docs","output/deploy/2022/exercises",dirs_exist_ok=True)
