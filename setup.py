import os
import re
import shutil

path = os.getcwd()
words = []

file_name = "global.pot"

# Lista todos os arquivos com a extensão informada.
def list_file_by_extension_in_path(path, extension):
    file_path = []
    for root, _, files in os.walk(path):
        for filename in files:
            if not filename.endswith(extension) : continue
            file_path.append(os.path.join(root, filename))

    return file_path


# Faz a leitura dos arquivos encontrado linha por linha e retorna o valor da chave texto através de regex.
def read_file_by_extension_in_path(path, extension, keyword):
    for file_path in list_file_by_extension_in_path(path, extension):
        with open(file_path, "r", encoding="utf8") as file:
            file_content = file.readlines()
            
            for line in file_content:
                if not keyword in line: continue
                words.append(re.search('"([^"]+)"',line).group(1))
    
            file.close()

# Cria o arquivo de tradução caso não exista.
def create_file_by_extension_in_path(file):
    if not os.path.exists(file):
        file = open(file, "x")
        file.close()

def generate_file(file):
    file = open(file, "w")

    # Define o escopo inicial do arquivo.
    file.write("msgid " + '""')
    file.write("\n")
    file.write("msgstr " + '""')
    file.write("\n")
    file.write("\n")

    # Lista todas as palavras encontrada desde que não seja repetidas.
    for word in list(dict.fromkeys(words)):
        file.write("msgid " + '"' + word + '"')
        file.write("\n")
        file.write("msgstr " + '""')
        file.write("\n")
        file.write("\n")

    # Fecha a chamada do arquivo.
    file.close()

def move_generated_file():
    if(os.path.exists(file_name)):
        if os.path.exists("/features/i18n/" + file_name):
            os.remove(os.path.exists("/features/i18n/" + file_name))

        # Garante a exclusão do arquivo anterior caso exista.
        while os.path.exists(path + "/features/i18n/" + file_name):
            os.remove(path + "/features/i18n/" + file_name)

        # Move o arquivo gerado para o diretório de idiomas.
        shutil.move(path + "/" + file_name, path + "/features/i18n")


read_file_by_extension_in_path(path, ".tscn", "text")
create_file_by_extension_in_path(file_name)
generate_file(file_name)
move_generated_file()