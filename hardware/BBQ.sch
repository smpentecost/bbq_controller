EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Raspberry Pi Zero (W) uHAT BBQ Adapter Board"
Date "2020-11-15"
Rev "1.0"
Comp ""
Comment1 "This Schematic is licensed under MIT Open Source License."
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L power:GND #PWR0101
U 1 1 5C777805
P 4950 5000
F 0 "#PWR0101" H 4950 4750 50  0001 C CNN
F 1 "GND" H 4955 4827 50  0001 C CNN
F 2 "" H 4950 5000 50  0001 C CNN
F 3 "" H 4950 5000 50  0001 C CNN
	1    4950 5000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 5C777838
P 5850 5000
F 0 "#PWR0102" H 5850 4750 50  0001 C CNN
F 1 "GND" H 5855 4827 50  0001 C CNN
F 2 "" H 5850 5000 50  0001 C CNN
F 3 "" H 5850 5000 50  0001 C CNN
	1    5850 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5150 3350 4950 3350
Wire Wire Line
	4950 3350 4950 4150
Wire Wire Line
	5150 4150 4950 4150
Connection ~ 4950 4150
Wire Wire Line
	4950 4150 4950 4850
Wire Wire Line
	5150 4850 4950 4850
Connection ~ 4950 4850
Wire Wire Line
	4950 4850 4950 5000
Wire Wire Line
	5650 3150 5850 3150
Wire Wire Line
	5850 3150 5850 3550
Wire Wire Line
	5650 3550 5850 3550
Connection ~ 5850 3550
Wire Wire Line
	5850 3550 5850 3850
Wire Wire Line
	5650 3850 5850 3850
Connection ~ 5850 3850
Wire Wire Line
	5650 4350 5850 4350
Wire Wire Line
	5850 3850 5850 4350
Connection ~ 5850 4350
Wire Wire Line
	5850 4350 5850 4550
Wire Wire Line
	5650 4550 5850 4550
Connection ~ 5850 4550
Wire Wire Line
	5850 4550 5850 5000
$Comp
L power:+3.3V #PWR0103
U 1 1 5C777AB0
P 4900 2850
F 0 "#PWR0103" H 4900 2700 50  0001 C CNN
F 1 "+3.3V" H 4915 3023 50  0000 C CNN
F 2 "" H 4900 2850 50  0001 C CNN
F 3 "" H 4900 2850 50  0001 C CNN
	1    4900 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	4900 2950 4900 2850
Wire Wire Line
	5150 3750 4900 3750
Wire Wire Line
	4900 3750 4900 2950
Connection ~ 4900 2950
$Comp
L power:+5V #PWR0104
U 1 1 5C777E01
P 5950 2850
F 0 "#PWR0104" H 5950 2700 50  0001 C CNN
F 1 "+5V" H 5965 3023 50  0000 C CNN
F 2 "" H 5950 2850 50  0001 C CNN
F 3 "" H 5950 2850 50  0001 C CNN
	1    5950 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	5650 2950 5950 2950
Wire Wire Line
	5950 2950 5950 2850
Wire Wire Line
	5650 3050 5950 3050
Wire Wire Line
	5950 3050 5950 2950
Connection ~ 5950 2950
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 5C77824A
P 4500 2850
F 0 "#FLG0101" H 4500 2925 50  0001 C CNN
F 1 "PWR_FLAG" H 4500 3024 50  0000 C CNN
F 2 "" H 4500 2850 50  0001 C CNN
F 3 "~" H 4500 2850 50  0001 C CNN
	1    4500 2850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0105
U 1 1 5C778504
P 4550 5100
F 0 "#PWR0105" H 4550 4850 50  0001 C CNN
F 1 "GND" H 4555 4927 50  0001 C CNN
F 2 "" H 4550 5100 50  0001 C CNN
F 3 "" H 4550 5100 50  0001 C CNN
	1    4550 5100
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG0102
U 1 1 5C778511
P 4550 5050
F 0 "#FLG0102" H 4550 5125 50  0001 C CNN
F 1 "PWR_FLAG" H 4550 5224 50  0000 C CNN
F 2 "" H 4550 5050 50  0001 C CNN
F 3 "~" H 4550 5050 50  0001 C CNN
	1    4550 5050
	1    0    0    -1  
$EndComp
Wire Wire Line
	4550 5050 4550 5100
Wire Notes Line
	9250 5150 9250 5500
Wire Wire Line
	4900 2950 5150 2950
Wire Wire Line
	4500 2950 4500 2850
Wire Wire Line
	4500 2950 4900 2950
