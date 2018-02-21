#include "config.h"
#include <iostream>
#include <SFML/Graphics.hpp>

using namespace std;

void game(sf::RenderWindow& App) {
  // Cargamos la textura.
  sf::Texture texture;
  if(!texture.loadFromFile("spaceInvaders.png")) {
      cout << "No pude cargar la textura 'spaceInvaders.png'" << endl;
      return;
  }
  // Que se vean bien los pixelacos si lo pintamos más grande.
  texture.setSmooth(false);
  // Que no se repita si el tamaño del sprite es mayor.
  texture.setRepeated(false);

  // Sprite del jugador.
  sf::Sprite playerSprite;
  // Establecemos la textura que acabamos de cargar.
  playerSprite.setTexture(texture);
  // Seleccionamos la parte de la textura que tiene la nave del jugador.
  playerSprite.setTextureRect(sf::IntRect(93,0,13,8));
  
  // Bucle del juego
  while (App.isOpen()) {
    App.clear(sf::Color::Black);
    
    // Colocamos la nave a 10 pixels del borde inferior, centrado en X.
    sf::FloatRect sprRect = playerSprite.getLocalBounds();
    playerSprite.setPosition(sf::Vector2f((224 - sprRect.width)/2, 246 - sprRect.height));
    
    sf::Event Event;
    while (App.pollEvent(Event)) {
      if (Event.type == sf::Event::Closed) {
        App.close();
      }
    }
    
    // Pintamos la nave y mostramos la pantalla.
    App.draw(playerSprite);
    App.display();
  }
};

int main(int argc, char* argv[]) {
  // Code adapted from the SFML 2 "Window" example.
  cout << "Version " << VERSION_MAJOR << "." << VERSION_MINOR << endl;
  sf::RenderWindow App(sf::VideoMode(224, 256), APP_NAME);
  game(App);
}
