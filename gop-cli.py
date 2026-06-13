# gộp cli (bề nổi)
def code (link):
	r=requests.get(link)
	exec(r.text, globals())
import requests,os,sys,time,random,re 
print('1.Vào Go Lỏ FB PRO5 COOKIE')
print('2.Vào Login FB GET TOKEN/COOKIE')
print('3.CHUYỂN PRO5')
print('4.SETUP PY313 => PY312')
c=int(input('Choose: '))
if c == 1:
    code()
elif c == 2:
    code()
elif c == 3:
    code()
elif c == 4:
    os.system("curl -L https://raw.githubusercontent.com/Cacdume-wq/PYTHON-3.12/refs/heads/main/install-py312-by-none.sh | bash")
