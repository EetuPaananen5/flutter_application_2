import 'package:flutter/material.dart';
import 'package:flutter_application_2/views/input_view.dart';

class TrainingProgramView extends StatelessWidget {
  const TrainingProgramView({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Training Programs'),
        actions: <Widget>[
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const InputView()),
                );
              },
              child: const Text('Workout List'),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Choose a training program!',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20.0),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                padding: const EdgeInsets.all(20.0),
                crossAxisSpacing: 20.0,
                mainAxisSpacing: 20.0,
                children: [
                  TrainingProgramButton(
                    title: 'ABS Workout',
                    image: 'images/abs.jpg',
                    programDetails:
                        "1. Do push-ups: 3 sets of 30 reps               ,"
                        "2.Do crunches: 3 sets of 30 reps.                  ,"
                        "3. Do squats: 3 sets of 20 reps                        ,"
                        " 4. Do lunges: 3 sets of 20 reps                         ,"
                        " 5. Do plank: 3 sets of 1 minute hold",
                  ),
                  TrainingProgramButton(
                    title: 'RUNNING Workout',
                    image: 'images/run.jpg',
                    programDetails:
                        "1. Do push-ups: 3 sets of 30 reps               ,"
                        "2.Do crunches: 3 sets of 30 reps.                  ,"
                        "3. Do squats: 3 sets of 20 reps                        ,"
                        " 4. Do lunges: 3 sets of 20 reps                         ,"
                        " 5. Do plank: 3 sets of 1 minute hold",
                  ),
                  TrainingProgramButton(
                    title: 'ARMS Workout',
                    image: 'images/arms.jpg',
                    programDetails:
                        "1. Do push-ups: 3 sets of 30 reps               ,"
                        "2.Do crunches: 3 sets of 30 reps.                  ,"
                        "3. Do squats: 3 sets of 20 reps                        ,"
                        " 4. Do lunges: 3 sets of 20 reps                         ,"
                        " 5. Do plank: 3 sets of 1 minute hold",
                  ),
                  TrainingProgramButton(
                    title: 'BACK Workout',
                    image: 'images/back.jpg',
                    programDetails:
                        "1. Do push-ups: 3 sets of 30 reps               ,"
                        "2.Do crunches: 3 sets of 30 reps.                  ,"
                        "3. Do squats: 3 sets of 20 reps                        ,"
                        " 4. Do lunges: 3 sets of 20 reps                         ,"
                        " 5. Do plank: 3 sets of 1 minute hold",
                  ),
                  TrainingProgramButton(
                    title: 'FULLBODY Workout',
                    image: 'images/fullbody.jpg',
                    programDetails:
                        "1. Do push-ups: 3 sets of 30 reps               ,"
                        "2.Do crunches: 3 sets of 30 reps.                  ,"
                        "3. Do squats: 3 sets of 20 reps                        ,"
                        " 4. Do lunges: 3 sets of 20 reps                         ,"
                        " 5. Do plank: 3 sets of 1 minute hold",
                  ),
                  TrainingProgramButton(
                    title: 'SHOULDER Workout',
                    image: 'images/shoulder.jpg',
                    programDetails:
                        "1. Do push-ups: 3 sets of 30 reps               ,"
                        "2.Do crunches: 3 sets of 30 reps.                  ,"
                        "3. Do squats: 3 sets of 20 reps                        ,"
                        " 4. Do lunges: 3 sets of 20 reps                         ,"
                        " 5. Do plank: 3 sets of 1 minute hold",
                  ),
                  TrainingProgramButton(
                    title: 'CROSSFIT Workout',
                    image: 'images/crossfit.jpg',
                    programDetails:
                        "1. Do push-ups: 3 sets of 30 reps               ,"
                        "2.Do crunches: 3 sets of 30 reps.                  ,"
                        "3. Do squats: 3 sets of 20 reps                        ,"
                        " 4. Do lunges: 3 sets of 20 reps                         ,"
                        " 5. Do plank: 3 sets of 1 minute hold",
                  ),
                  TrainingProgramButton(
                    title: 'HOME Workout',
                    image: 'images/home.jpg',
                    programDetails: """1. Do push-ups: 3 sets of 30 reps"
                                      2.Do crunches: 3 sets of 30 reps
                                      3. Do squats: 3 sets of 20 reps
                                      4. Do lunges: 3 sets of 20 reps
                                      5. Do plank: 3 sets of 1 minute hold""",
                  ),
                  TrainingProgramButton(
                    title: 'KETTLEBAR Workout',
                    image: 'images/KB.jpg',
                    programDetails: """1. Do push-ups: 3 sets of 30 reps"
                                      2.Do crunches: 3 sets of 30 reps
                                      3. Do squats: 3 sets of 20 reps
                                      4. Do lunges: 3 sets of 20 reps
                                      5. Do plank: 3 sets of 1 minute hold""",
                  ),
                  TrainingProgramButton(
                    title: 'CYCLE Workout',
                    image: 'images/cycle.jpg',
                    programDetails: """1. Do push-ups: 3 sets of 30 reps"
                                      2.Do crunches: 3 sets of 30 reps
                                      3. Do squats: 3 sets of 20 reps
                                      4. Do lunges: 3 sets of 20 reps
                                      5. Do plank: 3 sets of 1 minute hold""",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TrainingProgramButton extends StatelessWidget {
  final String title;
  final String image;
  final String programDetails;

  TrainingProgramButton({
    required this.title,
    required this.image,
    required this.programDetails,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TrainingProgramPage(
              title: title,
              image: image,
              programDetails: programDetails,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10.0),
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class TrainingProgramPage extends StatelessWidget {
  final String title;
  final String image;
  final String programDetails;

  TrainingProgramPage({
    required this.title,
    required this.image,
    required this.programDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 20.0),
            Text(
              programDetails,
              style: const TextStyle(fontSize: 20.0),
            ),
          ],
        ),
      ),
    );
  }
}
