︠eca647fe-f31b-4729-8a6a-0db0c381bd5ds︠
f1(x)=0 ; f2(x)=1
f = piecewise ([[(-pi,0),f1],[(0,pi),f2]])
S1 = f.fourier_series_partial_sum(1,pi)
g1 = plot(f,x,-pi,pi,color='red')
g1 += plot(S1,x,-pi,pi,color='blue')
g1
S1
︡9d14cefc-2411-4a6a-bc8e-bcd89ea41e74︡{"file":{"filename":"/projects/b4f48f3e-b9d7-4725-8cda-c7292f6627c4/.sage/temp/compute1-us/16343/tmp_Lyj4tK.svg","show":true,"text":null,"uuid":"1cfc52ec-7033-4e58-91dc-2f3408e15bb8"},"once":false}︡{"stdout":"1/2\n"}︡{"done":true}︡
︠be02d9e6-a471-4cf6-9875-45cf0d4af650s︠
S3 = f.fourier_series_partial_sum(3,pi)
g3 = plot(f,x,-pi,pi,color='red')
g3 += plot(S3,x,-pi,pi,color='blue')
g3
S3
︡54f55745-c32b-4918-bc66-24465dc33900︡{"file":{"filename":"/projects/b4f48f3e-b9d7-4725-8cda-c7292f6627c4/.sage/temp/compute1-us/16343/tmp_jJqdP3.svg","show":true,"text":null,"uuid":"870fc197-ebca-4a4d-bd35-3189aa74ece1"},"once":false}︡{"stdout":"2*sin(x)/pi + 1/2\n"}︡{"done":true}︡
︠904106ba-827e-4896-b247-84cd02ae7f41s︠
S5 = f.fourier_series_partial_sum(5,pi)
g5 = plot(f,x,-pi,pi,color='red')
g5 += plot(S5,x,-pi,pi,color='blue')
g5
S5
︡6296fa9b-c8e2-4ace-8805-23c6f699dd32︡{"file":{"filename":"/projects/b4f48f3e-b9d7-4725-8cda-c7292f6627c4/.sage/temp/compute1-us/16343/tmp_LtWoYV.svg","show":true,"text":null,"uuid":"ad39cf29-34c2-4003-8253-3911cb8b35f0"},"once":false}︡{"stdout":"2/3*sin(3*x)/pi + 2*sin(x)/pi + 1/2\n"}︡{"done":true}︡
︠4274862a-c372-4810-b15c-83292b5665a4s︠
S7 = f.fourier_series_partial_sum(7,pi)
g7 = plot(f,x,-pi,pi,color='red')
g7 += plot(S7,x,-pi,pi,color='blue')
g7
S7
︡011358d6-275f-416b-82dc-d4ee4ee39ccb︡{"file":{"filename":"/projects/b4f48f3e-b9d7-4725-8cda-c7292f6627c4/.sage/temp/compute1-us/16343/tmp_iDSSVm.svg","show":true,"text":null,"uuid":"07443989-9a8a-4842-9fb8-cb349b33d978"},"once":false}︡{"stdout":"2/5*sin(5*x)/pi + 2/3*sin(3*x)/pi + 2*sin(x)/pi + 1/2\n"}︡{"done":true}︡
︠72b43dc5-8890-4af6-8a2f-a062e49f6dc9s︠
S11 = f.fourier_series_partial_sum(11,pi)
g11 = plot(f,x,-pi,pi,color='red')
g11 += plot(S11,x,-pi,pi,color='blue')
g11
S11
︡6cc376bc-b8fa-4796-acd0-ace06795db5c︡{"file":{"filename":"/projects/b4f48f3e-b9d7-4725-8cda-c7292f6627c4/.sage/temp/compute1-us/16343/tmp_XDrXW3.svg","show":true,"text":null,"uuid":"638e47d9-a78d-4f72-9fd2-c51637f0727b"},"once":false}︡{"stdout":"2/9*sin(9*x)/pi + 2/7*sin(7*x)/pi + 2/5*sin(5*x)/pi + 2/3*sin(3*x)/pi + 2*sin(x)/pi + 1/2\n"}︡{"done":true}︡
︠c54b0b9e-8d99-480c-ab5c-4e87dd85d1a2s︠
S101 = f.fourier_series_partial_sum(101,pi)
g101 = plot(f,x,-pi,pi,color='red')
g101 += plot(S101,x,-pi,pi,color='blue')
g101
︡67a77869-a840-4d11-b4a0-107b69433329︡{"file":{"filename":"/projects/b4f48f3e-b9d7-4725-8cda-c7292f6627c4/.sage/temp/compute1-us/16343/tmp_bq7BPV.svg","show":true,"text":null,"uuid":"a97aa3e7-94cf-4962-acb4-4316cf7e7af7"},"once":false}︡{"done":true}︡









