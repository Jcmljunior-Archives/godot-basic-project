import os
import re
import shutil

path = os.getcwd()
words = []

file_name = "i18n.pot"

# Efetua uma busca por todos os arquivos contido em cada diretório relacionado a extensão informada.
def list_files_in_directory_by_extension(extension):
    list_files = []
    for root, _, files in os.walk(path):
       for file in files:
            if file.endswith(extension):
                list_files.append([
                    root,
                    file,
                ])

    return list_files

# Retorna o caminho base até as cenas.
def get_path_for_scene(path):
    return re.search('(?:features)\s*(.*$)', path).group(0)

# Retorna o valor da palavra chave encontrada.
def get_param_value(line):
    return re.search('"([^"]+)"', line).group(1)

# Efetua a leitura dos arquivos relacionado a extensão encontrado.
def read_files_in_directory_by_extension(extension, keyword):
    for file in list_files_in_directory_by_extension(extension):
        with open(os.path.join(get_path_for_scene(file[0]), file[1]), "r", encoding="utf8") as f:
            lines = f.readlines()
            f.close()

            for line in lines:
                if not keyword in line: continue
                words.append(get_param_value(line))
        break


# Cria o arquivo caso não exista.
def generate_file_in_path(file):
    file = open(file, "a" if not os.path.exists(file) else "w", encoding="utf8")

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

    file.close()

def move_generated_file(path):
    if os.path.exists(path):
        while os.path.exists(os.path.join("features", "i18n", path)):
            os.remove(os.path.join("features", "i18n", path))

        shutil.move(os.path.join(path), os.path.join("features", "i18n", path))

read_files_in_directory_by_extension(".tscn", "text")
generate_file_in_path(file_name)
move_generated_file(file_name)
