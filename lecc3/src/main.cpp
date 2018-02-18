#include "config.h"
#include <iostream>
#include <SFML/Graphics.hpp>

using namespace std;

bool isRunning;

void game(sf::RenderWindow& App) {
  sf::Texture texture;
  if(!texture.loadFromFile("spaceInvaders.png")) {
      cout << "No pude cargar la textura 'spaceInvaders.png'" << endl;
      return;
  }
  texture.setSmooth(false);
  texture.setRepeated(false);

  sf::Sprite playerSprite;
  playerSprite.setTexture(texture);
  playerSprite.setTextureRect(sf::IntRect(93,0,13,8));
  
  while (App.isOpen()) {
    App.clear(sf::Color::Black);
    
    sf::FloatRect sprRect = playerSprite.getLocalBounds();
    playerSprite.setPosition(sf::Vector2f((224 - sprRect.width)/2, 246 - sprRect.height));
    
    sf::Event Event;
    while (App.pollEvent(Event)) {
      if (Event.type == sf::Event::Closed) {
        App.close();
      }
    }
    
    App.draw(playerSprite);
    App.display();
  }
  isRunning = App.isOpen();
};

int main(int argc, char* argv[]) {
  // Code adapted from the SFML 2 "Window" example.
  cout << "Version " << VERSION_MAJOR << "." << VERSION_MINOR << endl;

  isRunning = true;

  sf::RenderWindow App(sf::VideoMode(224, 256), APP_NAME);
  
  while(isRunning) {
      game(App);
  }
}
