import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24.0, 32.0, 24.0, 0),
          child: Column(
            children: const <Widget>[
              HomeScreenHeader(),
              SizedBox(height: 36.0),
              Expanded(child: HomeScreenMain())
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 5,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.home_filled, color: Color(0xFF5142AB)),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.search, color: Color(0xFFD6D1D1)),
                onPressed: () {},
              ),
              const SizedBox(width: 46.0),
              IconButton(
                icon: const Icon(Icons.explore, color: Color(0xFFD6D1D1)),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.person, color: Color(0xFFD6D1D1)),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeScreenHeader extends StatelessWidget {
  const HomeScreenHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            Text(
              "Hi, Nam Duong",
              style: TextStyle(
                  color: Color(0xFF293032),
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0),
            ),
            SizedBox(height: 5.0),
            Text(
              "Wednesday 29 Dec",
              style: TextStyle(
                color: Color(0xFF5142AB),
                fontWeight: FontWeight.w500,
                fontSize: 16.0,
              ),
            )
          ],
        ),
        const HomeScreenUserAvatar()
      ],
    );
  }
}

class HomeScreenUserAvatar extends StatelessWidget {
  const HomeScreenUserAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(shape: BoxShape.circle),
      child: Image.asset("assets/images/user.jpeg"),
    );
  }
}

class HomeScreenMain extends StatelessWidget {
  const HomeScreenMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 200.0,
          child: Row(
            children: const <Widget>[
              Flexible(flex: 1, child: _HeartCard()),
              SizedBox(width: 20.0),
              Flexible(flex: 1, child: _WaterCard()),
            ],
          ),
        ),
        const SizedBox(height: 20.0),
        SizedBox(
          height: 300.0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Flexible(
                flex: 1,
                child: Column(
                  children: const <Widget>[
                    Flexible(flex: 3, child: _WalkCard()),
                    SizedBox(height: 20.0),
                    Flexible(flex: 2, child: _SleepCard()),
                  ],
                ),
              ),
              const SizedBox(width: 20.0),
              const Flexible(flex: 1, child: _CaloriesCard()),
            ],
          ),
        ),
        const SizedBox(height: 64.0),
      ],
    );
  }
}

class _HeartCard extends StatelessWidget {
  const _HeartCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: const Color(0xFF5142AB),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text(
                    "Heart",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Image.asset("assets/images/heart.png", width: 25)
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _WaterCard extends StatelessWidget {
  const _WaterCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(
          color: const Color(0xFFEDEFF7),
          width: 3.0,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text(
                "Water",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Image.asset("assets/images/water.png", width: 25)
            ],
          ),
          Image.asset("assets/images/water_big.png"),
          Row(
            children: const <Widget>[
              Text(
                "1.0",
                style: TextStyle(
                    color: Color(0xFF5142AB),
                    fontWeight: FontWeight.w700,
                    fontSize: 16.0),
              ),
              SizedBox(width: 3.0),
              Text(
                "liters",
                style: TextStyle(
                    color: Color(0xFFCFB9E4),
                    fontWeight: FontWeight.w500,
                    fontSize: 12.0),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _WalkCard extends StatelessWidget {
  const _WalkCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(
          color: const Color(0xFFEDEFF7),
          width: 3.0,
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text(
                "Walk",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Image.asset("assets/images/run.png", width: 25)
            ],
          ),
          Flexible(
            flex: 2,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                const SizedBox(
                  width: 75.0,
                  height: 75.0,
                  child: CircularProgressIndicator(
                    color: Color(0xFF5142AB),
                    backgroundColor: Color(0xFFF3F4F7),
                    strokeWidth: 5.54,
                    value: 0.67,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const <Widget>[
                    Text(
                      "5460",
                      style: TextStyle(
                          fontSize: 16.0,
                          color: Color(0xFF5142AB),
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "steps",
                      style: TextStyle(
                          fontSize: 12.0,
                          color: Color(0xFFA274CD),
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _SleepCard extends StatelessWidget {
  const _SleepCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(
          color: const Color(0xFFEDEFF7),
          width: 3.0,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text(
                "Sleep",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Image.asset("assets/images/bed.png", width: 25)
            ],
          ),
          Row(
            children: const <Widget>[
              Text(
                "06:32",
                style: TextStyle(
                    color: Color(0xFF5142AB),
                    fontWeight: FontWeight.w700,
                    fontSize: 16.0),
              ),
              SizedBox(width: 3.0),
              Text(
                "hours",
                style: TextStyle(
                    color: Color(0xFFCFB9E4),
                    fontWeight: FontWeight.w500,
                    fontSize: 12.0),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _CaloriesCard extends StatelessWidget {
  const _CaloriesCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, "/calories"),
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFFFFFF),
              Color(0xFFF2F3F9),
              Color(0xFFEDEFF7),
            ],
          ),
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(
            color: const Color(0xFFEDEFF7),
            width: 3.0,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 110,
              child: Image.asset("assets/images/calories_lines.png"),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text(
                        "Calories",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Image.asset("assets/images/calorie.png", width: 25)
                    ],
                  ),
                  Row(
                    children: const <Widget>[
                      Text(
                        "540",
                        style: TextStyle(
                          color: Color(0xFF5142AB),
                          fontWeight: FontWeight.w700,
                          fontSize: 16.0,
                        ),
                      ),
                      SizedBox(width: 3.0),
                      Text(
                        "kcal",
                        style: TextStyle(
                          color: Color(0xFFCFB9E4),
                          fontWeight: FontWeight.w500,
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