Text Label 4200 3050 0    50   ~ 0
GPIO2_SDA1
Text Label 4200 3150 0    50   ~ 0
GPIO3_SCL1
Text Label 4200 3250 0    50   ~ 0
GPIO4_GPIO_GCLK
Text Label 4200 3450 0    50   ~ 0
GPIO17_GEN0
Text Label 4200 3550 0    50   ~ 0
GPIO27_GEN2
Text Label 4200 3650 0    50   ~ 0
GPIO22_GEN3
Text Label 4200 3850 0    50   ~ 0
GPIO10_SPI_MOSI
Wire Wire Line
	4100 3850 5150 3850
Wire Wire Line
	4100 4350 5150 4350
Wire Wire Line
	4100 4450 5150 4450
Wire Wire Line
	4100 4550 5150 4550
Wire Wire Line
	4100 4650 5150 4650
Wire Wire Line
	4100 4750 5150 4750
Wire Wire Line
	4100 3650 5150 3650
Wire Wire Line
	4100 3550 5150 3550
Wire Wire Line
	4100 3450 5150 3450
Wire Wire Line
	4100 3250 5150 3250
Wire Wire Line
	4100 3150 5150 3150
Wire Wire Line
	4100 3050 5150 3050
Text Label 4200 3950 0    50   ~ 0
GPIO9_SPI_MISO
Text Label 4200 4050 0    50   ~ 0
GPIO11_SPI_SCLK
Text Label 4200 4250 0    50   ~ 0
ID_SD
Text Label 4200 4350 0    50   ~ 0
GPIO5
Text Label 4200 4450 0    50   ~ 0
GPIO6
Text Label 4200 4550 0    50   ~ 0
GPIO13
Text Label 4200 4650 0    50   ~ 0
GPIO19
Text Label 4200 4750 0    50   ~ 0
GPIO26
NoConn ~ 4100 3050
NoConn ~ 4100 3150
NoConn ~ 4100 3250
NoConn ~ 4100 3450
NoConn ~ 4100 3550
NoConn ~ 4100 3650
NoConn ~ 4100 3850
NoConn ~ 4100 4350
NoConn ~ 4100 4450
NoConn ~ 4100 4550
NoConn ~ 4100 4650
NoConn ~ 4100 4750
Text Label 6000 3250 0    50   ~ 0
GPIO14_TXD0
Text Label 6000 3350 0    50   ~ 0
GPIO15_RXD0
Text Label 6000 3450 0    50   ~ 0
GPIO18_GEN1
Text Label 6000 3650 0    50   ~ 0
GPIO23_GEN4
Text Label 6000 3750 0    50   ~ 0
GPIO24_GEN5
Text Label 6000 3950 0    50   ~ 0
GPIO25_GEN6
Text Label 6000 4050 0    50   ~ 0
GPIO8_SPI_CE0_N
Text Label 6000 4150 0    50   ~ 0
GPIO7_SPI_CE1_N
Text Label 6000 4250 0    50   ~ 0
ID_SC
Text Label 6000 4450 0    50   ~ 0
GPIO12
Text Label 6000 4650 0    50   ~ 0
GPIO16
Text Label 6000 4750 0    50   ~ 0
GPIO20
Text Label 6000 4850 0    50   ~ 0
GPIO21
Wire Wire Line
	5650 3250 6700 3250
Wire Wire Line
	5650 3350 6700 3350
Wire Wire Line
	5650 3450 6700 3450
Wire Wire Line
	5650 3650 6700 3650
Wire Wire Line
	5650 3750 6700 3750
Wire Wire Line
	5650 3950 6700 3950
Wire Wire Line
	5650 4250 6700 4250
Wire Wire Line
	5650 4450 6700 4450
Wire Wire Line
	5650 4650 6700 4650
Wire Wire Line
	5650 4750 6700 4750
NoConn ~ 6700 3250
NoConn ~ 6700 3350
NoConn ~ 6700 3450
NoConn ~ 6700 3650
NoConn ~ 6700 3750
NoConn ~ 6700 3950
NoConn ~ 6700 4250
NoConn ~ 6700 4450
NoConn ~ 6700 4650
NoConn ~ 6700 4750
NoConn ~ 6700 4850
Wire Wire Line
	5650 4850 6700 4850
