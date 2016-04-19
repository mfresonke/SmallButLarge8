library ieee;
use ieee.std_logic_1164.all;

package SMALL8_LIB is

-- Primitive Types

constant WIDTH : positive := 8;
constant DOUBLE_WIDTH : positive := WIDTH * 2;

subtype std_vect is std_logic_vector(WIDTH-1 downto 0);
subtype double_std_vect is std_logic_vector(DOUBLE_WIDTH-1 downto 0);

type BUS_IN is array (integer range <>) of std_vect;
type DOUBLE_BUS_IN is array (integer range <>) of double_std_vect;

-- Midlevel Types (i.e. Instruction/State/Selection types)

type ALU_INSTRUCTION is (
  ADD,
  SUB,
  LOG_AND,
  LOG_OR,
  LOG_XOR,
  SL,
  SR,
  RL,
  RR
);

type status is record
  C   : std_logic;
  V   : std_logic;
  S   : std_logic;
  Z   : std_logic;
end record;

type status_controls is record
  C_en, V_en, S_en, Z_en : std_logic;
  C_set, C_clr : std_logic;
end record;

type SELECTION_BUS_EXTERNAL is (
  S_INPORT0,
  S_INPORT1,
  S_RAM,
  S_BUS_INTERNAL
);

-- Internal Bus

type SELECTION_BUS_INTERNAL is (
  S_A,
  S_D,
  S_R,
  S_EXTERNAL,
  S_PC_L,
  S_PC_H
);

type INT_REGIE_CONTROL is record
  A_en : std_logic;
  D_en : std_logic;
end record;

-- Aggregate Types. Groups everything else together.

type board_inputs is
  record
    inport0_raw_input, inport1_raw_input : std_vect;
    inport0_en, inport1_en : std_logic;
    inport0_rst, inport1_rst : std_logic;
  end record;

type board_outputs is
  record
    outport0, outport1 : std_vect;
  end record;

type controller_ext_datapath_controls is
  record
    -- Controller Selects
    bus_select : SELECTION_BUS_EXTERNAL;
    outport0_reg_en, outport1_reg_en : std_logic;
    ram_wren : std_logic;
  end record;

type controller_int_datapath_controls is
  record
    status_enables : STATUS_ENABLERS;
    bus_select : SELECTION_BUS_INTERNAL;
    regie_ctrl : INT_REGIE_CONTROL;
  end record;


-- Other Constants


-- Instructions --
-- Necessary for Part 1
constant LDAA : std_vect := X"88";
constant STAA : std_vect := X"F6";
constant STAR : std_vect := X"F1";
constant ADCR : std_vect := X"01";
constant ANDR : std_vect := X"21";
constant BCCA : std_vect := X"B0";
constant BEQA : std_vect := X"B2";
constant CLRC : std_vect := X"F9";

end package;
