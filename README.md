# 📸 Mosaico Fotos PDF

Aplicativo que permite ao usuário tirar fotos com a câmera do dispositivo, montar dinamicamente um mosaico variando o tamanho de acordo com orientação (vertical ou horizontal) e, ao final, salvar esse mosaico como um arquivo PDF local e abri-lo diretamente no dispositivo.

---

## 🚀 Funcionalidades

✅ Tirar fotos usando a câmera  
✅ Montar um mosaico em grade com as fotos capturadas usando um componente desenvolvido por mim  
✅ Tirar um screenshot do mosaico montado  
✅ Gerar um arquivo PDF com o mosaico  
✅ Salvar o PDF no armazenamento interno do app  
✅ Feedback visual com SnackBars em todas as operações  
✅ Validação para o botão `Salvar PDF` que irá aparecer apenas se existir fotos atendendo o que foi solicitado  
✅ Uso de gestos de zoom e rotação com dois dedos para visualizar as fotos no mosaico com possibilidade de expandir a foto do mosaico para visualização detalhada e permitir zoom e rotação  
✅ Exibição do mosaico em grade adaptável, que muda o número de colunas dependendo da orientação do dispositivo (vertical ou horizontal)  
✅ Uso de pacotes do Flutter para facilitar a implementação das funcionalidades  
✅ Código modularizado e organizado, seguindo boas práticas de desenvolvimento  
✅ Interface amigável e intuitiva, com feedback visual para ações do usuário e além de uso de validação para garantir uma boa experiência  
✅ Possibilidade de abrir o PDF gerado diretamente no dispositivo após a criação  
✅ Possibilidade de definir o tamanho do mosaico de acordo com a quantidade de fotos tiradas, mantendo uma boa proporção e estética  
✅ Possilidade de remoção de fotos do mosaico, permitindo ao usuário gerenciar as imagens capturadas e isso deslizando a foto para a esquerda ou direita  
✅ Visualização única da foto do mosaico, permitindo ao usuário ver a imagem em tamanho real com opções de zoom e rotação (usando o pacote `photo_view`)  

---

## 📱 Tecnologias usadas

- **Flutter** (Dart)
- `image_picker`: para capturar fotos da câmera
- `screenshot`: para tirar a imagem do mosaico
- `pdf`: para gerar o documento PDF
- `path_provider`: para obter diretórios locais
- `open_file`: para abrir o PDF gerado
- `flutter_staggered_grid_view`: para exibir o mosaico em grade adaptável
- `photo_view`: para permitir zoom e rotação nas fotos do mosaico

---

## ⚙️ Como rodar o projeto

1. Clone ou baixe o projeto
2. No terminal, na pasta do projeto, execute:

```bash
flutter pub get
```

## 🚀 Como usar

1️⃣ Abra o app e clique em "Tirar Foto" para capturar imagens com a câmera.  
2️⃣ As fotos aparecerão automaticamente no mosaico em grade.  
3️⃣ Quando tiver pelo menos uma foto, o botão "Salvar em PDF" será habilitado.  
4️⃣ Clique em "Salvar em PDF" e será levado para a tela de salvar e abrir o PDF gerado.  

## 📍 Observações

- O PDF é salvo no diretório privado do app (não requer permissão de armazenamento e pode ser aberto por aplicativos como Adobe Acrobat Reader para Android e IOS).
- O mosaico é temporário, mantido apenas na memória enquanto o app estiver aberto.
- As fotos originais também não são salvas em galeria, somente usadas para o mosaico.  
NOTE: _O projeto está em conformidade com que foi solicitado via e-mail._
