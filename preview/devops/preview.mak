# ======================================
# Make Language Semantic Preview
# GNU Make
# ======================================


# ---------- Variables ----------

APP_NAME = AgentOS

CC = gcc

CFLAGS = -Wall -O2



# ---------- Source Files ----------

SOURCES = \
    main.c \
    engine.c \
    agent.c



OBJECTS = $(SOURCES:.c=.o)



# ---------- Default Target ----------

all: $(APP_NAME)



# ---------- Build Executable ----------

$(APP_NAME): $(OBJECTS)

	$(CC) $(OBJECTS) -o $(APP_NAME)



# ---------- Compile Objects ----------

%.o: %.c

	$(CC) $(CFLAGS) -c $< -o $@



# ---------- Variables Expansion ----------

show:

	@echo "Aplicação: $(APP_NAME)"

	@echo "Compilador: $(CC)"



# ---------- Conditional ----------

ifeq ($(DEBUG),1)

	CFLAGS += -g -DDEBUG

endif



# ---------- Function ----------

define MESSAGE

	echo "Build iniciado"

endef



# ---------- Custom Command ----------

build-info:

	$(MESSAGE)



# ---------- Clean ----------

clean:

	rm -f $(OBJECTS)

	rm -f $(APP_NAME)



# ---------- Install ----------

install:

	mkdir -p /usr/local/bin

	cp $(APP_NAME) /usr/local/bin/



# ---------- Phony Targets ----------

.PHONY: all clean install show build-info