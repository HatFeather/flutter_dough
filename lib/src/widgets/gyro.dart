part of dough;

/// Preferences applied to [GyroDough] widgets.
class GyroDoughPrefs extends Equatable {
  /// Creates raw [GyroDough] preferences, all values must be specified.
  const GyroDoughPrefs.raw({
    @required this.sampleCount,
    @required this.gyroMultiplier,
  })  : assert(sampleCount != null && sampleCount >= 2),
        super();

  /// Creates [GyroDough] preferences.
  factory GyroDoughPrefs({
    int sampleCount,
    double gyroMultiplier,
  }) {
    return GyroDoughPrefs.raw(
      sampleCount: sampleCount ?? 10,
      gyroMultiplier: gyroMultiplier ?? 100,
    );
  }

  /// Creates fallback [GyroDough] preferences.
  factory GyroDoughPrefs.fallback() => GyroDoughPrefs();

  /// The number of samples to use in the final gyro output. Higher
  /// values result in smoother gyro effects (slow-ish dough), lower
  /// values result in quick (and possibly more jagged) dough effects.
  ///
  /// A typical value would be something like `10`. The minimum accepted
  /// sample count is `2`.
  final int sampleCount;

  /// The value by which accelerometer values are multiplied. Higher
  /// [gyroMultiplier] values will result in [Dough] that is more
  /// sensitive to motion.
  ///
  /// A typical value would be something like `100`.
  final double gyroMultiplier;

  /// Copies these preferences with some new values.
  GyroDoughPrefs copyWith({
    int sampleCount,
    double gyroMultiplier,
  }) {
    return GyroDoughPrefs.raw(
      sampleCount: sampleCount ?? this.sampleCount,
      gyroMultiplier: gyroMultiplier ?? this.sampleCount,
    );
  }

  @override
  List<Object> get props => [
        sampleCount,
        gyroMultiplier,
      ];

  @override
  bool get stringify => true;
}

/// A widget that stretches its child in a dough-like fashion based
/// on physical device accelerometer inputs.
///
/// **This widget ONLY works on devices that have accelerometers.**
class GyroDough extends StatefulWidget {
  /// Creates a [GyroDough] widget.
  const GyroDough({
    Key key,
    this.child,
  }) : super(key: key);

  /// The child to stretch based on physical device motion.
  final Widget child;

  @override
  _GyroDoughState createState() => _GyroDoughState();
}

/// The state of a gyro dough widget which is used to track and interpret
/// accelerometer values.
class _GyroDoughState extends State<GyroDough> {
  final _controller = DoughController();

  List<Offset> _rollingSamples;
  Offset _rollingSum;
  int _rollingIndex;
  StreamSubscription<dynamic> _accelSub;

  @override
  void initState() {
    _controller.start(
      origin: Offset.zero,
      target: Offset.zero,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // final recipe = DoughRecipe.of(context).

      _rollingSamples = List<Offset>.filled(10, Offset.zero);
      _rollingSum = Offset.zero;
      _rollingIndex = 0;

      _accelSub = accelerometerEvents.listen(_onAccelEvent);
    });

    super.initState();
  }

  @override
  void dispose() {
    _accelSub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dough(
      controller: _controller,
      child: widget.child,
    );
  }

  void _onAccelEvent(AccelerometerEvent event) {
    setState(() {
      final sample = Offset(-event.x, event.y) * 100;

      _rollingIndex = (_rollingIndex + 1) % _rollingSamples.length;
      _rollingSum -= _rollingSamples[_rollingIndex];
      _rollingSamples[_rollingIndex] = sample;
      _rollingSum += sample;

      _controller.update(
        target: _rollingSum / _rollingSamples.length.toDouble(),
      );
    });
  }
}