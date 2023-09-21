from checkit.bank import Bank
import os
import subprocess
os.chdir("exercises/sandbox")
b = Bank()
print('generate exercises')
b.generate_exercises()
b.write_json()
b.build_viewer()
subprocess.run(['python', '-m', 'http.server', '-d', 'docs'])