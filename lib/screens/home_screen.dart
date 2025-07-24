import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra superior do app
      appBar: AppBar(
        title: const Text('VipePlay'),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,

      // Conteúdo principal da tela
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Título da seção de músicas
          const Text(
            'Músicas',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),

          // Lista horizontal com músicas
          _horizontalMusicList(context),

          const SizedBox(height: 20),

          // Título da seção de álbuns
          const Text(
            'Álbuns',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),

          // Lista vertical com álbuns
          _verticalAlbumList(context),
        ],
      ),
    );
  }

  // Lista horizontal (Músicas)
  Widget _horizontalMusicList(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal, // Rolagem horizontal
        itemCount: 5,
        itemBuilder: (context, index) {
          return _musicCard(
            index: index + 1,
            context: context,
            isHorizontal: true,
            isAlbum: false, // tipo: música
          );
        },
      ),
    );
  }

  // Lista vertical (Álbuns)
  Widget _verticalAlbumList(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(), // Evita conflito de scroll
      shrinkWrap: true, // Faz a lista se adaptar ao conteúdo
      itemCount: 7,
      itemBuilder: (context, index) {
        return _musicCard(
          index: index + 1,
          context: context,
          isHorizontal: false,
          isAlbum: true, // tipo: álbum
        );
      },
    );
  }

  // Card genérico para música ou álbum
  Widget _musicCard({
    required int index,
    required BuildContext context,
    required bool isHorizontal,
    required bool isAlbum,
  }) {
    final titleText = isAlbum ? 'Álbum $index' : 'Música $index';

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 8.0),
      child: InkWell(
        // Ação ao tocar no item
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Clicou em $titleText'),
            ),
          );
        },
        child: Container(
          width: isHorizontal ? 130 : double.infinity, // Largura se for horizontal
          height: isHorizontal ? double.infinity : 120, // Altura se for vertical
          decoration: BoxDecoration(
            color: Colors.grey[900], // Cor do card
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 4,
                offset: const Offset(2, 2),
              ),
            ],
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Ícone da música/álbum
                Image.asset(
                  'assets/icon/son.png',
                  width: 60,
                  height: 60,
                ),
                const SizedBox(height: 8),

                // Nome do item
                Text(
                  titleText,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
