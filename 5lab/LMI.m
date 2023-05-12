clc;
clear all;

%������� ������������ �������� ������� x'(t)=Ax(t) � ������� 
%������� �������� V(x)=x'Px;

A=[-4 1; 1 -2];  %������ ������� A
n=2;             %������ ����������� �������

P=sdpvar(n);     %������ ������������ ������������ ������� P ������� nxn

TH=blkvar;       %��� ������� ������� ������� ���������� ��������� 
                 %�������
TH(1,1)=A'*P+P*A;%� ������ ������ � ��� ����� ���� ����
TH=sdpvar(TH);

%������ ��������� �����������. ��� ��� ��� � ��� �������, � ����� ��������
%� ���������� ������������, �� ���������� �� � ��������� ������� ��������
F=[TH<=-0.0001,P>=0.0001];
%������ ���������
options=sdpsettings('solver','sedumi','verbose',0);
%������ ������
sol=optimize(F)
%� ��������� ���� ������� ���������� � ���, ��������� �� �������� ���������
%����������. � ������ ������ �����: "info: 'Successfully solved'". 
%������ ������� ��������� ���������� ���������, � �������� ������� ���������.

 