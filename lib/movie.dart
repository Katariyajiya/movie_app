class Movie{
  late final String title;
  late final String image;
  late final int index;

  Movie({
    required this.title,
    required this.image,
    required this.index});
}

List<Map<String,dynamic>> rawData =[
  {
    'title' : 'Finding Nemo',
    'image' : 'assets/images/findingNemo.jpeg',
    'index' : 1,
  },
  {
    'title' : 'Toy Story 4',
    'image' : 'assets/images/ToyStory.jpg',
    'index' : 2,
  },
  {
    'title' : 'The Lion King',
    'image' : 'assets/images/lion_king.jpg',
    'index' : 3,
  },
  {
    'title' : '  Minnions: The Rise of \n                    '
              ' Guru',
    'image' : 'assets/images/minnions_RiseOfTheGuru.jpg',
    'index' : 4,
  },
];