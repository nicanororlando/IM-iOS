//
//  Cancion.swift
//  Instituto Misionero
//
//  Created by Nicanor Orlando on 19/10/2021.
//  Copyright © 2021 KnorDev. All rights reserved.
//

import Foundation
import SwiftUI

struct Cancion {
    var id: Int
    var name: String
    var favorite: Bool
}

///Clase para albergar a los programadores
///Con esto no podemos acceder a los programadores desde la listview, primero accederemos a este modelo
final class CancionesModelData: ObservableObject{
    
@Published var canciones =
    [
    Cancion(id: 1, name: "A ti, Jesús", favorite: false),
    Cancion(id: 2, name: "Abre mis ojos", favorite: false),
    Cancion(id: 3, name: "Abre mis ojos, Señor", favorite: false),
    Cancion(id: 4, name: "Agnus dei", favorite: false),
    Cancion(id: 5, name: "Alabaré", favorite: false),
    Cancion(id: 6, name: "Al encuentro de Jesús", favorite: false),
    Cancion(id: 7, name: "Alma misionera", favorite: false),
    Cancion(id: 8, name: "Alto, escúchame", favorite: false),
    Cancion(id: 9, name: "Alzaré mis ojos", favorite: false),
    Cancion(id: 10, name: "Amor, amor, amor, amor", favorite: false),
    Cancion(id: 11, name: "Amigo, ¿amas a Cristo?", favorite: false),
    Cancion(id: 12, name: "Arco iris", favorite: false),
    Cancion(id: 13, name: "Atardece", favorite: false),
    Cancion(id: 14, name: "Avancemos", favorite: false),
    Cancion(id: 15, name: "Blanqueado", favorite: false),
    Cancion(id: 16, name: "Brilla en mi", favorite: false),
    Cancion(id: 17, name: "Brilla, Jesús", favorite: false),
    Cancion(id: 18, name: "Brillar por ti", favorite: false),
    Cancion(id: 19, name: "Buscad primero", favorite: false),
    Cancion(id: 20, name: "Búscale hoy", favorite: false),
    Cancion(id: 21, name: "Cada día de mañana", favorite: false),
    Cancion(id: 22, name: "Cantad a Dios", favorite: false),
    Cancion(id: 23, name: "Cantaré de tu amor por siempre", favorite: false),
    Cancion(id: 24, name: "Canto de alegría", favorite: false),
    Cancion(id: 25, name: "Cerca de Jesús", favorite: false),
    Cancion(id: 26, name: "Como el ciervo", favorite: false),
    Cancion(id: 27, name: "Como las olas", favorite: false),
    Cancion(id: 28, name: "Cómo no cantar", favorite: false),
    Cancion(id: 29, name: "Conmigo estás", favorite: false),
    Cancion(id: 30, name: "Cristo joven", favorite: false),
    Cancion(id: 31, name: "Cual la quietud de un arroyo", favorite: false),
    Cancion(id: 32, name: "Cuán grande eres, Dios", favorite: false),
    Cancion(id: 33, name: "Cuando Cristo vino a mi corazón", favorite: false),
    Cancion(id: 34, name: "Cuando el pueblo de Dios ora", favorite: false),
    Cancion(id: 35, name: "Cuando miro los claros cielos", favorite: false),
    Cancion(id: 36, name: "Da una sonrisa", favorite: false),
    Cancion(id: 37, name: "Dad gloria al Señor", favorite: false),
    Cancion(id: 38, name: "Dame un nuevo corazón", favorite: false),
    Cancion(id: 39, name: "De gloria en gloria", favorite: false),
    Cancion(id: 40, name: "Demos gracias al Señor", favorite: false),
    Cancion(id: 41, name: "Descansar", favorite: false),
    Cancion(id: 42, name: "Después del rio", favorite: false),
    Cancion(id: 43, name: "Diez mil razones", favorite: false),
    Cancion(id: 44, name: "Digno eres", favorite: false),
    Cancion(id: 45, name: "Digno es el Señor", favorite: false),
    Cancion(id: 46, name: "Dios, alzamos hoy tu nombre", favorite: false),
    Cancion(id: 47, name: "Dios es nuestro amparo y fortaleza", favorite: false),
    Cancion(id: 48, name: "Él es Jehová el Señor", favorite: false),
    Cancion(id: 49, name: "El mejor lugar del mundo", favorite: false),
    Cancion(id: 50, name: "En mi caminar", favorite: false),
    Cancion(id: 51, name: "En momentos así", favorite: false),
    Cancion(id: 52, name: "Enciende una luz", favorite: false),
    Cancion(id: 53, name: "Eres mi refugio", favorite: false),
    Cancion(id: 54, name: "Eres mi respirar", favorite: false),
    Cancion(id: 55, name: "Eres mi todo", favorite: false),
    Cancion(id: 56, name: "Eres tú", favorite: false),
    Cancion(id: 57, name: "Es exaltado", favorite: false),
    Cancion(id: 58, name: "Espíritu Santo", favorite: false),
    Cancion(id: 59, name: "Éste es mi deseo", favorite: false),
    Cancion(id: 60, name: "Estoy en paz", favorite: false),
    Cancion(id: 61, name: "Fe en fuego", favorite: false),
    Cancion(id: 62, name: "Fiel en toda prueba", favorite: false),
    Cancion(id: 63, name: "Fija tus ojos en Cristo", favorite: false),
    Cancion(id: 64, name: "Grande es Jehová", favorite: false),
    Cancion(id: 65, name: "Hablar con Dios", favorite: false),
    Cancion(id: 66, name: "Hay mil millones de estrellas", favorite: false),
    Cancion(id: 67, name: "Hay una iglesia en el bosque", favorite: false),
    Cancion(id: 68, name: "He decidido seguir a Cristo", favorite: false),
    Cancion(id: 69, name: "Hermoso nombre", favorite: false),
    Cancion(id: 70, name: "Hoy aquí", favorite: false),
    Cancion(id: 71, name: "Jesús es mi vida", favorite: false),
    Cancion(id: 72, name: "Jesús mi guía es", favorite: false),
    Cancion(id: 73, name: "Jesús te ama", favorite: false),
    Cancion(id: 74, name: "Jesús, tú eres mi alegría", favorite: false),
    Cancion(id: 75, name: "La alegría", favorite: false),
    Cancion(id: 76, name: "La mañana gloriosa", favorite: false),
    Cancion(id: 77, name: "La sangre de Cristo Jesús", favorite: false),
    Cancion(id: 78, name: "Lado a lado", favorite: false),
    Cancion(id: 79, name: "Llévame a la cruz", favorite: false),
    Cancion(id: 80, name: "Majestuoso Dios", favorite: false),
    Cancion(id: 81, name: "Maranata", favorite: false),
    Cancion(id: 82, name: "Maravillas", favorite: false),
    Cancion(id: 83, name: "Maravilloso Dios", favorite: false),
    Cancion(id: 84, name: "Me siento bien", favorite: false),
    Cancion(id: 85, name: "Mensajero", favorite: false),
    Cancion(id: 86, name: "Mi Cristo me salva", favorite: false),
    Cancion(id: 87, name: "Mi Dios puede salvar", favorite: false),
    Cancion(id: 88, name: "Mi Dios, supremo Rey", favorite: false),
    Cancion(id: 89, name: "Mi reino", favorite: false),
    Cancion(id: 90, name: "Mira qué linda es la vida", favorite: false),
    Cancion(id: 91, name: "Mirad cuál amor", favorite: false),
    Cancion(id: 92, name: "Necesario", favorite: false),
    Cancion(id: 93, name: "No existe bien para mí", favorite: false),
    Cancion(id: 94, name: "No importa de dónde tú vengas", favorite: false),
    Cancion(id: 95, name: "No me olvidé de ti", favorite: false),
    Cancion(id: 96, name: "Nunca estés desanimado", favorite: false),
    Cancion(id: 97, name: "Oba oba", favorite: false),
    Cancion(id: 98, name: "Océanos", favorite: false),
    Cancion(id: 99, name: "Oh, amor de Dios", favorite: false),
    Cancion(id: 100, name: "Padre de amor", favorite: false),
    Cancion(id: 101, name: "Padre, yo te adoro", favorite: false),
    Cancion(id: 102, name: "Paso a paso", favorite: false),
    Cancion(id: 103, name: "Paz en la tormenta", favorite: false),
    Cancion(id: 104, name: "Pescador", favorite: false),
    Cancion(id: 105, name: "Poema de salvación", favorite: false),
    Cancion(id: 106, name: "Pon tus manos en las manos del Señor", favorite: false),
    Cancion(id: 107, name: "Por encima de todo", favorite: false),
    Cancion(id: 108, name: "Por eso alabamos", favorite: false),
    Cancion(id: 109, name: "Por eso le amo", favorite: false),
    Cancion(id: 110, name: "Por tu gracia y amor", favorite: false),
    Cancion(id: 111, name: "Príncipe de paz", favorite: false),
    Cancion(id: 112, name: "Promesa", favorite: false),
    Cancion(id: 113, name: "Queremos ver", favorite: false),
    Cancion(id: 114, name: "Queremos ver a Cristo regresar", favorite: false),
    Cancion(id: 115, name: "Quién dices que soy", favorite: false),
    Cancion(id: 116, name: "Quiero cantar una linda canción", favorite: false),
    Cancion(id: 117, name: "Rendid a Yahvé", favorite: false),
    Cancion(id: 118, name: "Renuévame", favorite: false),
    Cancion(id: 119, name: "Restaura", favorite: false),
    Cancion(id: 120, name: "Salmo 1", favorite: false),
    Cancion(id: 121, name: "Santo es el Señor", favorite: false),
    Cancion(id: 122, name: "Santo Espíritu", favorite: false),
    Cancion(id: 123, name: "Sé una luz", favorite: false),
    Cancion(id: 124, name: "Sentado estaba en mi barca", favorite: false),
    Cancion(id: 125, name: "Señor, aviva tu obra en mí", favorite: false),
    Cancion(id: 126, name: "Señor, tu gracia", favorite: false),
    Cancion(id: 127, name: "Sólo en ti", favorite: false),
    Cancion(id: 128, name: "Somos la luz", favorite: false),
    Cancion(id: 129, name: "Somos su voz", favorite: false),
    Cancion(id: 130, name: "Tal como soy", favorite: false),
    Cancion(id: 131, name: "Te exaltaré", favorite: false),
    Cancion(id: 132, name: "Tengo paz como un río", favorite: false),
    Cancion(id: 133, name: "Tomados de la mano", favorite: false),
    Cancion(id: 134, name: "Todopoderoso", favorite: false),
    Cancion(id: 135, name: "Tu amor me inundó", favorite: false),
    Cancion(id: 136, name: "Tu amor por mí", favorite: false),
    Cancion(id: 137, name: "Tu poder", favorite: false),
    Cancion(id: 138, name: "Tu santo nombre", favorite: false),
    Cancion(id: 139, name: "Tuyo soy", favorite: false),
    Cancion(id: 140, name: "Un millón", favorite: false),
    Cancion(id: 141, name: "Vamos a adorar", favorite: false),
    Cancion(id: 142, name: "Vaso de honra", favorite: false),
    Cancion(id: 143, name: "Ven a la cruz", favorite: false),
    Cancion(id: 144, name: "Ven, es tiempo de adorarle", favorite: false),
    Cancion(id: 145, name: "Vengo a adorarte", favorite: false),
    Cancion(id: 146, name: "Veré a Jesús", favorite: false),
    Cancion(id: 147, name: "Voy caminando", favorite: false),
    Cancion(id: 148, name: "Yo soy feliz", favorite: false),
    Cancion(id: 149, name: "Yo tengo esperanza", favorite: false),
    Cancion(id: 150, name: "Yo voy", favorite: false)]
}
