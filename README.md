# 📸 Mosaico Fotos PDF

Um aplicativo Flutter para Android que permite ao usuário:

- Tirar fotos com a câmera do dispositivo
- Montar dinamicamente um mosaico com as fotos capturadas
- Salvar esse mosaico como um arquivo PDF local
- Abrir o PDF gerado diretamente no dispositivo

---

## 🚀 Funcionalidades

✅ Tirar fotos usando a câmera  
✅ Montar um mosaico em grade com as fotos capturadas usando um componente desenvolvido por mim  
✅ Tirar um screenshot do mosaico montado  
✅ Gerar um arquivo PDF com o mosaico  
✅ Salvar no armazenamento interno do app  
✅ Abrir o PDF após gerado  
✅ Feedback visual com SnackBars em todas as operações  
✅ Validação para o botão `Salvar PDF` que irá aparecer apenas se existir fotos atendendo o que foi solicitado

---

## 📱 Tecnologias usadas

- **Flutter** (Dart)
- `image_picker`: para capturar fotos da câmera
- `screenshot`: para tirar a imagem do mosaico
- `pdf`: para gerar o documento PDF
- `path_provider`: para obter diretórios locais
- `open_file`: para abrir o PDF gerado

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
