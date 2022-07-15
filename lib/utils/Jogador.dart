// class Jogador {
//   final String? id;
//   final String? name;
//   final String? pontuacao;
//   final String? tempoDeJogo;

//   const Jogador({
//     this.id,
//     this.name,
//     this.pontuacao,
//     this.tempoDeJogo,
//   });

//   Jogador copy({
//     String? id,
//     String? name,
//     String? pontuacao,
//     String? tempoDeJogo,
//   }) =>
//       Jogador(
//         id: id ?? this.id,
//         name: name ?? this.name,
//         pontuacao: pontuacao ?? this.pontuacao,
//         tempoDeJogo: tempoDeJogo ?? this.tempoDeJogo,
//       );

//   static Jogador fromJson(Map<String, Object?> json) => Jogador(
//         id: json['id'] as String,
//         name: json['name'] as String,
//         pontuacao: json['pontuacao'] as String,
//         tempoDeJogo: json['tempoDeJogo'] as String,
//       );

//   Map<String, Object?> toJson() => <String, Object?>{
//         'id': id,
//         'name': name,
//         'pontuacao': pontuacao,
//         'tempoDeJogo': tempoDeJogo,
//       };
// }
