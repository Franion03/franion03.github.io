class Project {
  final String name;
  final String description;
  final String image;
  final String link;
  Project(this.name, this.description, this.image, this.link);
}

List<Project> projectList = [
  Project(
    'Hyperespectral Images Classification',
    'A deep learning model for hyperspectral images classification using Convolutional Neural Networks (CNN) and Transfer Learning. The model is trained on the Indian Pines dataset and achieves an accuracy of 98.5% on the test set. The project is implemented in Python using TensorFlow and Keras libraries.In this project It is used the Tensorflow pipeline',
    'assets/images/image.png',
    'https://github.com/Franion03/Tfg_IA',
  ),
  Project(
    'Hyperespectral Images Handler',
    'A Python project which makes really easy the task of preprocess hyperspectral images. The project is implemented in Python using OpenCV and NumPy libraries.',
    'assets/images/car.png',
    'https://github.com/Franion03/Tfg_IA',
  ),
  Project(
    'List Handler in c',
    'A C program that, through a command-line interface, also known as CLI (Command Line Interface), allows performing operations with lists of numeric values (integers and floats). During the program execution, variables can be created and assigned a value, which will always be a list of numeric values (the list could be empty). Additionally, operations can be performed with these variables to calculate new values (lists) and/or create new variables or modify the value of an already created variable.',
    'assets/images/alarm.jpg',
    'https://github.com/Franion03/Programacion_1'),
];
