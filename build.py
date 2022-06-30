import logging, subprocess

print('generating assets')
subprocess.run(["pretext", "generate", "-t", "web", '--all-formats'])
subprocess.run(["pretext", "generate", "-t", "print", '--all-formats'])
print('building web')
subprocess.run(["pretext", "build", 'web'])
print('building instructor')
subprocess.run(["pretext", "build", 'web-instructor'])
print('building print')
subprocess.run(["pretext", "build", 'print'])
