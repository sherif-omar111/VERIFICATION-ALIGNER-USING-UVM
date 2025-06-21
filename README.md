# Verification for Aligner using UVM systemverilog
The Aligner module takes in an unaligned stream of data and outputs it as an aligned stream of data based on its configuration.
Its purpose is to optimize writes in memory by performing only the writes best suited for the type of memory used in the system.


## 1. Directories:
- rtl : rtl design
- tb/top            : hvl top.
- tb/test           : tests.
- tb/env            : Environment, scoreboard ...
- tb/agents         : active and passive agents.
- tb/sequences      : sequences.


## 2. System Architecture:
The aligner module uses two types of interfaces:

#### 1- A standard AMBA 3 APB for accessing the registers.
#### 2- Two interfaces using the same custom MD (Memory Data) protocol:

- An RX interface through which the Aligner receives the unaligned data.
- A TX interface through which the Aligner sends the aligned data.

![image]()

## 3. Interface signals:
| Signal name   | Signal width | Description                      
| ------------- | ------------ | -----------------------------------------------------------                                        
| clk           | Bit          | Clock signal on which the entire module is working.                  
| reset_n       | Bit          | Reset signal – active low.      
| psel          | Bit          | APB select.
| penable       | Bit          | APB enable.   
| pwrite        | Bit          | APB write.
| paddr         | [15:0]       | APB address.Bits paddr[1:0] are ignored and always treated as equal to 2’b00. This means that all accesses are treated as word (4 bytes) aligned.
| pwdata        | [31:0]       | APB write data.
| pready        | Bit          | APB ready.
| prdata        | [31:0]       | APB read data.
| pslverr       | Bit          | APB slave error.   
| md_rx_valid   | Bit          | MD RX valid. Once it becomes high, it must stay high until md_rx_ready becomes high.
| md_rx_data    | [31:0]       | MD RX data. It is valid while md_rx_valid is high. It must remain constant until md_rx_ready becomes high.
| md_rx_offset  | max(1, log2(ALGN_DATA_WIDTH/8))          | MD RX offset. It represents the offset, in bytes, on the md_rx_data bus, from which the valid data starts. It is valid while md_rx_valid is high. It must remain constant until md_rx_ready becomes high. Not all combinations of (offset, size) are legal. The following equations describes the legal combinations: ((ALGN_DATA_WIDTH / 8) + offset) % size == 0 (size + offset) <= (ALGN_DATA_WIDTH / 8)
| md_rx_size    | log2(ALGN_DATA_WIDTH/8)+1          | MD RX size. It represents the size, in bytes, of the valid data from the md_rx_data bus Value 0 is illegal – must never be used. It is valid while md_rx_valid is high. It must remain constant until md_rx_ready becomes high. Not all combinations of (offset, size) are legal. The following equations describes the legal combinations: ((ALGN_DATA_WIDTH / 8) + offset) % size == 0 (size + offset) <= (ALGN_DATA_WIDTH / 8)
| md_rx_ready   | Bit          | MD RX ready.
| md_rx_err     | Bit          | MD RX error. It is valid only when both md_rx_valid and md_rx_ready are high. Can be high only when md_rx_valid and md_rx_ready are high.
| md_tx_valid   | Bit       | MD TX valid. Once it becomes high, it must stay high until md_tx_ready becomes high.
| md_tx_data    | [31:0]       | MD TX data. It is valid while md_tx_valid is high. It must remain constant until md_tx_ready becomes high.
| md_tx_offset  | max(1, log2(ALGN_DATA_WIDTH/8))          | MD TX offset. It represents the offset, in bytes, on the md_tx_data bus, from which the valid data starts. It is valid while md_tx_valid is high. It must remain constant until md_tx_ready becomes high. Not all combinations of (offset, size) are legal. The following equations describes the legal combinations: ((ALGN_DATA_WIDTH / 8) + offset) % size == 0 (size + offset) <= (ALGN_DATA_WIDTH / 8)
| md_tx_size    | log2(ALGN_DATA_WIDTH/8)+1          | MD TX size. It represents the size, in bytes, of the valid data from the md_tx_data bus. Value 0 is illegal. It is valid while md_tx_valid is high. It must remain constant until md_tx_ready becomes high. Not all combinations of (offset, size) are legal. The following equations describes the legal combinations: ((ALGN_DATA_WIDTH / 8) + offset) % size == 0 (size + offset) <= (ALGN_DATA_WIDTH / 8)
| md_tx_ready   | Bit          | MD TX ready.
| md_tx_err     | Bit          | MD TX error. It is valid only when both md_tx_valid and md_tx_ready are high. Can be high only when md_tx_valid and md_tx_ready are high.   
| irq           | Bit          | Interrupt request. All the interrupt requests are ORed into this one-bit output signal.

## 4. UVM Architecture:

![image]()

## 5. Sequence items:


## 6. Sequences:

| Sequence                       |
| -----------------------------  |


## 7. Tests Scenarios:
| Test                          | Scenario                                                                                  |
| ----------------------------- | ----------------------------------------------------------------------------------------- |


![image]()

## 8. Assertions:


![image]()


## 9. Coverage:

### 9.1 Functional Coverage:
![image]()

### 9.2 Code Coverage:
![image]()