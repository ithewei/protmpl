
CC = gcc
CXX = g++

MKDIR = mkdir -p
RM = rm -r
CP = cp -r

CFLAGS += -g -Wall -O3 
CXXFLAGS += $(CFLAGS) -std=c++11

INCDIR = include
LIBDIR = lib
SRCDIR = src
BINDIR = bin
DEPDIR = 3rd

TARGET = test
ifeq ($(OS),Windows_NT)
TARGET := $(addsuffix .exe, $(TARGET))
endif

DIRS += . $(SRCDIR) test
SRCS += $(foreach dir, $(DIRS), $(wildcard $(dir)/*.c $(dir)/*.cc $(dir)/*.cpp))
#OBJS := $(patsubst %.cpp, %.o, $(SRCS))
OBJS := $(addsuffix .o, $(basename $(SRCS)))

$(info TARGET=$(TARGET))
$(info DIRS=$(DIRS))
$(info SRCS=$(SRCS))
$(info OBJS=$(OBJS))

INCDIRS  += $(INCDIR) $(DEPDIR)/include $(DIRS)
CPPFLAGS += $(addprefix -I, $(INCDIRS))

LIBDIRS += $(LIBDIR) $(DEPDIR)/lib
LDFLAGS += $(addprefix -L, $(LIBDIRS))
LDFLAGS += -lpthread

$(info MAKE=$(MAKE))
$(info CC=$(CC))
$(info CXX=$(CXX))
$(info CPPFLAGS=$(CPPFLAGS))
$(info CFLAGS=$(CFLAGS))
$(info CXXFLAGS=$(CXXFLAGS))
$(info LDFLAGS=$(LDFLAGS))

default: all

all: prepare $(TARGET)

prepare:
	$(MKDIR) $(BINDIR)

$(TARGET): $(OBJS)
	$(CXX) $(CXXFLAGS) $(CPPFLAGS) $^ -o $(BINDIR)/$@ $(LDFLAGS)

clean:
	$(RM) $(OBJS)
	$(RM) $(BINDIR)
    
install:

uninstall:
    
.PHONY: default all prepare clean install uninstall


