.386
.model flat, stdcall
option casemap :none

.code
;>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
; dll ����ں���
;>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
DllEntry	proc

		mov eax, 1
		ret

DllEntry	Endp
;>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
ExitProcess	proc	uExitCode

		mov ebx, uExitCode
		mov eax, 1
		int 80h

ExitProcess	endp
;>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
GetStdHandle	proc	nStdHandle

		mov eax, 1
		ret 4

GetStdHandle	endp
;>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
WriteConsoleA	proc	hConsoleOutput, lpBuffer, nNumberOfCharsToWrite, lpNumberOfCharsWritten, lpReserved

		pushad
		mov edx, nNumberOfCharsToWrite		; ���������ַ�������
		mov ecx, lpBuffer			; ��������Ҫ��ʾ���ַ���
		mov ebx, hConsoleOutput			; ����һ���ļ�������(stdout) 
		mov eax, 4
		int 80h
		mov eax, lpNumberOfCharsWritten
		mov edx, nNumberOfCharsToWrite
		mov [eax], edx
		popad
		mov eax, 1
		ret 20

WriteConsoleA	endp
;>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
		End	DllEntry
