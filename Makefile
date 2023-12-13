CXX = g++
CXXFLAGS = -Wall 
LDFLAGS = -lm 
SRC_DIR = src
OBJ_DIR = obj
INC_DIR = include
BIN_DIR = bin
EXE = $(BIN_DIR)/pa10.out

SRCS = $(wildcard $(SRC_DIR)/*.cpp)
OBJS = $(patsubst $(SRC_DIR)/%.cpp, $(OBJ_DIR)/%.o, $(SRCS))

all: $(EXE)

$(EXE): $(OBJS) | $(BIN_DIR)
	$(CXX) -o $(EXE) $(OBJS) $(LDFLAGS)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp | $(OBJ_DIR)
	$(CXX) $(CXXFLAGS) -I$(INC_DIR) -o $@ -c $<

$(BIN_DIR):
	mkdir -p $(BIN_DIR)

$(OBJ_DIR):
	mkdir -p $(OBJ_DIR)

clean:
	rm -f $(EXE) $(OBJS)

.PHONY: all clean
