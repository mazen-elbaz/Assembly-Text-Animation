# 🎞️ Text Animation in x86 Assembly

A simple yet fun program that takes user input and animates the text across the DOS screen in random directions and speeds using x86 Assembly.

## 🔧 How It Works
- Accepts text input from the user
- Takes a speed value (1–5)
- Animates the text left and right on the same line
- Randomized movement distance using DOS time interrupt
- ESC key to exit

## 🛠 Technologies Used
- x86 Assembly (TASM/NASM)
- DOS interrupts (`int 10h`, `int 21h`, `int 16h`)
- VGA text mode

## 🧠 What I Learned
- Register-level control of cursor
- Delay creation via CPU cycles
- Reading keystrokes and handling ASCII
- How to manipulate strings and directions in pure Assembly

## 📚 Academic Context
This project was developed during my **first year** at Zewail City as part of the *Computer Organization (SW 151)* course. It was my first hands-on experience writing low-level programs and interacting directly with hardware through Assembly.


## 🧑‍💻 Author
**Mazen Mohamed**

---

⚠️ For educational purposes only.