$Comp
L Mechanical:MountingHole H1
U 1 1 5C7C4C81
P 9350 5650
F 0 "H1" H 9450 5696 50  0000 L CNN
F 1 "MountingHole" H 9450 5605 50  0000 L CNN
F 2 "lib:MountingHole_2.7mm_M2.5_uHAT_RPi" H 9350 5650 50  0001 C CNN
F 3 "~" H 9350 5650 50  0001 C CNN
	1    9350 5650
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H2
U 1 1 5C7C7FBC
P 9350 5850
F 0 "H2" H 9450 5896 50  0000 L CNN
F 1 "MountingHole" H 9450 5805 50  0000 L CNN
F 2 "lib:MountingHole_2.7mm_M2.5_uHAT_RPi" H 9350 5850 50  0001 C CNN
F 3 "~" H 9350 5850 50  0001 C CNN
	1    9350 5850
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H3
U 1 1 5C7C8014
P 9350 6050
F 0 "H3" H 9450 6096 50  0000 L CNN
F 1 "MountingHole" H 9450 6005 50  0000 L CNN
F 2 "lib:MountingHole_2.7mm_M2.5_uHAT_RPi" H 9350 6050 50  0001 C CNN
F 3 "~" H 9350 6050 50  0001 C CNN
	1    9350 6050
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H4
U 1 1 5C7C8030
P 9350 6250
F 0 "H4" H 9450 6296 50  0000 L CNN
F 1 "MountingHole" H 9450 6205 50  0000 L CNN
F 2 "lib:MountingHole_2.7mm_M2.5_uHAT_RPi" H 9350 6250 50  0001 C CNN
F 3 "~" H 9350 6250 50  0001 C CNN
	1    9350 6250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0106
U 1 1 5FB105B5
P 2150 7450
F 0 "#PWR0106" H 2150 7200 50  0001 C CNN
F 1 "GND" H 2155 7277 50  0000 C CNN
F 2 "" H 2150 7450 50  0001 C CNN
F 3 "" H 2150 7450 50  0001 C CNN
	1    2150 7450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0107
U 1 1 5FB1F68E
P 2450 7150
F 0 "#PWR0107" H 2450 7000 50  0001 C CNN
F 1 "+5V" H 2465 7323 50  0000 C CNN
F 2 "" H 2450 7150 50  0001 C CNN
F 3 "" H 2450 7150 50  0001 C CNN
	1    2450 7150
	1    0    0    -1  
$EndComp
$Comp
L Regulator_Linear:L7805 U1
U 1 1 5FB0BE80
P 2150 7150
F 0 "U1" H 2150 7392 50  0000 C CNN
F 1 "L7805" H 2150 7301 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Horizontal_TabDown" H 2175 7000 50  0001 L CIN
F 3 "http://www.st.com/content/ccc/resource/technical/document/datasheet/41/4f/b3/b0/12/d4/47/88/CD00000444.pdf/files/CD00000444.pdf/jcr:content/translations/en.CD00000444.pdf" H 2150 7100 50  0001 C CNN
	1    2150 7150
	1    0    0    -1  
$EndComp
$Comp
L Connector:Barrel_Jack_Switch J2
U 1 1 5FB36F46
P 1000 7250
F 0 "J2" H 1057 7567 50  0000 C CNN
F 1 "Barrel_Jack_Switch" H 1057 7476 50  0000 C CNN
F 2 "TestPoint:TestPoint_2Pads_Pitch5.08mm_Drill1.3mm" H 1050 7210 50  0001 C CNN
F 3 "~" H 1050 7210 50  0001 C CNN
	1    1000 7250
	1    0    0    -1  
$EndComp
Wire Wire Line
	1300 7250 1300 7350
$Comp
L power:GND #PWR0108
U 1 1 5FB3D055
P 1300 7350
F 0 "#PWR0108" H 1300 7100 50  0001 C CNN
F 1 "GND" H 1305 7177 50  0000 C CNN
F 2 "" H 1300 7350 50  0001 C CNN
F 3 "" H 1300 7350 50  0001 C CNN
	1    1300 7350
	1    0    0    -1  
$EndComp
Connection ~ 1300 7350
$Comp
L power:PWR_FLAG #FLG0103
U 1 1 5FB4732A
P 1550 7150
F 0 "#FLG0103" H 1550 7225 50  0001 C CNN
F 1 "PWR_FLAG" H 1550 7323 50  0000 C CNN
F 2 "" H 1550 7150 50  0001 C CNN
F 3 "~" H 1550 7150 50  0001 C CNN
	1    1550 7150
	1    0    0    -1  
$EndComp
Wire Wire Line
	1300 7150 1550 7150
Wire Wire Line
	1550 7150 1850 7150
Connection ~ 1550 7150
Wire Wire Line
	7750 3200 7750 3850
Wire Wire Line
	7650 2850 7650 3300
Wire Wire Line
	7350 3600 7350 4250
Wire Wire Line
	7550 3400 7550 4050
$Comp
L power:+5V #PWR01
U 1 1 5FB696AA
P 7650 2850
F 0 "#PWR01" H 7650 2700 50  0001 C CNN
F 1 "+5V" H 7665 3023 50  0000 C CNN
F 2 "" H 7650 2850 50  0001 C CNN
F 3 "" H 7650 2850 50  0001 C CNN
	1    7650 2850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR02
