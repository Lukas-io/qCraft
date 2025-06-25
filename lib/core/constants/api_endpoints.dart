class ApiEndpoints {
  static const baseApiUrl = "http://localhost:3000/";

  //-------------------- DOCUMENTS --------------------//
  static const uploadDocument = 'document/upload';
  static const document = 'document';

  //-------------------- QUIZ --------------------//
  static const quiz = 'quiz';
  static const createQuiz = 'quiz/create';
  static const generateQuiz = 'quiz/generate/{id}';
  static const evaluateQuiz = 'quiz/evaluate';
}