U 1 1 5FB6AE11
P 7750 4400
F 0 "#PWR02" H 7750 4150 50  0001 C CNN
F 1 "GND" H 7755 4227 50  0000 C CNN
F 2 "" H 7750 4400 50  0001 C CNN
F 3 "" H 7750 4400 50  0001 C CNN
	1    7750 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	7750 3850 7750 4400
Connection ~ 7750 3850
Wire Wire Line
	7450 3500 7800 3500
Wire Wire Line
	5650 4050 7450 4050
$Comp
L Motor:Motor_Servo M1
U 1 1 5FB8211B
P 3300 4350
F 0 "M1" H 3294 4694 50  0000 C CNN
F 1 "Motor_Servo" H 3294 4603 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 3300 4160 50  0001 C CNN
F 3 "http://forums.parallax.com/uploads/attachments/46831/74481.png" H 3300 4160 50  0001 C CNN
	1    3300 4350
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR04
U 1 1 5FB8413D
P 3600 4450
F 0 "#PWR04" H 3600 4200 50  0001 C CNN
F 1 "GND" V 3605 4322 50  0000 R CNN
F 2 "" H 3600 4450 50  0001 C CNN
F 3 "" H 3600 4450 50  0001 C CNN
	1    3600 4450
	0    -1   1    0   
$EndComp
$Comp
L power:+5V #PWR03
U 1 1 5FB8533F
P 3600 4350
F 0 "#PWR03" H 3600 4200 50  0001 C CNN
F 1 "+5V" V 3615 4478 50  0000 L CNN
F 2 "" H 3600 4350 50  0001 C CNN
F 3 "" H 3600 4350 50  0001 C CNN
	1    3600 4350
	0    1    1    0   
$EndComp
$Comp
L Connector_Generic:Conn_02x20_Odd_Even J1
U 1 1 5C77771F
P 5350 3850
F 0 "J1" H 5400 4967 50  0000 C CNN
F 1 "GPIO_CONNECTOR" H 5400 4876 50  0000 C CNN
F 2 "lib:PinSocket_2x20_P2.54mm_Vertical_Centered_Anchor" H 5350 3850 50  0001 C CNN
F 3 "~" H 5350 3850 50  0001 C CNN
	1    5350 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	7550 4050 7800 4050
Wire Wire Line
	7650 3950 7800 3950
Wire Wire Line
	7750 3850 7800 3850
$Comp
L Sensor_Temperature:MAX6675-Module U3
U 1 1 5FB5A8A0
P 8000 4050
F 0 "U3" H 8178 4101 50  0000 L CNN
F 1 "MAX6675-Module" H 8178 4010 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x05_P2.54mm_Vertical" H 8100 4350 50  0001 C CNN
F 3 "" H 8100 4350 50  0001 C CNN
	1    8000 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	7800 3600 7350 3600
Wire Wire Line
	7800 3400 7550 3400
Wire Wire Line
	7800 3200 7750 3200
$Comp
L Sensor_Temperature:MAX6675-Module U2
U 1 1 5FB502EB
P 8000 3400
F 0 "U2" H 8178 3451 50  0000 L CNN
F 1 "MAX6675-Module" H 8178 3360 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x05_P2.54mm_Vertical" H 8100 3700 50  0001 C CNN
F 3 "" H 8100 3700 50  0001 C CNN
	1    8000 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3600 4250 5150 4250
Wire Notes Line
	11100 5150 9250 5150
Wire Notes Line
	11100 5500 11100 5150
Wire Notes Line
	9250 5500 11100 5500
Text Notes 9300 5450 0    50   ~ 10
If back powering Pi with 5V \nNOTE that the Raspberry Pi 3B+ and Pi Zero \nand ZeroW do not include an input ZVD.
Wire Wire Line
	7650 3300 7800 3300
Connection ~ 7650 3300
Wire Wire Line
	7650 3300 7650 3950
Wire Wire Line
	7450 4050 7450 3500
Wire Wire Line
	5650 4150 7800 4150
Wire Wire Line
	3850 3950 3850 2500
Wire Wire Line
	3850 2500 7550 2500
Wire Wire Line
	7550 2500 7550 3400
Wire Wire Line
	3850 3950 5150 3950
Connection ~ 7550 3400
Wire Wire Line
	7350 4250 7800 4250
Wire Wire Line
	3950 4050 3950 2600
Wire Wire Line
	3950 2600 7350 2600
Wire Wire Line
	7350 2600 7350 3600
Wire Wire Line
	3950 4050 5150 4050
Connection ~ 7350 3600
$EndSCHEMATC
